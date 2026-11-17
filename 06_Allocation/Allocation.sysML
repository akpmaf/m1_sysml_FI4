package sdff {
    package allocations {
        private import sdff::*;
        private import sdff::parts::*;

        part exploitation : ContexteGlobal;

        //  alerterPompier  //
        allocate alerterPompier.surveillerEnvironnement to exploitation.systeme.noeud.detecteur.capteurFumee;
        allocate alerterPompier.surveillerEnvironnement to exploitation.systeme.noeud.detecteur.capteurTemperature;
        allocate alerterPompier.surveillerEnvironnement to exploitation.systeme.noeud.detecteur.capteurHumidite;
        allocate alerterPompier.surveillerEnvironnement to exploitation.systeme.noeud.detecteur.capteurVent;
        allocate alerterPompier.composerAlerte to exploitation.systeme.noeud.uniteTraitement;
        allocate alerterPompier.envoyerAlerteRadio to exploitation.systeme.noeud.moduleRadio;
        allocate alerterPompier.abandonnerEnvoi to exploitation.systeme.noeud.moduleRadio;
        allocate alerterPompier.relayerAlerteAuxSecours to exploitation.systeme.passerelle;

        //  notifierAlerteFeu  //
        allocate notifierAlerteFeu.recevoirDonneesCapteurs to exploitation.systeme.noeud.detecteur.capteurFumee;
        allocate notifierAlerteFeu.recevoirDonneesCapteurs to exploitation.systeme.noeud.detecteur.capteurTemperature;
        allocate notifierAlerteFeu.analyserDonnees to exploitation.systeme.noeud.uniteTraitement.logicielAnalyse;
        allocate notifierAlerteFeu.poursuivreSurveillance to exploitation.systeme.noeud.uniteTraitement;
        allocate notifierAlerteFeu.genererAlerte to exploitation.systeme.noeud.uniteTraitement;
        allocate notifierAlerteFeu.transmettreNotification to exploitation.systeme.noeud.moduleRadio;
        allocate notifierAlerteFeu.notifierOperateurQG to exploitation.systeme.passerelle;

        //  surveillerEtatSysteme  //
        allocate surveillerEtatSysteme.collecterEtatDispositifs to exploitation.systeme.passerelle;
        allocate surveillerEtatSysteme.evaluerEtatDispositifs to exploitation.systeme.passerelle;
        allocate surveillerEtatSysteme.signalerDispositifEnPanne to exploitation.systeme.supervision;
        allocate surveillerEtatSysteme.afficherEtatNormal to exploitation.systeme.supervision;

        //  exporterInformation  //
        allocate exporterInformation.recevoirDemandeExportation to exploitation.systeme.supervision;
        allocate exporterInformation.selectionnerInformations to exploitation.systeme.supervision;
        allocate exporterInformation.verifierInformations to exploitation.systeme.supervision;
        allocate exporterInformation.preparerFichier to exploitation.systeme.supervision;
        allocate exporterInformation.exporterFichier to exploitation.systeme.passerelle;
        allocate exporterInformation.transmettreFichier to exploitation.systeme.passerelle;
        allocate exporterInformation.confirmerExportation to exploitation.systeme.supervision;
        allocate exporterInformation.afficherMessageErreur to exploitation.systeme.supervision;
        allocate exporterInformation.abandonnerExportation to exploitation.systeme.supervision;

        //  installerSysteme  //  (tout le travail physique est porté par le technicien)
        allocate installerSysteme.verifierSite to exploitation.technicien;
        allocate installerSysteme.choisirAutreSite to exploitation.technicien;
        allocate installerSysteme.installerCapteurs to exploitation.technicien;
        allocate installerSysteme.installerCameras to exploitation.technicien;
        allocate installerSysteme.installerModuleRadio to exploitation.technicien;
        allocate installerSysteme.installerPasserelle to exploitation.technicien;
        allocate installerSysteme.connecterEquipements to exploitation.technicien;
        allocate installerSysteme.verifierConnexions to exploitation.technicien;
        allocate installerSysteme.demarrerSysteme to exploitation.systeme.noeud.uniteTraitement;
        allocate installerSysteme.testerFonctionnement to exploitation.systeme.supervision;
        allocate installerSysteme.identifierProblemes to exploitation.systeme.supervision;
        allocate installerSysteme.corrigerProblemes to exploitation.technicien;
        allocate installerSysteme.validerInstallation to exploitation.technicien;

        //  configurerSysteme  //
        allocate configurerSysteme.lancerRechercheDispositif to exploitation.systeme.supervision;
        allocate configurerSysteme.etablirCommunicationAvecDispositif to exploitation.systeme.passerelle;
        allocate configurerSysteme.configurerCommunicationRadio to exploitation.systeme.supervision;
        allocate configurerSysteme.configurerParametresDetection to exploitation.systeme.noeud.uniteTraitement;
        allocate configurerSysteme.configurerLocalisation to exploitation.systeme.noeud.localisation;
        allocate configurerSysteme.verifierConfiguration to exploitation.systeme.supervision;
        allocate configurerSysteme.enregistrerConfiguration to exploitation.systeme.noeud.uniteTraitement;
        allocate configurerSysteme.confirmerConfiguration to exploitation.systeme.supervision;
        allocate configurerSysteme.abandonnerConfiguration to exploitation.systeme.supervision;

        //  maintenirSysteme  //
        allocate maintenirSysteme.listerDispositifsEnPanne to exploitation.systeme.passerelle;
        allocate maintenirSysteme.selectionnerDispositif to exploitation.systeme.supervision;
        allocate maintenirSysteme.diagnostiquerDispositif to exploitation.systeme.noeud.uniteTraitement;
        allocate maintenirSysteme.remplacerBatterie to exploitation.technicien;
        allocate maintenirSysteme.reorienterAntenne to exploitation.technicien;
        allocate maintenirSysteme.remplacerDispositif to exploitation.technicien;
        allocate maintenirSysteme.testerDispositif to exploitation.systeme.passerelle;
        allocate maintenirSysteme.remettreEnService to exploitation.systeme.passerelle;
    }
}
