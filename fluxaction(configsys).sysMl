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

        // 1. On gère la boucle avec un merge explicite
        first start;
        then merge merge0;
        then lancerRechercheDispositif;
        then etablirCommunicationAvecDispositif;
        then decide decide0;
            if not communicationEtablie then merge0;
            if communicationEtablie then configurerCommunicationRadio;

        // 2. On CASSE la chaîne ici avec "first" pour éviter les flèches fantômes
        first configurerCommunicationRadio;
        then configurerParametresDetection;
        then configurerLocalisation;
        then verifierConfiguration;
        then enregistrerConfiguration;
        then confirmerConfiguration;
        then done;
    }
}