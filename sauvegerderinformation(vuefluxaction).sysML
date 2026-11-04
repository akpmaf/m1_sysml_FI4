package sdff {

    private import ScalarValues::Boolean;

    action sauvegarderInformations {

        attribute informationsValides : Boolean;
        attribute sauvegardeEffectuee : Boolean;

        action demanderSauvegarde;
        action afficherFormulaire;
        action saisirInformations;
        action recupererInformations;
        action verifierInformations;
        action afficherErreur;
        action enregistrerInformations;
        action confirmerSauvegarde;
        action afficherConfirmation;

        decide decideValidation;
        merge mergeSaisie;

        first start;

        then demanderSauvegarde;
        then afficherFormulaire;
        then saisirInformations;
        then recupererInformations;
        then verifierInformations;
        then decide decideValidation;

            if not informationsValides
                then afficherErreur;
                then mergeSaisie;

            if informationsValides
                then enregistrerInformations;
                then confirmerSauvegarde;
                then afficherConfirmation;
                then done;

        succession mergeSaisie
            then saisirInformations;
    }
}