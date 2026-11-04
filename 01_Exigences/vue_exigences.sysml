package SDFF {    
    package requirements {
        /* exigences extraites des cas d'utilisation */
        requirement detectionFeu specializes fonctions {
            doc /* le système doit pouvoir detecter le depart d'un feu */
        }

        requirement alerteQuartierGeneral specializes fonctions {
            doc /* Le système doit pouvoir alerter automatiquement le quartier général */
        }

        requirement localisationFeu specializes fonctions {
            doc /* le système doit pouvoir localiser precisement le feu */
        }

        requirement transmissionADistance specializes fonctions {
            doc /* le système doit pouvoir envoyer des informations à distance */
        }

        requirement mesureEnvironnement specializes fonctions {
            doc /* le systeme doit pouvoir mesurer les paramètres environnementaux */
        }

        /* exigences extraites de la description du produit */
        requirement fixationArbre specializes interactionsMaterielles {
            doc /* le système doit pouvoir être fixé correctement sur un arbre de forêt*/
        }

        requirement configurationSysteme specializes interactionsMaterielles {
            doc /* le système doit pouvoir être configuré facilement par le technicien */
        }

        requirement liaisonRadio specializes interactionsMaterielles {
            doc /* le système doit être pourvu d'une liaison radio */
        }

        requirement coutRevient specializes contraintes {
            doc /* le prix de revient doit être inférieur à 1000€ */
        }

        requirement dimensionsReduites specializes contraintes {
            doc /* les dimensions du système doivent être réduites pour ne pas être encombrantes*/
        }

        requirement autonomieEnergetique specializes contraintes {
            doc /* le système doit être pourvu d'une autonomie énergétique suffisante (24h/24)*/
        }

        requirement resistanceintemperies specializes contraintes {
            doc /* le système doit résister aux intempéries (pluie-température-vent) */
        }
         requirement detectionPrecoce specializes contraintes {
            doc /* Le système doit détecter les premiers signes d'un départ de feu dès leur apparition. */
        }
         requirement limitationFaussesAlertes specializes contraintes {
            doc /* Le taux de fausses alertes ne doit pas dépasser 2 % des alertes déclenchées. */
        }
        requirement preventionIncendie specializes fonctions {
            doc /* Le système doit évaluer le risque de départ d'incendie jusqu'à 24 heures à l'avance à partir des paramètres environnementaux. */
        }

        
        /* exigences créées pour regrouper l'ensemble de manière hiérarchique */
        requirement  contraintes specializes specificationsSDFF {
            doc /* le système doit respecter les contraintes ci-dessous */
        }

        requirement  fonctions specializes specificationsSDFF {
            doc /* le système doit comprendre les fonctions listées ci-dessous */
        }

        requirement  interactionsMaterielles specializes specificationsSDFF {
            doc /* le système doit pouvoir disposer des interactions matérielles listées */
        }

        requirement specificationsSDFF {
            doc /* le système répond aux catégories d'exigences listées ci-dessous */
        }
    }
}