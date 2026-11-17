package sdff {
    private import ScalarValues::Boolean;

    action exporterInformation {

        attribute exportationReussie : Boolean;
        attribute essaisEpuises : Boolean;

        action recevoirDemandeExportation;
        action selectionnerInformations;
        action verifierInformations;
        action preparerFichier;
        action exporterFichier;
        action transmettreFichier;
        action confirmerExportation;
        action afficherMessageErreur;
        action abandonnerExportation;

        decide decisionExportation;
        merge mergeSelection;

        first start;
        then recevoirDemandeExportation;
        then mergeSelection;
        then selectionnerInformations;
        then verifierInformations;
        then preparerFichier;
        then exporterFichier;
        then decisionExportation;
            if exportationReussie then transmettreFichier;
            if essaisEpuises then abandonnerExportation;
            else afficherMessageErreur;
        succession first afficherMessageErreur then mergeSelection;
        succession first abandonnerExportation then done;
        succession first transmettreFichier then confirmerExportation;
        succession first confirmerExportation then done;
    }
}
