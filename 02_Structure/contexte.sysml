package sdff {

    //ACTEURS 
    part def Operateur;
    part def ServicesSecours;
    part def AgentForestier;
    part def AutoritesLocales;

// ELEMENTS EXTERIEURS
    part def EnvironnementNaturel;
    part def PhenomenesNaturels;
    part def SourceEnergie;
    part def InfrastructureReceptionDistante;
    part def ReseauCommunication;

 // SYSTEME ETUDIE
    part def DetectionFeuForet :> sdff::parts::DetectionFeuForet;

    part def ContexteGlobal {

        // ACTEURS
        part technicien_de_maintenance : Operateur;
        part sapeur_pompier : ServicesSecours;
        part garde_nature : AgentForestier;
        part autorites : AutoritesLocales;

        // SYSTEME
        part sdff : DetectionFeuForet;

        // ENVIRONNEMENT
        part environnement : EnvironnementNaturel;
        part incendie : PhenomenesNaturels;
        part fumee : PhenomenesNaturels;
        part vent : PhenomenesNaturels;
        part conditions_meteo : PhenomenesNaturels;

        // ENERGIE EXTERIEURE
        part soleil : SourceEnergie;

        // INFRASTRUCTURES EXTERIEURES
        part infrastructureDistante : InfrastructureReceptionDistante;
        part reseau : ReseauCommunication;

        // INTERACTIONS AVEC LES ACTEURS
        flow utilise from sapeur_pompier to sdff;
        flow utilise from garde_nature to sdff;
        flow supervise from technicien_de_maintenance to sdff;
        flow informe from sdff to autorites;

        // INTERACTIONS AVEC L'ENVIRONNEMENT
        flow influence from environnement to sdff;
        flow detecte from incendie to sdff;
        flow detecte from fumee to sdff;
        flow influence from vent to sdff;
        flow influence from conditions_meteo to sdff;

        // INTERACTION ENERGETIQUE
        flow energie from soleil to sdff;

        // COMMUNICATION
        flow transmet from sdff to reseau;
        flow transmet from reseau to infrastructureDistante;
        flow transmet from infrastructureDistante to sdff;
        

    }
}
