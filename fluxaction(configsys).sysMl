package sdff {
    private import ScalarValues::Boolean;

    action configurerSysteme {

        attribute communicationEtablie : Boolean;

        action lancerRechercheDispositif;
        action etablirCommunicationAvecDispositif;
        action configurerCommunicationRadio;
        action configurerParametresDetection;
        action configurerLocalisation;
        action verifierConfiguration;
        action enregistrerConfiguration;
        action confirmerConfiguration;

        decide decide0;

        first start;
        then lancerRechercheDispositif;
        then etablirCommunicationAvecDispositif;
        then decide decide0;

        if communicationEtablie
            then configurerCommunicationRadio;

        if not communicationEtablie
            then lancerRechercheDispositif;

       // succession merge0 then lancerRechercheDispositif;

        then configurerParametresDetection;
        then configurerLocalisation;
        then verifierConfiguration;
        then enregistrerConfiguration;
        then confirmerConfiguration;
        then done;
    }
}