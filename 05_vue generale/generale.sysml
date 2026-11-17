package sdff {
    package parts {

        /* ETATS SYSTEME (payloads des messages) */
        item def Alerte;
        item def AccuseReception;
        item def StatutEnvoi;
        item def ListeDispositifsEnPanne;
        item def Diagnostic;
        item def ResultatTest;
        item def NiveauEnergie;
        item def QualiteLiaison;
        item def EtatDispositif;
        item def EtatSysteme;
        item def DispositifEnPanne;
        item def Commande;
        item def Mesures;
        item def Energie;
        item def Informations;
        item def FichierExport;
        item def Position;

        /* DEFINITIONS DES PORTS */
        port def FluxMesures      { out item mesures : Mesures; }
        port def Alimentation     { out item courant : Energie; }
        port def ChargeSolaire    { out item courant : Energie; }
        port def Ensoleillement   { out item lumiere : Energie; }
        port def MesureEnergie    { out item niveau : NiveauEnergie; }
        port def FluxLocalisation { out item position : Position; }
        port def MesureLiaison {
            out item qualite : QualiteLiaison;
            out item statutEnvoi : StatutEnvoi;
        }
        // Liaison radio, vue depuis le dispositif de detection
        port def LiaisonRadio {
            out item alerte : Alerte;
            out item etat : EtatDispositif;
            out item resultatTest : ResultatTest;
            in  item accuse : AccuseReception;
            in  item commande : Commande;
        }
        // Liaison passerelle <-> supervision, vue depuis la supervision
        port def LiaisonSupervision {
            in  item etatSysteme : EtatSysteme;
            in  item listePannes : ListeDispositifsEnPanne;
            in  item diagnostic : Diagnostic;
            in  item resultatTest : ResultatTest;
            in  item panne : DispositifEnPanne;
            out item commande : Commande;
            out item fichierExport : FichierExport;
        }
        // Liaison passerelle <-> reseau, vue depuis la passerelle
        port def LiaisonReseau {
            out item alerte : Alerte;
            out item fichierExport : FichierExport;
            in  item accuse : AccuseReception;
            in  item informations : Informations;
        }
        // Dialogue homme-machine, vu depuis le poste operateur
        port def DialogueIHM {
            out item commande : Commande;
            in  item etatSysteme : EtatSysteme;
            in  item diagnostic : Diagnostic;
            in  item listePannes : ListeDispositifsEnPanne;
            in  item resultatTest : ResultatTest;
        }
        port def Notification { out item alerte : Alerte; }

        /* ACTEURS (jeu unique, repris partout) */
        part def OperateurQG      { port ihm : DialogueIHM; }
        part def Technicien       { port ihm : DialogueIHM; }
        part def ServicesSecours  { port reception : ~Notification; }
        part def AgentForestier   { port reception : ~Notification; }
        part def AutoritesLocales { port reception : ~Notification; }

        /* ENVIRONNEMENT */
        part def EnvironnementNaturel;
        part def PhenomenesNaturels;
        part def Incendie :> PhenomenesNaturels;
        part def Fumee    :> PhenomenesNaturels;
        part def Vent     :> PhenomenesNaturels;
        part def Meteo    :> PhenomenesNaturels;
        part def SourceEnergie { port sortie : Ensoleillement; }
        part def ReseauCommunication {
            port coteSDFF  : ~LiaisonReseau;
            port coteInfra : LiaisonReseau;
        }
        part def InfrastructureReceptionDistante {
            port entree : ~LiaisonReseau;
            port notification : Notification;
        }

        /* COMPOSANTS MATERIELS */
        part def SystemeCommunication;   // famille : ModuleRadio et Passerelle
        part def EquipementInstallation; // outillage de pose, HORS systeme operationnel

        part def Boitier;
        part def SystemeFixation;
        part def Antenne;
        part def Cameras;
        part def CapteurFumee;
        part def CapteurTemperature;
        part def CapteurHumidite;
        part def CapteurVent;
        part def ModuleLocalisation { port position : FluxLocalisation;}
        part def LogicielAnalyse;

        part def Batterie { port stockage : ~ChargeSolaire; }
        part def PanneauSolaire {
            port lumiere : ~Ensoleillement;
            port charge : ChargeSolaire;
        }

        part def DetecteurFeu {
            part capteurFumee       : CapteurFumee;
            part capteurTemperature : CapteurTemperature;
            part capteurHumidite    : CapteurHumidite;
            part capteurVent        : CapteurVent;
            part cameras            : Cameras [0..*];
            port mesures : FluxMesures;
            port alim    : ~Alimentation;
        }

        part def UniteTraitement {
            part logicielAnalyse : LogicielAnalyse;
            port acquisition   : ~FluxMesures;
            port radio         : LiaisonRadio;
            port localisation  : ~FluxLocalisation;
            port mesureLiaison : ~MesureLiaison;
            port niveauEnergie : ~MesureEnergie;
            port alim          : ~Alimentation;
        }

        part def ModuleRadio :> SystemeCommunication {
            part antenne : Antenne;
            port interne : ~LiaisonRadio;
            port liaison : LiaisonRadio;
            port mesure  : MesureLiaison;
            port alim    : ~Alimentation;
        }

        part def ModuleEnergie {
            part batterie       : Batterie;
            part panneauSolaire : PanneauSolaire;
            port alimDetecteur : Alimentation;
            port alimUnite     : Alimentation;
            port alimRadio     : Alimentation;
            port niveau        : MesureEnergie;

            // recharge de la batterie par le panneau solaire
            connect panneauSolaire.charge to batterie.stockage;
        }

        part def DispositifDetection {
            part boitier         : Boitier;
            part systemeFixation : SystemeFixation;
            part detecteur       : DetecteurFeu;
            part uniteTraitement : UniteTraitement;
            part moduleRadio     : ModuleRadio;
            part moduleEnergie   : ModuleEnergie;
            part localisation    : ModuleLocalisation;

            port liaison : LiaisonRadio;
            port config  : ~DialogueIHM;
            bind liaison = moduleRadio.liaison;

            // vue d'interconnexion interne
            connect detecteur.mesures           to uniteTraitement.acquisition;
            connect uniteTraitement.radio       to moduleRadio.interne;
            connect moduleRadio.mesure          to uniteTraitement.mesureLiaison;
            connect localisation.position       to uniteTraitement.localisation;
            connect moduleEnergie.niveau        to uniteTraitement.niveauEnergie;
            connect moduleEnergie.alimDetecteur to detecteur.alim;
            connect moduleEnergie.alimUnite     to uniteTraitement.alim;
            connect moduleEnergie.alimRadio     to moduleRadio.alim;
        }

        part def Passerelle :> SystemeCommunication {
            part moduleEnergie : ModuleEnergie;
            port radio        : ~LiaisonRadio [1..*];
            port supervision  : ~LiaisonSupervision;
            port reseau       : LiaisonReseau;
            port alimentation : ~Alimentation;

            // la passerelle a sa propre energie (elle est loin de tout reseau)
            connect moduleEnergie.alimRadio to alimentation;
        }

        part def InterfaceSupervision {
            port passerelle : LiaisonSupervision;
            port operateur  : ~DialogueIHM;
        }

        /* SYSTEME ETUDIE */
        part def DetectionFeuForet {
            part noeud       : DispositifDetection [1..*];
            part passerelle  : Passerelle;
            part supervision : InterfaceSupervision;

            port versReseau    : LiaisonReseau;
            port versOperateur : ~DialogueIHM;
            bind versReseau    = passerelle.reseau;
            bind versOperateur = supervision.operateur;

            // vue d'interconnexion niveau systeme
            connect noeud.liaison          to passerelle.radio;
            connect passerelle.supervision to supervision.passerelle;
        }
    }
}
