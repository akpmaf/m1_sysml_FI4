package sdff {
    private import sdff::parts::*;
    part def ListeDispositifsEnPanne;
    part def Diagnostic;
    part def ResultatTest;
     package sequences {

        // Scénario 1 : test réussi
        occurrence maintenirSystemeS1 {
            part interfaceSupervision : InterfaceSupervision;
            part passerelle : Passerelle;
            part dispositif : DispositifDetection;
            part moduleEnergie : ModuleEnergie;

            message maintenirSysteme from interfaceSupervision to passerelle;
            message listePannes of ListeDispositifsEnPanne from passerelle to interfaceSupervision;

            message diagnostiquer from interfaceSupervision to passerelle;
            message demanderEtat from passerelle to dispositif;
            message lireNiveauEnergie from dispositif to moduleEnergie;
            message niveauEnergie of NiveauEnergie from moduleEnergie to dispositif;
            message etat of EtatDispositif from dispositif to passerelle;
            message diagnostic of Diagnostic from passerelle to interfaceSupervision;

            message tester from interfaceSupervision to passerelle;
            message demanderTest from passerelle to dispositif;
            message resultat of ResultatTest from dispositif to passerelle;
            message resultatTest of ResultatTest from passerelle to interfaceSupervision;

            message remettreEnService from interfaceSupervision to passerelle;
            message activer from passerelle to dispositif;
            message from dispositif to passerelle;
            message from passerelle to interfaceSupervision;
        }

        // Scénario 2 : test échoué puis nouveau diagnostic
        occurrence maintenirSystemeS2 {
            part interfaceSupervision : InterfaceSupervision;
            part passerelle : Passerelle;
            part dispositif : DispositifDetection;

            message maintenirSysteme from interfaceSupervision to passerelle;
            message listePannes of ListeDispositifsEnPanne from passerelle to interfaceSupervision;

            message diagnostiquer from interfaceSupervision to passerelle;
            message demanderEtat from passerelle to dispositif;
            message etat of EtatDispositif from dispositif to passerelle;
            message diagnostic of Diagnostic from passerelle to interfaceSupervision;

            message tester from interfaceSupervision to passerelle;
            message demanderTest from passerelle to dispositif;
            message resultat of ResultatTest from dispositif to passerelle;
            message resultatTest of ResultatTest from passerelle to interfaceSupervision;

            message diagnostiquer from interfaceSupervision to passerelle;
            message demanderEtat from passerelle to dispositif;
            message etat of EtatDispositif from dispositif to passerelle;
            message diagnostic of Diagnostic from passerelle to interfaceSupervision;

            message tester from interfaceSupervision to passerelle;
            message demanderTest from passerelle to dispositif;
            message resultat of ResultatTest from dispositif to passerelle;
            message resultatTest of ResultatTest from passerelle to interfaceSupervision;

            message remettreEnService from interfaceSupervision to passerelle;
            message activer from passerelle to dispositif;
            message from dispositif to passerelle;
            message from passerelle to interfaceSupervision;
        }
    }
}    