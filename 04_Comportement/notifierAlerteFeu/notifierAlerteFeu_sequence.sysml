package sdff {
    private import sdff::parts::*;

    package sequences {

        // S1 : feu détecté, alerte transmise jusqu'au QG et aux secours
        occurrence notifierAlerteFeuS1 {
            part uniteTraitement : UniteTraitement;
            part moduleRadio : ModuleRadio;
            part passerelle : Passerelle;
            part reseau : ReseauCommunication;
            part infrastructureDistante : InfrastructureReceptionDistante;
            part operateurQG : OperateurQG;
            part servicesSecours : ServicesSecours;

            message envoyerAlerte of Alerte from uniteTraitement to moduleRadio;
            message relayerAlerte of Alerte from moduleRadio to passerelle;
            message transmettreAlerte of Alerte from passerelle to reseau;
            message acheminerAlerte of Alerte from reseau to infrastructureDistante;
            message notifierQG of Alerte from infrastructureDistante to operateurQG;
            message notifierSecours of Alerte from infrastructureDistante to servicesSecours;
            message accuserReception of AccuseReception from infrastructureDistante to reseau;
            message confirmerTransmission of AccuseReception from reseau to passerelle;
            message confirmerEnvoi of StatutEnvoi from passerelle to uniteTraitement;
        }

        // S2 : pas de feu (fumée diluée / bruit de mesure), poursuite de la surveillance
        occurrence notifierAlerteFeuS2 {
            part uniteTraitement : UniteTraitement;

            message acquerirMesures of Mesures from uniteTraitement to uniteTraitement;
            message poursuivreSurveillance of EtatDispositif from uniteTraitement to uniteTraitement;
        }
    }
}
