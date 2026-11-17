package sdff {
    private import sdff::parts::*;

    package sequences {

        // S1 : exportation réussie
        occurrence exporterInformationS1 {
            part operateurQG : OperateurQG;
            part supervision : InterfaceSupervision;
            part passerelle : Passerelle;
            part reseau : ReseauCommunication;
            part infrastructureDistante : InfrastructureReceptionDistante;

            message demanderExportation of Commande from operateurQG to supervision;
            message demanderInformations of Commande from passerelle to reseau;
            message transmettreInformations of Informations from infrastructureDistante to reseau;
            message transmettreFichier of FichierExport from supervision to passerelle;
            message exporterFichier of FichierExport from passerelle to reseau;
            message relayerFichier of FichierExport from reseau to infrastructureDistante;
            message accuserExportation of AccuseReception from infrastructureDistante to reseau;
            message confirmerExportation of AccuseReception from reseau to passerelle;
            message notifierSucces of EtatSysteme from passerelle to supervision;
            message afficherConfirmation of EtatSysteme from supervision to operateurQG;
        }

        // S2 : échec d'exportation, message d'erreur, puis relance réussie
        occurrence exporterInformationS2 {
            part operateurQG : OperateurQG;
            part supervision : InterfaceSupervision;
            part passerelle : Passerelle;
            part reseau : ReseauCommunication;
            part infrastructureDistante : InfrastructureReceptionDistante;

            message demanderExportation1 of Commande from operateurQG to supervision;
            message demanderInformations1 of Commande from passerelle to reseau;
            message signalerIndisponibilite of Diagnostic from reseau to passerelle;
            message afficherMessageErreur of Diagnostic from supervision to operateurQG;
            message relancerExportation of Commande from operateurQG to supervision;
            message demanderInformations2 of Commande from passerelle to reseau;
            message transmettreInformations of Informations from infrastructureDistante to reseau;
            message transmettreFichier of FichierExport from supervision to passerelle;
            message exporterFichier of FichierExport from passerelle to reseau;
            message relayerFichier of FichierExport from reseau to infrastructureDistante;
            message confirmerExportation of AccuseReception from reseau to passerelle;
            message afficherConfirmation of EtatSysteme from supervision to operateurQG;
        }
    }
}
