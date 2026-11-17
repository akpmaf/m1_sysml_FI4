package sdff {
    private import ScalarValues::Boolean;

    action alerterPompier {
        attribute dispositifActif : Boolean;
        attribute departFeuDetecte : Boolean;
        attribute accuseReceptionRecu : Boolean;
        attribute essaisEpuises : Boolean;

        action surveillerEnvironnement;
        action composerAlerte;
        action envoyerAlerteRadio;
        action abandonnerEnvoi;
        action relayerAlerteAuxSecours;
        merge merge0;
        decide decide0;
        merge merge1;
        decide decide1;

        first start;
        succession first start if dispositifActif then merge0;
        then surveillerEnvironnement;
        then decide0;
            if departFeuDetecte then composerAlerte;
            else merge0;
        succession first composerAlerte then merge1;
        then envoyerAlerteRadio;
        then decide1;
            if accuseReceptionRecu then relayerAlerteAuxSecours;
            if essaisEpuises then abandonnerEnvoi;
            else merge1;
        succession first abandonnerEnvoi then done;
        succession first relayerAlerteAuxSecours then done;
    }
}
