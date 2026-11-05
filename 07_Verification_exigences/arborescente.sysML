
package architectureSysteme {

    /* définitions */
    package definitions {
        part def DetectionFeuForet;

        /* composants physiques */
        part def Boitier;
        part def CarteElectronique;
        part def MicroControleur;
        part def ModuleGPS;
        part def UniteRadio;
        part def InterfaceConfiguration;
        part def Batterie;
        part def PanneauSolaire;
        part def CapteurFumee;
        part def CapteurTemperature;
        part def CapteurHumidite;
        part def CapteurVent;
        part def SystemeFixation;

        /* composants logiques : logiciel embarqué */
        part def LogicielEmbarque;
        part def AcquisitionMesures;
        part def DetectionDepartFeu;
        part def FiltrageFaussesAlertes;
        part def PrevisionRisque;
        part def Localisation;
        part def Parametrage;

        /* composants logiques : application de supervision du QG */
        part def AppSupervision;
        part def TableauAlertes;
        part def CarteLocalisation;
        part def EtatSysteme;
        part def JournalEvenements;
    }

    /* architectures*/
    package architecture {
        private import architectureSysteme::definitions::*;

        /* architecture physique */
        part sdff : DetectionFeuForet {
            part boitier : Boitier;
            part carteElectronique : CarteElectronique {
                part microControleur : MicroControleur;
                part moduleGPS : ModuleGPS;
                part uniteRadio : UniteRadio;
                part interfaceConfiguration : InterfaceConfiguration;
            }
            part capteurFumee : CapteurFumee;
            part capteurTemperature : CapteurTemperature;
            part capteurHumidite : CapteurHumidite;
            part capteurVent : CapteurVent;
            part batterie : Batterie;
            part panneauSolaire : PanneauSolaire;
            part systemeFixation : SystemeFixation;
        }

        /* architecture logique : logiciel embarqué sur le microcontrôleur */
        part logicielEmbarque : LogicielEmbarque {
            part acquisition : AcquisitionMesures;
            part detection : DetectionDepartFeu;
            part filtrage : FiltrageFaussesAlertes;
            part prevision : PrevisionRisque;
            part localisation : Localisation;
            part parametrage : Parametrage;
        }

        /* architecture logique : application de supervision au quartier général */
        part appSupervision : AppSupervision {
            part alertes : TableauAlertes;
            part carte : CarteLocalisation;
            part etat : EtatSysteme;
            part journal : JournalEvenements;
        }
    }
}
