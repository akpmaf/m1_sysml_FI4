package sdff{

    private import ScalarValues::Boolean;

    action notifierAlerteFeu {

        attribute feuDetecte : Boolean;
        attribute alerteGeneree : Boolean;

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

        then recevoirDonneesCapteurs;
        then analyserDonnees;
        then decide decideFeu;

            if not feuDetecte
                then poursuivreSurveillance;
                then mergeSurveillance;

            if feuDetecte
                then genererAlerte;
                then transmettreNotification;
                then notifierOperateurQG;
                then consulterAlerte;
                then done;

        succession mergeSurveillance
            then recevoirDonneesCapteurs;
    }
}