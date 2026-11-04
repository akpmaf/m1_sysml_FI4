package sdff {
    private import ScalarValues::Boolean;
    
    action surveillerEtatSysteme {
    attribute consultationDemandee : Boolean;
    attribute panneDetectee : Boolean;
    attribute etatNormal : Boolean;
    attribute actualisation : Boolean;
    attribute fermeture : Boolean;

    action collecterEtatDispositifs;
    action evaluerEtatDispositifs;
    action signalerDispositifEnPanne;
    action afficherEtatNormal;
    merge merge0;
    decide decide0;
    merge merge1;
    decide decide1;

    first start;
    succession start if consultationDemandee then merge0;
    then collecterEtatDispositifs;
    then evaluerEtatDispositifs;
    then decide0;
        if panneDetectee then signalerDispositifEnPanne;
        if etatNormal then afficherEtatNormal;
    succession signalerDispositifEnPanne then merge1;
    succession afficherEtatNormal then merge1;
    then decide1;
        if actualisation then merge0;
        if fermeture then done;}
}
