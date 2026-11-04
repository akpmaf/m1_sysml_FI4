package sdff {
    private import ScalarValues::Boolean;
    action maintenirSysteme {
    attribute maintenanceDemandee : Boolean;
    attribute energieFaible : Boolean;
    attribute liaisonDegradee : Boolean;
    attribute dispositifDefaillant : Boolean;
    attribute testReussi : Boolean;
    attribute testEchoue : Boolean;
    attribute autreDispositifEnPanne : Boolean;
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
    decide decide1;
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
    succession remplacerBatterie then merge2;
    succession reorienterAntenne then merge2;
    succession remplacerDispositif then merge2;
    then testerDispositif;
    then decide1;
        if testEchoue then merge1;
        if testReussi then remettreEnService;
    succession remettreEnService then decide2;
        if autreDispositifEnPanne then merge0;
        if maintenanceTerminee then done;
}
}