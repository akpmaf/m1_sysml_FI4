package sdff {
    private import sdff::parts::*;

    package sequences {
        occurrence alerterPompierS1 {
            part capteurFeu : CapteurFeu;
            part dispositif : Dispositif;
            part moduleRadio : ModuleRadio;
            part passerelle : Passerelle;
            part terminalSecours : TerminalSecours;

            message alerterPompier from capteurFeu to dispositif;
            message envoyer of Alerte from dispositif to moduleRadio;
            message transmettre of Alerte from moduleRadio to passerelle;
            message relayer of Alerte from passerelle to terminalSecours;
            message from terminalSecours to passerelle;
            message accuse of AccuseReception from passerelle to moduleRadio;
            message from moduleRadio to dispositif;
            message from dispositif to capteurFeu;
        }
    }
}