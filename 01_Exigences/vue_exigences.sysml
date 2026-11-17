package sdff {
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

        /* FONCTIONS */
        requirement detectionFeu specializes fonctions {
            doc /* E1 — détecter un départ de feu : alerte générée dans les 60 secondes suivant l'apparition de fumée */
        }
        requirement alerteQuartierGeneral specializes fonctions {
            doc /* E2 — alerter automatiquement le quartier général : délai détection -> QG inférieur ou égal à 2 minutes */
        }
        requirement localisationFeu specializes fonctions {
            doc /* E3 — localiser le feu avec une précision inférieure ou égale à 50 m (localisation GPS) */
        }
        requirement transmissionADistance specializes fonctions {
            doc /* E4 — transmettre alertes et informations à distance : portée radio supérieure ou égale à 5 km entre dispositif et passerelle */
        }
        requirement mesureEnvironnement specializes fonctions {
            doc /* E5 — mesurer température, humidité, vent et fumée au moins une fois par minute */
        }
        requirement preventionIncendie specializes fonctions {
            doc /* E6 — évaluer le risque de départ d'incendie jusqu'à 24 heures à l'avance à partir des paramètres environnementaux */
        }
        requirement surveillanceEtat specializes fonctions {
            doc /* E7 — surveiller en continu l'énergie, la qualité de la liaison et les pannes de chaque dispositif */
        }

        /* INTERACTIONS MATERIELLES */
        requirement fixationArbre specializes interactionsMaterielles {
            doc /* E8 — se fixer sur un tronc d'arbre de 20 à 80 cm de diamètre, sans outillage spécialisé */
        }
        requirement configurationSysteme specializes interactionsMaterielles {
            doc /* E9 — être configuré sur site par le technicien en moins de 15 minutes par dispositif */
        }
        requirement liaisonRadio specializes interactionsMaterielles {
            doc /* E10 — être pourvu d'une liaison radio bidirectionnelle dispositif <-> passerelle */
        }
        requirement alimentationSolaire specializes interactionsMaterielles {
            doc /* E11 — recharger sa batterie par le soleil (interaction avec la source d'énergie du contexte) */
        }
        requirement raccordementReseau specializes interactionsMaterielles {
            doc /* E12 — relayer alertes et fichiers vers le réseau de communication et l'infrastructure de réception distante */
        }

        /* CONTRAINTES */
        requirement coutRevient specializes contraintes {
            doc /* E13 — prix de revient inférieur à 1000 EUR par dispositif, vérifié par analyse de la nomenclature */
        }
        requirement dimensionsReduites specializes contraintes {
            doc /* E14 — volume inférieur ou égal à 5 L et masse inférieure ou égale à 3 kg */
        }
        requirement autonomieEnergetique specializes contraintes {
            doc /* E15 — fonctionnement 24 h/24 avec au moins 7 jours d'autonomie sans ensoleillement */
        }
        requirement resistanceIntemperies specializes contraintes {
            doc /* E16 — étanchéité IP65, fonctionnement de -20 °C à +60 °C, vent jusqu'à 120 km/h */
        }
        requirement detectionPrecoce specializes contraintes {
            doc /* E17 — détection dès les premières fumées : premier seuil de fumée détecté en moins de 60 s */
        }
        requirement limitationFaussesAlertes specializes contraintes {
            doc /* E18 — taux de fausses alertes inférieur ou égal à 2 % des alertes déclenchées */
        }
        requirement maintenabilite specializes contraintes {
            doc /* E19 — toute intervention de maintenance sur un dispositif réalisable en moins de 30 minutes par le technicien */
        }
    }
}
