package sdff {
    private import sdff::parts::*;

    package sequences {

        // Scénario 1 : configuration nominale
        occurrence configurerSystemeS1 {
            part technicien : Technicien;
            part supervision : InterfaceSupervision;
            part passerelle : Passerelle;
            part dispositif : DispositifDetection;

            message lancerRechercheDispositif from technicien to supervision;
            message interrogerDispositif of Commande from supervision to passerelle;
            message interroger1 of Commande from passerelle to dispositif;
            message repondre1 of EtatDispositif from dispositif to passerelle;
            message confirmerCommunication1 of EtatSysteme from passerelle to supervision;
            message configurerCommunicationRadio from technicien to supervision;
            message transmettreParametresRadio of Commande from supervision to passerelle;
            message appliquerParametresRadio of Commande from passerelle to dispositif;
            message configurerParametresDetection from technicien to supervision;
            message transmettreParametresDetection of Commande from supervision to passerelle;
            message appliquerParametresDetection of Commande from passerelle to dispositif;
            message configurerLocalisation from technicien to supervision;
            message transmettreParametresLocalisation of Commande from supervision to passerelle;
            message appliquerParametresLocalisation of Commande from passerelle to dispositif;
            message verifierConfiguration from technicien to supervision;
            message demanderVerification of Commande from passerelle to dispositif;
            message transmettreDonneesVerification of EtatDispositif from dispositif to passerelle;
            message rendreVerification of EtatDispositif from passerelle to supervision;
            message enregistrerConfiguration from technicien to supervision;
            message confirmerConfiguration of EtatSysteme from supervision to technicien;
        }

        // Scénario 2 : communication non établie, puis nouvelle recherche réussie
        occurrence configurerSystemeS2 {
            part technicien : Technicien;
            part supervision : InterfaceSupervision;
            part passerelle : Passerelle;
            part dispositif : DispositifDetection;

            message lancerRechercheDispositif1 from technicien to supervision;
            message interrogerDispositif1 of Commande from supervision to passerelle;
            message interroger1 of Commande from passerelle to dispositif;
            message signalerAbsenceReponse of Diagnostic from supervision to technicien;
            message relancerRecherche from technicien to supervision;
            message interrogerDispositif2 of Commande from supervision to passerelle;
            message interroger2 of Commande from passerelle to dispositif;
            message repondre2 of EtatDispositif from dispositif to passerelle;
            message confirmerCommunication2 of EtatSysteme from passerelle to supervision;
            message configurerCommunicationRadio from technicien to supervision;
            message transmettreParametresRadio of Commande from supervision to passerelle;
            message appliquerParametresRadio of Commande from passerelle to dispositif;
            message configurerParametresDetection from technicien to supervision;
            message configurerLocalisation from technicien to supervision;
            message verifierConfiguration from technicien to supervision;
            message enregistrerConfiguration from technicien to supervision;
            message confirmerConfiguration of EtatSysteme from supervision to technicien;
        }
    }
}
