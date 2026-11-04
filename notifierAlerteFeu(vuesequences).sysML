
package sdff {

    private import sdff.parts::parts::*;

    package sequences {
        private import sdff::parts::OperateurQG;

        occurrence notifierAlerteFeu {

            part capteur : Capteur;
            part systeme : SystemeSurveillance;
            part serviceNotification : 'ServiceNotification';
            part operateurQG : 'OperateurQG';

            message transmettreDonnees
                from capteur to systeme;

            message analyserDonnees
                from systeme to systeme;

            message genererAlerte
                from systeme to systeme;

            message transmettreAlerte
                from systeme to serviceNotification;

            message notifierOperateurQG
                from serviceNotification to operateurQG;

            message consulterAlerte
                from operateurQG to systeme;

            message afficherDetailsAlerte
                from systeme to operateurQG;
        }
    }
}
