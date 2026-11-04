package sequences {

    private import SDFF::*;
  part def DetectionFeuForet;
    part def ServicesSecours;
    part def AgentForestier;
    part def InfrastructureReceptionDistante;
    part def ReseauCommunication;
     part def AutoritesLocales;
    occurrence notifierAlerteFeu {

        // ELEMENTS DU SYSTEME
        part systeme : DetectionFeuForet;
        part reseau : ReseauCommunication;
        part infrastructureDistante : InfrastructureReceptionDistante;

        // DESTINATAIRES
        part pompier : ServicesSecours;
        part gardeNature : AgentForestier;
        part autorites : AutoritesLocales;

        // TRANSMISSION DE L'ALERTE
        message detecterIncendie
            from systeme to reseau;

        message transmettreAlerte
            from reseau to infrastructureDistante;

        // NOTIFICATION
        message notifierServicesSecours
            from infrastructureDistante to pompier;

        message notifierAgentForestier
            from infrastructureDistante to gardeNature;

        message notifierAutorites
            from infrastructureDistante to autorites;

        // CONFIRMATION
        message confirmerReception
            from infrastructureDistante to reseau;

        message confirmerTransmission
            from reseau to systeme;
    }
}