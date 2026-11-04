
package sdff {
    private import sdff::parts::*;

    part def Capteurs;
    part def Cameras;
    part def SystemeCommunication;
    part def EquipementInstallation;

    package sequences {

        // Scenario 1 : installation du systeme de detection
        occurrence installerSystemeS1 {

            part technicien : Technicien;
            part systeme : SystemeDetectionFeu;
            part equipement : EquipementInstallation;
            part capteurs : Capteurs;
            part cameras : Cameras;
            part communication : SystemeCommunication;

            // Demarrage de l'installation
            message installerSysteme
                from technicien to systeme;

            message demanderVerification
                from technicien to systeme;

            message confirmerSite
                from systeme to technicien;

            // Installation des equipements
            message installer of EquipementInstallation
                from technicien to equipement;

            message installerCapteurs
                from equipement to capteurs;

            message installerCameras
                from equipement to cameras;

            message installerCommunication
                from equipement to communication;

            // Connexion des equipements
            message connecterCapteurs
                from capteurs to systeme;

            message connecterCameras
                from cameras to systeme;

            message connecterCommunication
                from communication to systeme;

            // Verification du fonctionnement
            message verifierCapteurs
                from systeme to capteurs;

            message verifierCameras
                from systeme to cameras;

            message verifierCommunication
                from systeme to communication;

            message from capteurs to systeme;
            message from cameras to systeme;
            message from communication to systeme;

            // Validation de l'installation
            message validerInstallation
                from systeme to technicien;

            message terminerInstallation
                from technicien to systeme;
        }
    }
}
