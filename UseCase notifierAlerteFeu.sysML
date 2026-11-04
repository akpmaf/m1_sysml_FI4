package notification {
    private import ScalarValues::Boolean;

    action notifierAlerteFeu {
        attribute alerteRecue : Boolean;
        attribute fausseAlerte : Boolean;
        attribute feuConfirme : Boolean;
        attribute pompierPrevenu : Boolean;
        attribute pompierInjoignable : Boolean;
        action recevoirAlerteFeu;
        action alerterPompier;
        merge merge0;
        decide decide0;
        decide decide1;

        first start;
        succession start if alerteRecue then recevoirAlerteFeu;
        then decide decide0;
            if fausseAlerte then done;
            if feuConfirme then merge0;
        first merge0 then alerterPompier;
        then decide decide1;
            if pompierPrevenu then done;
            if pompierInjoignable then merge0;
    }
}