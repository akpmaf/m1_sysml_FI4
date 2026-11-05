package sdff {

    private import sdff::*;
part def  Operateur;
    part def PhenomenesNaturels;
    part def DetectionFeuForet;
    part def InfrastructureReceptionDistante;
    part def ReseauCommunication;

    package sequences {

        occurrence exporterInformation {

            // ACTEUR
            part operateur : Operateur;

            // SYSTEME
            part systeme : DetectionFeuForet;

            // INFRASTRUCTURE
            part infrastructureDistante : InfrastructureReceptionDistante;
            part reseau : ReseauCommunication;

            // DEMANDE D'EXPORTATION
            message demanderExportation
                from operateur to systeme;

            // SELECTION ET PREPARATION
            message demanderSelectionInformations
                from systeme to infrastructureDistante;

            message transmettreInformations
                from infrastructureDistante to systeme;

            // EXPORTATION
            message preparerFichier
                from systeme to systeme;

            message transmettreFichier
                from systeme to reseau;

            message exporterFichier
                from reseau to infrastructureDistante;

            // CONFIRMATION
            message confirmerExportation
                from infrastructureDistante to reseau;

            message notifierExportation
                from systeme to operateur;
        }
    }
}