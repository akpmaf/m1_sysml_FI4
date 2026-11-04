package sdff {
    private import sdff::parts::*;

    package sequences {

        occurrence configurerSystemeSequence {

            part technicien : Technicien;
            part systeme : SystemeDetectionFeu;

            message lancerRechercheDispositif 
                from technicien to systeme;

            message etablirCommunicationAvecDispositif 
                from technicien to systeme;

            message confirmerCommunicationEtablie 
                from systeme to technicien;

            message configurerCommunicationRadio 
                from technicien to systeme;

            message configurerParametresDetection 
                from technicien to systeme;

            message configurerLocalisation 
                from technicien to systeme;

            message demanderVerification 
                from technicien to systeme;

            message transmettreDonneesVerification 
                from systeme to technicien;

            message enregistrerConfiguration 
                from technicien to systeme;

            message confirmerConfiguration 
                from systeme to technicien;
        }
    }
}