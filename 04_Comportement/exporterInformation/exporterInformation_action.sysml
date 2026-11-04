package SDFF {

    private import ScalarValues::Boolean;

    action exporterInformation {

        attribute demandeExportation : Boolean;
        attribute exportationReussie : Boolean;

        // ACTIONS
        action recevoirDemandeExportation;
        action selectionnerInformations;
        action verifierInformations;
        action preparerFichier;
        action exporterFichier;
        action transmettreFichier;
        action confirmerExportation;
        action afficherMessageErreur;

        // DECISION ET REPRISE
        decide decisionExportation;
        merge repriseExportation;

        // DEBUT DU PROCESSUS
        first start;

        then recevoirDemandeExportation;
        then selectionnerInformations;
        then verifierInformations;
        then preparerFichier;
        then exporterFichier;
        then decisionExportation;

        // SI L'EXPORTATION REUSSIT
        if exportationReussie then transmettreFichier;
        then confirmerExportation;
        then done;

        // SI L'EXPORTATION ECHOUE
        if not exportationReussie then afficherMessageErreur;
        then repriseExportation;

        // REPRISE DE L'EXPORTATION
        succession repriseExportation then selectionnerInformations;
    }
}