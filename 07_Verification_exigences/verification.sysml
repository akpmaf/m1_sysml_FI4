package sdff {
    private import sdff::parts::*;
    private import sdff::requirements::*;

    /* Recette : vérification par essai / mesure */
    package recette {
        verification detectionFeuVerifiee {
            verify detectionFeu;
            doc /* Méthode : essai en fumée contrôlée. Seuil : alerte générée en moins de 60 s sur 20 essais consécutifs. */
        }
        verification alerteQGVerifiee {
            verify alerteQuartierGeneral;
            doc /* Méthode : essai de bout en bout avec horodatage. Seuil : délai détection -> QG inférieur ou égal à 2 min. */
        }
        verification localisationVerifiee {
            verify localisationFeu;
            doc /* Méthode : mesure sur site avec GPS de référence. Seuil : écart inférieur ou égal à 50 m sur 10 points. */
        }
        verification transmissionVerifiee {
            verify transmissionADistance;
            doc /* Méthode : essai de portée en forêt. Seuil : liaison établie à 5 km ou plus dans 9 cas sur 10. */
        }
        verification mesureEnvironnementVerifiee {
            verify mesureEnvironnement;
            doc /* Méthode : comparaison avec station météo de référence. Seuil : écart 2 °C max et 5 % HR max, mesures chaque minute. */
        }
        verification preventionVerifiee {
            verify preventionIncendie;
            doc /* Méthode : analyse a posteriori sur historique météo/incendies. Seuil : risque annoncé 24 h ou plus avant l'événement. */
        }
        verification alimentationSolaireVerifiee {
            verify alimentationSolaire;
            doc /* Méthode : essai d'énergie (panneau seul, batterie retirée). Seuil : recharge de la batterie constatée après 6 h d'ensoleillement nominal. */
        }
        verification raccordementReseauVerifiee {
            verify raccordementReseau;
            doc /* Méthode : essai de bout en bout passerelle -> réseau -> infrastructure distante. Seuil : 100 % des alertes testées reçues à l'infrastructure distante. */
        }
        verification surveillanceEtatVerifiee {
            verify surveillanceEtat;
            doc /* Méthode : essai par panne provoquée (batterie débranchée, antenne masquée). Seuil : panne signalée au QG en moins de 5 min. */
        }
        verification fixationVerifiee {
            verify fixationArbre;
            doc /* Méthode : inspection + essai d'arrachement. Seuil : tenue 300 N minimum sur tronc de 20 à 80 cm. */
        }
        verification configurationVerifiee {
            verify configurationSysteme;
            doc /* Méthode : essai chronométré par technicien non expert. Seuil : configuration complète en 15 min maximum. */
        }
        verification liaisonRadioVerifiee {
            verify liaisonRadio;
            doc /* Méthode : inspection de conception + essai bidirectionnel. Seuil : accusé de réception dans 100 % des essais à portée nominale. */
        }
    }

    /* Contrôle : vérification par analyse / inspection */
    package controle {
        verification coutControle {
            verify coutRevient;
            doc /* Méthode : analyse de la nomenclature (BOM). Seuil : coût cumulé strictement inférieur à 1000 EUR. */
        }
        verification dimensionsControlees {
            verify dimensionsReduites;
            doc /* Méthode : inspection (mesure du boîtier). Seuil : volume 5 L max, masse 3 kg max. */
        }
        verification autonomieControlee {
            verify autonomieEnergetique;
            doc /* Méthode : essai énergie (batterie pleine, sans soleil). Seuil : 7 jours de fonctionnement minimum. */
        }
        verification intemperiesControlees {
            verify resistanceIntemperies;
            doc /* Méthode : essai de classe IP et essais thermiques en laboratoire. Seuil : IP65, -20 °C à +60 °C. */
        }
        verification detectionPrecoceControlee {
            verify detectionPrecoce;
            doc /* Méthode : essai en fumée diluée. Seuil : détection du premier seuil en moins de 60 s. */
        }
        verification fausseAlerteControlee {
            verify limitationFaussesAlertes;
            doc /* Méthode : analyse statistique de campagne d'essais. Seuil : 2 % de fausses alertes maximum. */
        }
        verification maintenabiliteControlee {
            verify maintenabilite;
            doc /* Méthode : essai chronométré (batterie, antenne, dispositif). Seuil : 30 min maximum par intervention. */
        }
    }

    /* Satisfaction : les exigences sont satisfaites par les blocs réels de generale.sysml */
    package satisfaction {

        part dispositifReference : DispositifDetection {
            satisfy configurationSysteme;
            part detecteur : DetecteurFeu {
                part capteurFumee : CapteurFumee {
                    satisfy detectionFeu;
                    satisfy detectionPrecoce;
                }
                part capteurTemperature : CapteurTemperature { satisfy mesureEnvironnement; }
                part capteurHumidite : CapteurHumidite { satisfy mesureEnvironnement; }
                part capteurVent : CapteurVent { satisfy mesureEnvironnement; }
            }
            part uniteTraitement : UniteTraitement {
                part logicielAnalyse : LogicielAnalyse {
                    satisfy preventionIncendie;
                    satisfy limitationFaussesAlertes;
                }
            }
            part localisation : ModuleLocalisation { satisfy localisationFeu; }
            part moduleRadio : ModuleRadio { satisfy liaisonRadio; }
            part moduleEnergie : ModuleEnergie {
                part batterie : Batterie { satisfy autonomieEnergetique; }
                part panneauSolaire : PanneauSolaire { satisfy alimentationSolaire; }
            }
            part boitier : Boitier {
                satisfy dimensionsReduites;
                satisfy resistanceIntemperies;
            }
            part systemeFixation : SystemeFixation { satisfy fixationArbre; }
        }

        part passerelleReference : Passerelle {
            satisfy transmissionADistance;
            satisfy raccordementReseau;
        }

        part supervisionReference : InterfaceSupervision {
            satisfy surveillanceEtat;
        }

        part systemeReference : DetectionFeuForet {
            satisfy alerteQuartierGeneral;
            satisfy coutRevient;
            satisfy maintenabilite;
        }
    }
}
