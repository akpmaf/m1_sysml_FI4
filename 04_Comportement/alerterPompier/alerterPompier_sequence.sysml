package sdff {
    private import sdff::parts::*;

    package sequences {

        // Scénario 1 : alerte relayée au premier envoi
        occurrence alerterPompierS1 {
            part detecteur : DetecteurFeu;
            part uniteTraitement : UniteTraitement;
            part moduleRadio : ModuleRadio;
            part passerelle : Passerelle;
            part infrastructureDistante : InfrastructureReceptionDistante;
            part servicesSecours : ServicesSecours;

            message declencherDetection of Mesures from detecteur to uniteTraitement;
            message envoyerAlerte1 of Alerte from uniteTraitement to moduleRadio;
            message transmettre1 of Alerte from moduleRadio to passerelle;
            message relayer1 of Alerte from passerelle to infrastructureDistante;
            message recevoir1 from infrastructureDistante to servicesSecours;
            message accuserReception1 of AccuseReception from infrastructureDistante to passerelle;
            message retourner1 of AccuseReception from passerelle to moduleRadio;
            message confirmer1 of StatutEnvoi from moduleRadio to uniteTraitement;
        }

        // Scénario 2 : premier envoi sans accusé, puis renvoi
        occurrence alerterPompierS2 {
            part detecteur : DetecteurFeu;
            part uniteTraitement : UniteTraitement;
            part moduleRadio : ModuleRadio;
            part passerelle : Passerelle;
            part infrastructureDistante : InfrastructureReceptionDistante;
            part servicesSecours : ServicesSecours;

            message declencherDetection of Mesures from detecteur to uniteTraitement;
            message envoyerAlerte1 of Alerte from uniteTraitement to moduleRadio;
            message transmettre1 of Alerte from moduleRadio to passerelle;
            message signalerEchec1 of StatutEnvoi from moduleRadio to uniteTraitement;
            message envoyerAlerte2 of Alerte from uniteTraitement to moduleRadio;
            message transmettre2 of Alerte from moduleRadio to passerelle;
            message relayer1 of Alerte from passerelle to infrastructureDistante;
            message recevoir1 from infrastructureDistante to servicesSecours;
            message accuserReception1 of AccuseReception from infrastructureDistante to passerelle;
            message retourner1 of AccuseReception from passerelle to moduleRadio;
            message confirmer2 of StatutEnvoi from moduleRadio to uniteTraitement;
        }
    }
}
