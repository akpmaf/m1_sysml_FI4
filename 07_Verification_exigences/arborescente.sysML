package architectureSysteme {

    /* définitions */
    package definitions {
        part def DetectionFeuForet;

        /* système étudié : noeud de détection + passerelle + supervision */
        part def DispositifDetection;
        part def Passerelle;
        part def InterfaceSupervision;

        /* composants du dispositif */
        part def Boitier;
        part def SystemeFixation;
        part def DetecteurFeu;
        part def CapteurFumee;
        part def CapteurTemperature;
        part def CapteurHumidite;
        part def CapteurVent;
        part def Cameras;
        part def UniteTraitement;
        part def LogicielAnalyse;
        part def ModuleRadio;
        part def Antenne;
        part def ModuleLocalisation;
        part def ModuleEnergie;
        part def Batterie;
        part def PanneauSolaire;
    }

    /* architecture */
    package architecture {
        private import architectureSysteme::definitions::*;

        part sdff : DetectionFeuForet {

            /* noeuds de détection disséminés en forêt */
            part noeud : DispositifDetection [1..*] {
                part boitier : Boitier;
                part systemeFixation : SystemeFixation;
                part detecteur : DetecteurFeu {
                    part capteurFumee : CapteurFumee;
                    part capteurTemperature : CapteurTemperature;
                    part capteurHumidite : CapteurHumidite;
                    part capteurVent : CapteurVent;
                    part cameras : Cameras [0..*];
                }
                part uniteTraitement : UniteTraitement {
                    part logicielAnalyse : LogicielAnalyse;
                }
                part moduleRadio : ModuleRadio {
                    part antenne : Antenne;
                }
                part moduleEnergie : ModuleEnergie {
                    part batterie : Batterie;
                    part panneauSolaire : PanneauSolaire;
                }
                part localisation : ModuleLocalisation;
            }

            /* passerelle : relais radio longue portée vers le réseau */
            part passerelle : Passerelle;

            /* interface de supervision au quartier général */
            part supervision : InterfaceSupervision;
        }
    }
}
