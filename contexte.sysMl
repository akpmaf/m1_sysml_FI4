package SDFF {

    //ACTEURS 
    part def Operateur;
    part def ServicesSecours;





    //CONTEXTES
    part def DetectionFeuForet;
    part def EnvironnementNaturel;
    part def SourceEnergie;
    part def InfrastructureReceptionDistante;
    part def Localisation;
    part def Alarmes;

    

    part def ContexteGlobal {

        part technicien_de_maintenance : Operateur;
        part sapeur_pompier : ServicesSecours;
        part sdff : DetectionFeuForet;    
        part garde_nature : ServicesSecours;
   
        
        part environnement : EnvironnementNaturel;
        part conditions_meteo : EnvironnementNaturel;
        part soleil : SourceEnergie;
        part batterie : SourceEnergie;
        part infrastructureDistante : InfrastructureReceptionDistante;
        part Gps : Localisation;
        part siren_sonore : Alarmes ;

        flow utilise from sapeur_pompier to sdff;
        flow utilise from garde_nature to sdff;
        flow maintien from technicien_de_maintenance to sdff;
        flow Expose from environnement to sdff;

        flow fournis from conditions_meteo to sdff;
        flow alimente from soleil to sdff;
        flow alimente from batterie to sdff;
        flow transmet from sdff to infrastructureDistante;
        flow transmet from infrastructureDistante to sdff;
        flow localise from Gps to  sdff; 

    }
}