package sdff {
    private import sdff::parts::*;

        package sequences {

        occurrence alerterPompier {
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
}