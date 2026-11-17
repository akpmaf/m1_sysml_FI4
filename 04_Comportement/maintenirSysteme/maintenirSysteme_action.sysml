package sdff {
    private import ScalarValues::Boolean;

    action maintenirSysteme {
        attribute maintenanceDemandee : Boolean;
        // diagnostiquerDispositif fixe AU PLUS UN attribut vrai,
        // priorité : energieFaible > liaisonDegradee > dispositifDefaillant
        attribute energieFaible : Boolean;
        attribute liaisonDegradee : Boolean;
        attribute dispositifDefaillant : Boolean;
        attribute anomalieInconnue : Boolean;
        attribute testReussi : Boolean;
        attribute maintenanceTerminee : Boolean;

        action listerDispositifsEnPanne;
        action selectionnerDispositif;
        action diagnostiquerDispositif;
        action remplacerBatterie;
        action reorienterAntenne;
        action remplacerDispositif;
        action testerDispositif;
        action remettreEnService;
        merge merge0;
        merge merge1;
        merge merge2;
        decide decide0;
        decide decideTest;
        decide decide2;

        first start;
        succession start if maintenanceDemandee then listerDispositifsEnPanne;
        then merge0;
        then selectionnerDispositif;
        then merge1;
        then diagnostiquerDispositif;
        then decide0;
            if energieFaible then remplacerBatterie;
            if liaisonDegradee then reorienterAntenne;
            if dispositifDefaillant then remplacerDispositif;
            if anomalieInconnue then merge2;
        succession remplacerBatterie then merge2;
        succession reorienterAntenne then merge2;
        succession remplacerDispositif then merge2;
        succession merge2 then testerDispositif;
        then decideTest;
            if testReussi then remettreEnService;
            else merge1;
        succession remettreEnService then decide2;
            if maintenanceTerminee then done;
            else merge0;
    }
}
