package sdff {
    private import sdff::parts::*;

    package sequences {

        // S1 : intervention batterie (énergie faible)
        occurrence maintenirSystemeS1 {
            part technicien : Technicien;
            part supervision : InterfaceSupervision;
            part passerelle : Passerelle;
            part dispositif : DispositifDetection;
            part moduleEnergie : ModuleEnergie;

            message listerDispositifsEnPanne from technicien to supervision;
            message interrogerPannes of Commande from supervision to passerelle;
            message listePannes of ListeDispositifsEnPanne from passerelle to supervision;
            message selectionnerDispositif of Commande from technicien to supervision;
            message diagnostiquerDispositif from supervision to passerelle;
            message demanderEtat of Commande from passerelle to dispositif;
            message lireNiveauEnergie from dispositif to moduleEnergie;
            message niveauEnergie of NiveauEnergie from moduleEnergie to dispositif;
            message rendreDiagnostic of Diagnostic from dispositif to passerelle;
            message rendreCompteDiagnostic of Diagnostic from passerelle to supervision;
            message demanderRemplacementBatterie of Commande from supervision to technicien;
            message remplacerBatterie from technicien to dispositif;
            message testerDispositif from supervision to passerelle;
            message resultatTest of ResultatTest from passerelle to supervision;
            message remettreEnService from technicien to passerelle;
            message confirmerRemiseEnService of EtatSysteme from passerelle to technicien;
        }

        // S2 : intervention antenne (liaison dégradée)
        occurrence maintenirSystemeS2 {
            part technicien : Technicien;
            part supervision : InterfaceSupervision;
            part passerelle : Passerelle;
            part dispositif : DispositifDetection;
            part moduleRadio : ModuleRadio;

            message listerDispositifsEnPanne from technicien to supervision;
            message interrogerPannes of Commande from supervision to passerelle;
            message listePannes of ListeDispositifsEnPanne from passerelle to supervision;
            message selectionnerDispositif of Commande from technicien to supervision;
            message diagnostiquerDispositif from supervision to passerelle;
            message mesurerLiaison of Commande from passerelle to dispositif;
            message mesurerQualite from dispositif to moduleRadio;
            message rendreQualite of QualiteLiaison from moduleRadio to dispositif;
            message rendreDiagnostic of Diagnostic from dispositif to passerelle;
            message rendreCompteDiagnostic of Diagnostic from passerelle to supervision;
            message demanderReorientation of Commande from supervision to technicien;
            message reorienterAntenne from technicien to dispositif;
            message testerDispositif from supervision to passerelle;
            message resultatTest of ResultatTest from passerelle to supervision;
            message remettreEnService from technicien to passerelle;
            message confirmerRemiseEnService of EtatSysteme from passerelle to technicien;
        }

        // S3 : remplacement complet du dispositif
        occurrence maintenirSystemeS3 {
            part technicien : Technicien;
            part supervision : InterfaceSupervision;
            part passerelle : Passerelle;
            part dispositifPanne : DispositifDetection;
            part dispositifNeuf : DispositifDetection;

            message listerDispositifsEnPanne from technicien to supervision;
            message interrogerPannes of Commande from supervision to passerelle;
            message listePannes of ListeDispositifsEnPanne from passerelle to supervision;
            message selectionnerDispositif of Commande from technicien to supervision;
            message diagnostiquerDispositif from supervision to passerelle;
            message rendreDiagnostic of Diagnostic from passerelle to supervision;
            message demanderRemplacement of Commande from supervision to technicien;
            message retirerDispositif from technicien to dispositifPanne;
            message installerDispositifNeuf from technicien to dispositifNeuf;
            message connecterDispositifNeuf from technicien to passerelle;
            message testerDispositif from supervision to passerelle;
            message resultatTest of ResultatTest from passerelle to supervision;
            message remettreEnService from technicien to passerelle;
            message confirmerRemiseEnService of EtatSysteme from passerelle to technicien;
        }
    }
}
