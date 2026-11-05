package SDFF {
    package parts {

        /* Acteurs */
        part def Acteur;
        part def Technicien :> Acteur;
        part def OperateurQG :> Acteur;
        part def Pompier :> Acteur;
        part def AgentForestier :> Acteur;
        part def AutoritesLocales :> Acteur;

        /* Environnement */
        part def EnvironnementForestier;
        part def Arbre;
        part def Fumee;
        part def SourceChaleur;
        part def Soleil;
        part def ConditionsMeteorologiques;

        /* Système principal */
        part def SystemeDetectionFeuxForet;

        /* Dispositif de détection */
        part def DispositifDetection;
        part def CapteurFumee;
        part def CapteurTemperature;
        part def ModuleGPS;
        part def UniteTraitement;
        part def ModuleRadio;
        part def ModuleEnergie;
        part def Batterie;
        part def PanneauSolaire;
        part def SystemeFixation;

        /* Communication */
        part def Passerelle;
        part def ReseauIP;

        /* Infrastructure distante */
        part def InfrastructureDistante;
        part def ServeurAlerte;
        part def BaseHistorique;
        part def ServiceNotification;

        /* Supervision */
        part def InterfaceSupervision;
        part def TableauDeBord;
        part def ServiceExport;
    }
}