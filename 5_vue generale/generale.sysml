package sdff {
    package parts {

        /*ETATS SYSTEME (payloads des messages)*/
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

        /* DEFINITIONS DES PORTS  */
        port def FluxMesures      { out item mesures : Mesures; }
        port def Alimentation     { out item courant : Energie; }
        port def Ensoleillement   { out item lumiere : Energie; }
        port def MesureEnergie    { out item niveau : NiveauEnergie; }
        port def MesureLiaison {
            out item qualite : QualiteLiaison;
            out item statutEnvoi : StatutEnvoi;
        }
        // Liaison radio, vue depuis le dispositif de détection
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
        // Liaison passerelle <-> réseau, vue depuis la passerelle
        port def LiaisonReseau {
            out item alerte : Alerte;
            out item fichierExport : FichierExport;
            in  item accuse : AccuseReception;
            in  item informations : Informations;
        }
        // Dialogue homme-machine, vue depuis l'opérateur
        port def DialogueIHM {
            out item commande : Commande;
            in  item etatSysteme : EtatSysteme;
            in  item diagnostic : Diagnostic;
            in  item listePannes : ListeDispositifsEnPanne;
            in  item resultatTest : ResultatTest;
        }
        port def Notification     { out item alerte : Alerte; }

        /*ACTEURS*/
        part def Operateur          { port ihm : DialogueIHM; }   // = « technicien » des séquences
        part def ServicesSecours    { port reception : ~Notification; }
        part def AgentForestier     { port reception : ~Notification; }
        part def AutoritesLocales   { port reception : ~Notification; }

        /*CONTEXTE */
        part def EnvironnementNaturel;
        part def PhenomenesNaturels;
        part def SourceEnergie { port sortie : Ensoleillement; }
        part def ReseauCommunication {
            port coteSDFF  : ~LiaisonReseau;
            port coteInfra : LiaisonReseau;
        }
        part def InfrastructureReceptionDistante {
            port entree : ~LiaisonReseau;
            port notification : Notification;
        }

        /*COMPOSANTS DECOUVERTS (decomposition materielle)*/
        part def SystemeCommunication;                 // famille : ModuleRadio et Passerelle
        part def EquipementInstallation;               // outillage de pose, HORS système opérationnel

        part def Capteurs;
        part def Cameras;
        part def Antenne;
        part def Batterie;
        part def PanneauSolaire { port lumiere : ~Ensoleillement; }

        part def DetecteurFeu {
            part capteurs : Capteurs [1..*];
            part cameras  : Cameras [0..*];
            port mesures : FluxMesures;
            port alim    : ~Alimentation;
        }

        part def UniteTraitement {
            port acquisition  : ~FluxMesures;
            port radio        : LiaisonRadio;
            port mesureLiaison: ~MesureLiaison;
            port niveauEnergie: ~MesureEnergie;
            port alim         : ~Alimentation;
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
        }

        part def DispositifDetection {
            part detecteur      : DetecteurFeu;
            part uniteTraitement: UniteTraitement;
            part moduleRadio    : ModuleRadio;
            part moduleEnergie  : ModuleEnergie;

            port liaison : LiaisonRadio;
            bind liaison = moduleRadio.liaison;

            // vue d'interconnexion interne
            connect detecteur.mesures        to uniteTraitement.acquisition;
            connect uniteTraitement.radio    to moduleRadio.interne;
            connect moduleRadio.mesure       to uniteTraitement.mesureLiaison;
            connect moduleEnergie.niveau     to uniteTraitement.niveauEnergie;
            connect moduleEnergie.alimDetecteur to detecteur.alim;
            connect moduleEnergie.alimUnite  to uniteTraitement.alim;
            connect moduleEnergie.alimRadio  to moduleRadio.alim;
        }

        part def Passerelle :> SystemeCommunication {
            port radio       : ~LiaisonRadio [1..*];
            port supervision : ~LiaisonSupervision;
            port reseau      : LiaisonReseau;
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

            // vue d'interconnexion niveau système 
            connect noeud.liaison            to passerelle.radio;
            connect passerelle.supervision   to supervision.passerelle;
        }
    }
}
