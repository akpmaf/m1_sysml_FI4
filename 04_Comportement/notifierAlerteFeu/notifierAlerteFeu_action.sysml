package sdff {
    private import ScalarValues::Boolean;

    action notifierAlerteFeu {

        attribute feuDetecte : Boolean;

        action recevoirDonneesCapteurs;
        action analyserDonnees;
        action poursuivreSurveillance;
        action genererAlerte;
        action transmettreNotification;
        action notifierOperateurQG;
        action consulterAlerte;

        decide decideFeu;
        merge mergeSurveillance;

        first start;
        then mergeSurveillance;
        then recevoirDonneesCapteurs;
        then analyserDonnees;
        then decideFeu;
            if feuDetecte then genererAlerte;
            else poursuivreSurveillance;
        succession first poursuivreSurveillance then mergeSurveillance;

        succession first genererAlerte then transmettreNotification;
        then notifierOperateurQG;
        then consulterAlerte;
        then done;
    }
}
