package sdff {
    private import sdff::parts::*;

    package sequences {

        // S1 : installation nominale
        occurrence installerSystemeS1 {
            part technicien : Technicien;
            part supervision : InterfaceSupervision;
            part dispositif : DispositifDetection;
            part passerelle : Passerelle;
            part equipement : EquipementInstallation;

            message verifierSite from technicien to supervision;
            message confirmerSiteConforme of EtatSysteme from supervision to technicien;

            message installerCapteurs from technicien to dispositif;
            message installerCameras from technicien to dispositif;
            message installerModuleRadio from technicien to dispositif;
            message installerPasserelle from technicien to passerelle;

            message connecterEquipements from technicien to passerelle;
            message verifierConnexions from passerelle to dispositif;
            message confirmerConnexions of EtatDispositif from dispositif to passerelle;

            message demarrerSysteme from technicien to supervision;
            message testerFonctionnement from supervision to dispositif;
            message resultatTest of ResultatTest from dispositif to supervision;
            message validerInstallation of EtatSysteme from supervision to technicien;
        }

        // S2 : site non conforme, puis autre site
        occurrence installerSystemeS2 {
            part technicien : Technicien;
            part supervision : InterfaceSupervision;

            message verifierSite1 from technicien to supervision;
            message signalerSiteNonConforme of Diagnostic from supervision to technicien;
            message choisirAutreSite from technicien to supervision;
            message verifierSite2 from technicien to supervision;
            message confirmerSiteConforme of EtatSysteme from supervision to technicien;
        }

        // S3 : connexions incorrectes, puis correction
        occurrence installerSystemeS3 {
            part technicien : Technicien;
            part supervision : InterfaceSupervision;
            part dispositif : DispositifDetection;
            part passerelle : Passerelle;

            message connecterEquipements from technicien to passerelle;
            message verifierConnexions1 from passerelle to dispositif;
            message signalerConnexionDefaillante of Diagnostic from dispositif to passerelle;
            message corrigerProblemes from technicien to dispositif;
            message verifierConnexions2 from passerelle to dispositif;
            message confirmerConnexionsCorrectes of EtatDispositif from dispositif to passerelle;
        }

        // S4 : test échoué, puis correction et nouveau test
        occurrence installerSystemeS4 {
            part technicien : Technicien;
            part supervision : InterfaceSupervision;
            part dispositif : DispositifDetection;

            message demarrerSysteme from technicien to supervision;
            message testerFonctionnement1 from supervision to dispositif;
            message signalerEchecTest of ResultatTest from dispositif to supervision;
            message identifierProblemes from supervision to technicien;
            message corrigerProblemes from technicien to dispositif;
            message testerFonctionnement2 from supervision to dispositif;
            message confirmerTestReussi of ResultatTest from dispositif to supervision;
            message validerInstallation of EtatSysteme from supervision to technicien;
        }
    }
}
