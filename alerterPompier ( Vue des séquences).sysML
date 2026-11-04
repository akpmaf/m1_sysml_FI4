package sdff {
    private import sdff::parts::*;

    part def DetecteurFeu;
    part def DispositifDetection;
    part def ModuleRadio;
    part def Passerelle;

    part def Alerte;
    part def AccuseReception;
    part def StatutEnvoi;

    package sequences {

        // Scénario 1 : alerte relayée au premier envoi
        occurrence alerterPompierS1 {
            part detecteur : DetecteurFeu;
            part dispositif : DispositifDetection;
            part moduleRadio : ModuleRadio;
            part passerelle : Passerelle;
            part infrastructureDistante : InfrastructureReceptionDistante;

            message alerterPompier from detecteur to dispositif;
            message envoyer of Alerte from dispositif to moduleRadio;
            message transmettre of Alerte from moduleRadio to passerelle;
            message relayer of Alerte from passerelle to infrastructureDistante;
            message from infrastructureDistante to passerelle;
            message accuse of AccuseReception from passerelle to moduleRadio;
            message from moduleRadio to dispositif;
            message from dispositif to detecteur;
        }

        // Scénario 2 : premier envoi sans accusé, puis renvoi
        occurrence alerterPompierS2 {
            part detecteur : DetecteurFeu;
            part dispositif : DispositifDetection;
            part moduleRadio : ModuleRadio;
            part passerelle : Passerelle;
            infrastructureDistante : InfrastructureReceptionDistante;

            message alerterPompier from detecteur to dispositif;

            message envoyer of Alerte from dispositif to moduleRadio;
            message transmettre of Alerte from moduleRadio to passerelle;
            message statut of StatutEnvoi from moduleRadio to dispositif;

            message envoyer of Alerte from dispositif to moduleRadio;
            message transmettre of Alerte from moduleRadio to passerelle;
            message relayer of Alerte from passerelle to infrastructureDistante;
            message from infrastructureDistante to passerelle;
            message accuse of AccuseReception from passerelle to moduleRadio;
            message from moduleRadio to dispositif;

            message from dispositif to detecteur;
        }
    }
    }