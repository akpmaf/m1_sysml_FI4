package sdff {

    part def Admin;
    part def SystemeSurveillance;
    part def BaseDeDonnees;

    part admin : Admin;
    part systeme : SystemeSurveillance;
    part base : BaseDeDonnees;

    occurrence def DemandeSauvegarde;
    occurrence def AffichageFormulaire;
    occurrence def SaisieInformations;
    occurrence def VerificationInformations;
    occurrence def ValidationInformations;
    occurrence def EnregistrementInformations;
    occurrence def ConfirmationEnregistrement;
    occurrence def ConfirmationSauvegarde;

}