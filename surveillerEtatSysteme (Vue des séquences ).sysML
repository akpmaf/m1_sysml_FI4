package sdff {
    private import ScalarValues::Boolean;
    part def NiveauEnergie;
    part def InterfaceSupervision;
    part def ModuleEnergie;
    part def QualiteLiaison;
    part def EtatDispositif;
    part def EtatSysteme;
    part def DispositifEnPanne;
    part def ModuleRadio;
    part def Passerelle;
    part def DispositifDetection;

    // Scénario 1 : tous les dispositifs répondent
        occurrence surveillerEtatSystemeS1 {
            part interfaceSupervision : InterfaceSupervision;
            part passerelle : Passerelle;
            part dispositif : DispositifDetection;
            part moduleEnergie : ModuleEnergie;
            part moduleRadio : ModuleRadio;

            message surveillerEtatSysteme from interfaceSupervision to passerelle;
            message demanderEtat from passerelle to dispositif;
            message lireNiveauEnergie from dispositif to moduleEnergie;
            message niveauEnergie of NiveauEnergie from moduleEnergie to dispositif;
            message mesurerLiaison from dispositif to moduleRadio;
            message qualiteLiaison of QualiteLiaison from moduleRadio to dispositif;
            message etat of EtatDispositif from dispositif to passerelle;
            message etatSysteme of EtatSysteme from passerelle to interfaceSupervision;
        }

        // Scénario 2 : un dispositif ne répond pas (panne)
        occurrence surveillerEtatSystemeS2 {
            part interfaceSupervision : InterfaceSupervision;
            part passerelle : Passerelle;
            part dispositif : DispositifDetection;

            message surveillerEtatSysteme from interfaceSupervision to passerelle;
            message demanderEtat from passerelle to dispositif;
            message signalerPanne of DispositifEnPanne from passerelle to interfaceSupervision;
        }
    }