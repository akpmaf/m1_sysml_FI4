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

    // debut du code 

        
        first start;
        then lancerRechercheDispositif;
        then etablirCommunicationAvecDispositif;
        then decide decide0;
            if not communicationEtablie then lancerRechercheDispositif;
            if communicationEtablie then configurerCommunicationRadio;

        first configurerCommunicationRadio;
        then configurerParametresDetection;
        then configurerLocalisation;
        then verifierConfiguration;
        then enregistrerConfiguration;
        then confirmerConfiguration;
        then done;
    }
}