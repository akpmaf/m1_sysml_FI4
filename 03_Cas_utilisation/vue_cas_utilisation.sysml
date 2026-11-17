package sdff {
    private import sdff::parts::*;
    private import sdff::requirements::*;

    package useCases {
        actor operateurQG : OperateurQG;
        actor technicien : Technicien;
        actor servicesSecours : ServicesSecours;

        use case notifierAlerteFeu {
            subject  systeme : DetectionFeuForet;
            actor operateurQG;
            require detectionFeu;
            require alerteQuartierGeneral;
        }
        use case alerterPompier {
            subject  systeme : DetectionFeuForet;
            actor servicesSecours;
            require localisationFeu;
            require alerteQuartierGeneral;
        }
        use case exporterInformation {
            subject  systeme : DetectionFeuForet;
            actor operateurQG;
            require transmissionADistance;
        }
        use case surveillerEtatSysteme {
            subject systeme : DetectionFeuForet;
             actor operateurQG;
            require surveillanceEtat;
        }
        use case installerSysteme {
            subject  systeme : DetectionFeuForet;
            actor technicien;
            require fixationArbre;
        }
        use case configurerSysteme {
            subject systeme : DetectionFeuForet;
            actor technicien;
            require configurationSysteme;
        }
        use case maintenirSysteme {
            subject  systeme : DetectionFeuForet;
            actor technicien;
            require maintenabilite;
        }
    }
}
