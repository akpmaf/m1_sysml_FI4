package sdff {
    private import ScalarValues::Boolean;

    action configurerSysteme {
        attribute communicationEtablie : Boolean;
        attribute essaisEpuises : Boolean;

        action lancerRechercheDispositif;
        action etablirCommunicationAvecDispositif;
        action configurerCommunicationRadio;
        action configurerParametresDetection;
        action configurerLocalisation;
        action verifierConfiguration;
        action enregistrerConfiguration;
        action confirmerConfiguration;
        action abandonnerConfiguration;

        merge mergeRecherche;
        decide decideCommunication;

        first start;
        then mergeRecherche;
        then lancerRechercheDispositif;
        then etablirCommunicationAvecDispositif;
        then decideCommunication;
            if communicationEtablie then configurerCommunicationRadio;
            if essaisEpuises then abandonnerConfiguration;
            else mergeRecherche;
        succession abandonnerConfiguration then done;

        succession configurerCommunicationRadio then configurerParametresDetection;
        then configurerLocalisation;
        then verifierConfiguration;
        then enregistrerConfiguration;
        then confirmerConfiguration;
        then done;
    }
}
