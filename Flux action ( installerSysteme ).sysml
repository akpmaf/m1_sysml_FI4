
package sdff {
    private import ScalarValues::Boolean;

    action installerSysteme {

        /* Conditions */
        attribute installationDemandee : Boolean;
        attribute siteConforme : Boolean;
        attribute equipementsInstalles : Boolean;
        attribute connexionsCorrectes : Boolean;
        attribute testReussi : Boolean;
        attribute correctionNecessaire : Boolean;

        /* Actions */
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

        /* Noeuds de controle */
        decide decideSite;
        merge mergeSite;

        decide decideInstallation;
        merge mergeInstallation;

        decide decideTest;
        merge mergeTest;

        first start;

        /* Debut de l'installation */
        succession start if installationDemandee
            then verifierSite;

        /* Verification du site */
        then decideSite;

            if siteConforme then mergeSite;
            if not siteConforme then choisirAutreSite;

        succession choisirAutreSite then verifierSite;

        /* Installation des equipements */
        succession mergeSite then installerCapteurs;
        then installerCameras;
        then installerModuleRadio;
        then installerPasserelle;

        /* Verification de l'installation */
        then connecterEquipements;
        then verifierConnexions;
        then decideInstallation;

            if connexionsCorrectes then mergeInstallation;
            if not connexionsCorrectes then corrigerProblemes;

        succession corrigerProblemes then verifierConnexions;

        /* Demarrage et test du systeme */
        succession mergeInstallation then demarrerSysteme;
        then testerFonctionnement;
        then decideTest;

            if testReussi then validerInstallation;
            if not testReussi then identifierProblemes;

        succession identifierProblemes then corrigerProblemes;

        succession validerInstallation then done;
    }
}
