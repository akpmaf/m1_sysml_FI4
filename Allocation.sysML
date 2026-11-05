package sdff {
    package allocation {
        private import sdff::architecture::*;

        // ---- alerterPompier ----
        allocate alerterPompier.surveillerEnvironnement to exploitation.sdff.noeud.detecteur.capteurs;
        allocate alerterPompier.surveillerEnvironnement to exploitation.sdff.noeud.detecteur.cameras;
        allocate alerterPompier.surveillerEnvironnement to exploitation.sdff.noeud.uniteTraitement;
        allocate alerterPompier.composerAlerte to exploitation.sdff.noeud.uniteTraitement;
        allocate alerterPompier.envoyerAlerteRadio to exploitation.sdff.noeud.moduleRadio;
        allocate alerterPompier.relayerAlerteAuxSecours to exploitation.sdff.passerelle;
        allocate alerterPompier.relayerAlerteAuxSecours to exploitation.infrastructureDistante;

        // ---- configurerSysteme ----
        allocate configurerSysteme.lancerRechercheDispositif to exploitation.sdff.supervision;
        allocate configurerSysteme.lancerRechercheDispositif to exploitation.sdff.passerelle;
        allocate configurerSysteme.lancerRechercheDispositif to exploitation.technicien_de_maintenance;
        allocate configurerSysteme.etablirCommunicationAvecDispositif to exploitation.sdff.supervision;
        allocate configurerSysteme.etablirCommunicationAvecDispositif to exploitation.sdff.passerelle;
        allocate configurerSysteme.etablirCommunicationAvecDispositif to exploitation.sdff.noeud.moduleRadio;
        allocate configurerSysteme.configurerCommunicationRadio to exploitation.sdff.supervision;
        allocate configurerSysteme.configurerCommunicationRadio to exploitation.sdff.noeud.moduleRadio;
        allocate configurerSysteme.configurerParametresDetection to exploitation.sdff.supervision;
        allocate configurerSysteme.configurerParametresDetection to exploitation.sdff.noeud.uniteTraitement;
        allocate configurerSysteme.configurerLocalisation to exploitation.sdff.supervision;
        allocate configurerSysteme.configurerLocalisation to exploitation.sdff.noeud.uniteTraitement;
        allocate configurerSysteme.verifierConfiguration to exploitation.sdff.supervision;
        allocate configurerSysteme.verifierConfiguration to exploitation.sdff.noeud.uniteTraitement;
        allocate configurerSysteme.enregistrerConfiguration to exploitation.sdff.noeud.uniteTraitement;
        allocate configurerSysteme.confirmerConfiguration to exploitation.sdff.supervision;

        // ---- exporterInformation ----
        allocate exporterInformation.recevoirDemandeExportation to exploitation.sdff.supervision;
        allocate exporterInformation.selectionnerInformations to exploitation.sdff.supervision;
        allocate exporterInformation.selectionnerInformations to exploitation.sdff.passerelle;
        allocate exporterInformation.selectionnerInformations to exploitation.infrastructureDistante;
        allocate exporterInformation.verifierInformations to exploitation.sdff.supervision;
        allocate exporterInformation.preparerFichier to exploitation.sdff.supervision;
        allocate exporterInformation.exporterFichier to exploitation.sdff.supervision;
        allocate exporterInformation.transmettreFichier to exploitation.sdff.passerelle;
        allocate exporterInformation.confirmerExportation to exploitation.sdff.supervision;
        allocate exporterInformation.afficherMessageErreur to exploitation.sdff.supervision;

        // ---- installerSysteme ----
        allocate installerSysteme.verifierSite to exploitation.technicien_de_maintenance;
        allocate installerSysteme.choisirAutreSite to exploitation.technicien_de_maintenance;
        allocate installerSysteme.installerCapteurs to exploitation.sdff.noeud.detecteur.capteurs;
        allocate installerSysteme.installerCapteurs to exploitation.technicien_de_maintenance;
        allocate installerSysteme.installerCameras to exploitation.sdff.noeud.detecteur.cameras;
        allocate installerSysteme.installerCameras to exploitation.technicien_de_maintenance;
        allocate installerSysteme.installerModuleRadio to exploitation.sdff.noeud.moduleRadio;
        allocate installerSysteme.installerModuleRadio to exploitation.technicien_de_maintenance;
        allocate installerSysteme.installerPasserelle to exploitation.sdff.passerelle;
        allocate installerSysteme.installerPasserelle to exploitation.technicien_de_maintenance;
        allocate installerSysteme.connecterEquipements to exploitation.sdff.noeud.uniteTraitement;
        allocate installerSysteme.connecterEquipements to exploitation.sdff.passerelle;
        allocate installerSysteme.connecterEquipements to exploitation.technicien_de_maintenance;
        allocate installerSysteme.verifierConnexions to exploitation.sdff.noeud.uniteTraitement;
        allocate installerSysteme.verifierConnexions to exploitation.sdff.passerelle;
        allocate installerSysteme.verifierConnexions to exploitation.sdff.supervision;
        allocate installerSysteme.demarrerSysteme to exploitation.sdff.noeud.uniteTraitement;
        allocate installerSysteme.demarrerSysteme to exploitation.sdff.noeud.moduleEnergie;
        allocate installerSysteme.testerFonctionnement to exploitation.sdff.noeud.uniteTraitement;
        allocate installerSysteme.testerFonctionnement to exploitation.sdff.passerelle;
        allocate installerSysteme.testerFonctionnement to exploitation.sdff.supervision;
        allocate installerSysteme.identifierProblemes to exploitation.sdff.supervision;
        allocate installerSysteme.identifierProblemes to exploitation.technicien_de_maintenance;
        allocate installerSysteme.corrigerProblemes to exploitation.technicien_de_maintenance;
        allocate installerSysteme.validerInstallation to exploitation.sdff.supervision;
        allocate installerSysteme.validerInstallation to exploitation.technicien_de_maintenance;

        // ---- maintenirSysteme ----
        allocate maintenirSysteme.listerDispositifsEnPanne to exploitation.sdff.passerelle;
        allocate maintenirSysteme.listerDispositifsEnPanne to exploitation.sdff.supervision;
        allocate maintenirSysteme.selectionnerDispositif to exploitation.sdff.supervision;
        allocate maintenirSysteme.diagnostiquerDispositif to exploitation.sdff.noeud.uniteTraitement;
        allocate maintenirSysteme.diagnostiquerDispositif to exploitation.sdff.noeud.moduleRadio;
        allocate maintenirSysteme.diagnostiquerDispositif to exploitation.sdff.noeud.moduleEnergie;
        allocate maintenirSysteme.diagnostiquerDispositif to exploitation.sdff.passerelle;
        allocate maintenirSysteme.diagnostiquerDispositif to exploitation.sdff.supervision;
        allocate maintenirSysteme.remplacerBatterie to exploitation.sdff.noeud.moduleEnergie;
        allocate maintenirSysteme.remplacerBatterie to exploitation.technicien_de_maintenance;
        allocate maintenirSysteme.reorienterAntenne to exploitation.sdff.noeud.moduleRadio;
        allocate maintenirSysteme.reorienterAntenne to exploitation.technicien_de_maintenance;
        allocate maintenirSysteme.remplacerDispositif to exploitation.sdff.noeud;
        allocate maintenirSysteme.remplacerDispositif to exploitation.technicien_de_maintenance;
        allocate maintenirSysteme.testerDispositif to exploitation.sdff.noeud.uniteTraitement;
        allocate maintenirSysteme.testerDispositif to exploitation.sdff.passerelle;
        allocate maintenirSysteme.testerDispositif to exploitation.sdff.supervision;
        allocate maintenirSysteme.remettreEnService to exploitation.sdff.noeud;
        allocate maintenirSysteme.remettreEnService to exploitation.sdff.passerelle;
        allocate maintenirSysteme.remettreEnService to exploitation.sdff.supervision;

        // ---- notifierAlerteFeu ----
        allocate notifierAlerteFeu.recevoirDonneesCapteurs to exploitation.sdff.noeud.detecteur.capteurs;
        allocate notifierAlerteFeu.recevoirDonneesCapteurs to exploitation.sdff.noeud.detecteur.cameras;
        allocate notifierAlerteFeu.recevoirDonneesCapteurs to exploitation.sdff.noeud.uniteTraitement;
        allocate notifierAlerteFeu.analyserDonnees to exploitation.sdff.noeud.uniteTraitement;
        allocate notifierAlerteFeu.poursuivreSurveillance to exploitation.sdff.noeud.uniteTraitement;
        allocate notifierAlerteFeu.genererAlerte to exploitation.sdff.noeud.uniteTraitement;
        allocate notifierAlerteFeu.transmettreNotification to exploitation.sdff.noeud.moduleRadio;
        allocate notifierAlerteFeu.transmettreNotification to exploitation.sdff.passerelle;
        allocate notifierAlerteFeu.notifierOperateurQG to exploitation.sdff.passerelle;
        allocate notifierAlerteFeu.notifierOperateurQG to exploitation.infrastructureDistante;
        allocate notifierAlerteFeu.consulterAlerte to exploitation.infrastructureDistante;

        // ---- surveillerEtatSysteme ----
        allocate surveillerEtatSysteme.collecterEtatDispositifs to exploitation.sdff.noeud.uniteTraitement;
        allocate surveillerEtatSysteme.collecterEtatDispositifs to exploitation.sdff.noeud.moduleRadio;
        allocate surveillerEtatSysteme.collecterEtatDispositifs to exploitation.sdff.noeud.moduleEnergie;
        allocate surveillerEtatSysteme.collecterEtatDispositifs to exploitation.sdff.passerelle;
        allocate surveillerEtatSysteme.evaluerEtatDispositifs to exploitation.sdff.passerelle;
        allocate surveillerEtatSysteme.evaluerEtatDispositifs to exploitation.sdff.supervision;
        allocate surveillerEtatSysteme.signalerDispositifEnPanne to exploitation.sdff.passerelle;
        allocate surveillerEtatSysteme.signalerDispositifEnPanne to exploitation.sdff.supervision;
        allocate surveillerEtatSysteme.afficherEtatNormal to exploitation.sdff.supervision;

    }
}