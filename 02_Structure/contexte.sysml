package sdff {
    private import sdff::parts::*;

    part def ContexteGlobal {

        // ACTEURS
        part technicien : Technicien;
        part operateurQG : OperateurQG;
        part servicesSecours : ServicesSecours;
        part gardeNature : AgentForestier;
        part autorites : AutoritesLocales;

        // SYSTEME ETUDIE
        part systeme : DetectionFeuForet;

        // ENVIRONNEMENT
        part environnement : EnvironnementNaturel;
        part incendie : Incendie;
        part fumee : Fumee;
        part ventExterieur : Vent;
        part meteo : Meteo;

        // ENERGIE ET INFRASTRUCTURES EXTERIEURES
        part soleil : SourceEnergie;
        part infrastructureDistante : InfrastructureReceptionDistante;
        part reseau : ReseauCommunication;

        // INTERACTIONS SUR PORTS
        connect operateurQG.ihm to systeme.versOperateur;
        connect systeme.versReseau to reseau.coteSDFF;
        connect reseau.coteInfra to infrastructureDistante.entree;

        // LES SECOURS RECOIVENT L'ALERTE (sens corrige)
        connect infrastructureDistante.notification to servicesSecours.reception;

        // ENERGIE SOLAIRE : le soleil alimente les panneaux des noeuds
        connect soleil.sortie to systeme.noeud.moduleEnergie.panneauSolaire.lumiere;

        // INTERACTIONS AVEC LES ACTEURS SANS PORT DEDIE
        flow informe from systeme to autorites;
        flow informe from systeme to gardeNature;

        // INTERACTIONS AVEC L'ENVIRONNEMENT
        flow influence from environnement to systeme;
        flow detecte from incendie to systeme;
        flow detecte from fumee to systeme;
        flow influence from ventExterieur to systeme;
        flow influence from meteo to systeme;
    }
}
