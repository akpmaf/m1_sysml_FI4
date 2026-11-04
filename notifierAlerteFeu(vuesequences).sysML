package SDFF {

    // IMPORTATION DES ELEMENTS DU CONTEXTE
    private import SDFF::*;

    package sequences {

        occurrence notifierAlerteFeu {

            // ELEMENTS DU SYSTEME
            part systeme : DetectionFeuForet;
            part reseau : ReseauCommunication;
            part infrastructureDistante : InfrastructureReceptionDistante;

            // DESTINATAIRES DE L'ALERTE
            part pompier : ServicesSecours;
            part gardeNature : AgentForestier;
            part autorites : AutoritesLocales;

            // DETECTION ET TRANSMISSION
            message detecterIncendie
                from systeme to reseau;

            message transmettreAlerte
                from reseau to infrastructureDistante;

            // NOTIFICATION DES DESTINATAIRES
            message notifierServicesSecours
                from infrastructureDistante to pompier;

            message notifierAgentForestier
                from infrastructureDistante to gardeNature;

            message notifierAutorites
                from infrastructureDistante to autorites;

            // CONFIRMATION DE RECEPTION
            message confirmerReception
                from infrastructureDistante to reseau;

            message confirmerTransmission
                from reseau to systeme;
        }
    }
}