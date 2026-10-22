package sdff {
    private import ScalarValues::Boolean;
    package parts {
        /* acteurs */
        part def OperateurQG;
        part def Technicien;

        /* contexte */
        part def SystemeDetectionFeu;
    }

    package useCases {
        private import sdff::parts::*;

        actor operateurQG:OperateurQG;
        actor technicien:Technicien;

        use case recevoirAlerteFeu {
            ref actor operateurQG;
        }
        use case sauvegarderInformations {
            ref actor operateurQG;
        }
        use case surveillerZone {
            ref actor operateurQG;
        }
        use case alerterPompier {
            ref actor operateurQG;
        }

        use case installerSysteme {
            ref actor technicien;
        }
        use case configurerSysteme {
            ref actor technicien;
        }
        use case maintenirSysteme {
            ref actor technicien;
        }
    }
}