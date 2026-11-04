package sdff {

    private import sdff::parts::*;

    package sequences {

        occurrence notifierAlerteFeu {

            part detecteur : DetecteurFeu;
            part dispositif : DispositifDetection;
            part moduleRadio : ModuleRadio;
            part passerelle : Passerelle;
            part infrastructureDistante : InfrastructureReceptionDistante;
            part operateurQG : OperateurQG;

            message notifierAlerteFeu
                from detecteur to dispositif;

            message envoyer of Alerte
                from dispositif to moduleRadio;

            message transmettre of Alerte
                from moduleRadio to passerelle;

            message relayer of Alerte
                from passerelle to infrastructureDistante;

            message notifier of Alerte
                from infrastructureDistante to operateurQG;

            message consulterAlerte
                from operateurQG to infrastructureDistante;

            message confirmerReception of AccuseReception
                from operateurQG to infrastructureDistante;
        }
    }
}
