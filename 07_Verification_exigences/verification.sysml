package sdff {


    package parts {
        /* acteurs */
        part def OperateurQG;
        part def Technicien;

        
        part def DetectionFeuForet;

        
        part def CapteurFumee;
        part def CapteurTemperature;
        part def CapteurHumidite;
        part def CapteurVent;
        part def ModuleGPS;
        part def MicroControleur;
        part def LogicielAnalyse;
        part def UniteRadio;
        part def PanneauSolaire;
        part def Batterie;
        part def Boitier;
        part def SystemeFixation;
        part def InterfaceConfiguration;
    }

    
    package requirements {
        requirement specificationsSDFF {
            doc /* le système répond aux catégories d'exigences listées ci-dessous */
        }
        requirement fonctions specializes specificationsSDFF {
            doc /* le système doit comprendre les fonctions listées ci-dessous */
        }
        requirement interactionsMaterielles specializes specificationsSDFF {
            doc /* le système doit pouvoir disposer des interactions matérielles listées */
        }
        requirement contraintes specializes specificationsSDFF {
            doc /* le système doit respecter les contraintes ci-dessous */
        }

        /* fonctions */
        requirement detectionFeu specializes fonctions {
            doc /* le système doit pouvoir détecter le départ d'un feu */
        }
        requirement alerteQuartierGeneral specializes fonctions {
            doc /* le système doit pouvoir alerter automatiquement le quartier général */
        }
        requirement localisationFeu specializes fonctions {
            doc /* le système doit pouvoir localiser précisément le feu */
        }
        requirement transmissionADistance specializes fonctions {
            doc /* le système doit pouvoir envoyer des informations à distance */
        }
        requirement mesureEnvironnement specializes fonctions {
            doc /* le système doit pouvoir mesurer les paramètres environnementaux */
        }
        requirement preventionIncendie specializes fonctions {
            doc /* le système doit évaluer le risque de départ d'incendie jusqu'à 24 heures à l'avance */
        }

        
        requirement fixationArbre specializes interactionsMaterielles {
            doc /* le système doit pouvoir être fixé correctement sur un arbre de forêt */
        }
        requirement configurationSysteme specializes interactionsMaterielles {
            doc /* le système doit pouvoir être configuré facilement par le technicien */
        }
        requirement liaisonRadio specializes interactionsMaterielles {
            doc /* le système doit être pourvu d'une liaison radio */
        }

        /* contraintes */
        requirement coutRevient specializes contraintes {
            doc /* le prix de revient doit être inférieur à 1000€ */
        }
        requirement dimensionsReduites specializes contraintes {
            doc /* les dimensions du système doivent être réduites */
        }
        requirement autonomieEnergetique specializes contraintes {
            doc /* autonomie énergétique suffisante (24h/24) */
        }
        requirement resistanceintemperies specializes contraintes {
            doc /* le système doit résister aux intempéries (pluie, température, vent) */
        }
        requirement detectionPrecoce specializes contraintes {
            doc /* détection des premiers signes d'un départ de feu dès leur apparition */
        }
        requirement limitationFaussesAlertes specializes contraintes {
            doc /* le taux de fausses alertes ne doit pas dépasser 2 % */
        }
    }

    /* cas d'utilisation */
    package useCases {
        private import sdff::parts::*;
        private import sdff::requirements::*;

        actor operateurQG : OperateurQG;
        actor technicien : Technicien;

        use case notifierAlerteFeu {
            ref actor operateurQG;
            require detectionFeu;
            require alerteQuartierGeneral;
        }
        use case alerterPompier {
            ref actor operateurQG;
            require localisationFeu;
        }
        use case exporterInformations {
            ref actor operateurQG;
            require transmissionADistance;
        }
        use case surveillerEtatSysteme {
            ref actor operateurQG;
            require mesureEnvironnement;
            require preventionIncendie;
        }
        use case installerSysteme {
            ref actor technicien;
            require fixationArbre;
        }
        use case configurerSysteme {
            ref actor technicien;
            require configurationSysteme;
        }
        use case maintenirSysteme {
            ref actor technicien;
        }
    }

    
    package recette {
        private import sdff::requirements::*;

        verification detectionFeuVerifiee { verify detectionFeu; }
        verification alerteQGVerifiee { verify alerteQuartierGeneral; }
        verification localisationVerifiee { verify localisationFeu; }
        verification transmissionVerifiee { verify transmissionADistance; }
        verification mesureEnvironnementVerifiee { verify mesureEnvironnement; }
        verification preventionVerifiee { verify preventionIncendie; }
        verification fixationVerifiee { verify fixationArbre; }
        verification configurationVerifiee { verify configurationSysteme; }
        verification liaisonRadioVerifiee { verify liaisonRadio; }
        verification fonctionsVerifiees { verify fonctions; }
        verification interactionsVerifiees { verify interactionsMaterielles; }
    }

    
    package controle {
        private import sdff::requirements::*;

        verification coutControle { verify coutRevient; }
        verification dimensionsControlees { verify dimensionsReduites; }
        verification autonomieControlee { verify autonomieEnergetique; }
        verification intemperiesControlees { verify resistanceintemperies; }
        verification detectionPrecoceControlee { verify detectionPrecoce; }
        verification fausseAlerteControlee { verify limitationFaussesAlertes; }
        verification contraintesControlees { verify contraintes; }
    }

   
    package systeme {
        private import sdff::parts::*;
        private import sdff::requirements::*;

        part capteurFumee : CapteurFumee {
            satisfy detectionFeu;
            satisfy detectionPrecoce;
        }
        part capteurTemperature : CapteurTemperature {
            satisfy detectionFeu;
            satisfy mesureEnvironnement;
        }
        part capteurHumidite : CapteurHumidite {
            satisfy mesureEnvironnement;
        }
        part capteurVent : CapteurVent {
            satisfy mesureEnvironnement;
        }
        part moduleGPS : ModuleGPS {
            satisfy localisationFeu;
        }
        part microControleur : MicroControleur {
            satisfy detectionFeu;
            satisfy alerteQuartierGeneral;
        }
        part logicielAnalyse : LogicielAnalyse {
            satisfy preventionIncendie;
            satisfy limitationFaussesAlertes;
        }
        part uniteRadio : UniteRadio {
            satisfy alerteQuartierGeneral;
            satisfy transmissionADistance;
            satisfy liaisonRadio;
        }
        part panneauSolaire : PanneauSolaire {
            satisfy autonomieEnergetique;
        }
        part batterie : Batterie {
            satisfy autonomieEnergetique;
        }
        part boitier : Boitier {
            satisfy dimensionsReduites;
            satisfy resistanceintemperies;
        }
        part systemeFixation : SystemeFixation {
            satisfy fixationArbre;
        }
        part interfaceConfiguration : InterfaceConfiguration {
            satisfy configurationSysteme;
        }
    }
}
