package sdff {
    private import ScalarValues::Boolean;

    action installerSysteme {

        attribute installationDemandee : Boolean;
        attribute siteConforme : Boolean;
        attribute connexionsCorrectes : Boolean;
        attribute testReussi : Boolean;

        action verifierSite;
        action choisirAutreSite;
        action installerCapteurs;
        action installerCameras;
        action installerModuleRadio;
        action installerPasserelle;
        action connecterEquipements;
        action verifierConnexions;
        action demarrerSysteme;
        action testerFonctionnement;
        action identifierProblemes;
        action corrigerProblemes;
        action validerInstallation;

        decide decideSite;
        merge mergeSite;
        decide decideInstallation;
        merge mergeInstallation;
        merge mergeCorr;
        decide decideTest;

        first start;

        succession first start if installationDemandee then mergeSite;
        then verifierSite;
        then decideSite;
            if siteConforme then installerCapteurs;
            else choisirAutreSite;
        succession first choisirAutreSite then mergeSite;

        succession installerCapteurs then installerCameras;
        then installerModuleRadio;
        then installerPasserelle;
        then connecterEquipements;
        then mergeInstallation;
        then verifierConnexions;
        then decideInstallation;
            if connexionsCorrectes then demarrerSysteme;
            else mergeCorr;
        succession mergeCorr then corrigerProblemes;
        succession corrigerProblemes then mergeInstallation;
        succession demarrerSysteme then testerFonctionnement;

        then decideTest;
            if testReussi then validerInstallation;
            else identifierProblemes;
        succession identifierProblemes then mergeCorr;

        succession validerInstallation then done;
    }
}
