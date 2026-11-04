package sdff {

    part def Capteur;
    part def SystemeSurveillance;
    part def ServiceNotification;
    part def OperateurQG;

    part capteur : Capteur;
    part systeme : SystemeSurveillance;
    part service : ServiceNotification;
    part operateur : OperateurQG;

    occurrence def TransmissionDonnees;
    occurrence def AnalyseDonnees;
    occurrence def GenerationAlerte;
    occurrence def TransmissionAlerte;
    occurrence def NotificationOperateur;
    occurrence def ConsultationAlerte;

}
