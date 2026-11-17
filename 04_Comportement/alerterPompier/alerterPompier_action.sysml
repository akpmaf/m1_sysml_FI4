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
        succession start if dispositifActif then merge0;
        then surveillerEnvironnement;
        then decide0;
            if departFeuDetecte then composerAlerte;
            else merge0;
        succession composerAlerte then merge1;
        then envoyerAlerteRadio;
        then decide1;
            if accuseReceptionRecu then relayerAlerteAuxSecours;
            if essaisEpuises then abandonnerEnvoi;
            else merge1;
        succession abandonnerEnvoi then done;
        succession relayerAlerteAuxSecours then done;
    }
}
