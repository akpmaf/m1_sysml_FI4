package MaintenanceSysteme {
    private import ScalarValues::Boolean;

    action def MaintenirSysteme {
        // Attributes de contrôle
        attribute anomalieDetectee : Boolean;
        attribute interventionMaterielleRequise : Boolean;
        attribute maintenanceValidee : Boolean;

        // Sous-actions de maintenance
        action consulterEtatReseau;            // Consultation de l'état des balises et passerelles
        action diagnostiquerPanne;              // Localisation du composant défaillant
        action reconfigurerPasserelleOuCapteur; // Reconfiguration distante (logiciel/radio)
        action remplacerOuRechargerComposant;   // Intervention physique sur le terrain
        action testerFonctionnement;            // Verification opérationnelle
        action enregistrerRapportMaintenance;   // Clôture du dossier de maintenance

        // Nœuds de contrôle
        merge mergeAccueil;
        decide decideAnomalie;
        decide decideTypeIntervention;
        merge mergeIntervention;
        decide decideTest;

        // 1. Début du flux et surveillance initiale
        first start;
        then mergeAccueil;
        then consulterEtatReseau;
        then decideAnomalie;
            if not anomalieDetectee then done;
            if anomalieDetectee then diagnostiquerPanne;

        // 2. Diagnostic et aiguillage du type d'intervention
        succession diagnostiquerPanne then decideTypeIntervention;
            if not interventionMaterielleRequise then reconfigurerPasserelleOuCapteur;
            if interventionMaterielleRequise then remplacerOuRechargerComposant;

        // 3. Convergence des interventions vers le point de fusion
        succession reconfigurerPasserelleOuCapteur then mergeIntervention;
        succession remplacerOuRechargerComposant then mergeIntervention;

        // 4. CORRECTION : Execution du test AVANT l'évaluation de décision
        succession mergeIntervention then testerFonctionnement;
        succession testerFonctionnement then decideTest;

        // 5. Evaluation du résultat de verification
        decide Test;
            if maintenanceValidee then enregistrerRapportMaintenance;
            if not maintenanceValidee then mergeAccueil; // Relance la boucle en cas d'échec

        // 6. Fin du flux
        succession enregistrerRapportMaintenance then done;
    }
}