
sequenceDiagram
    autonumber
    actor Capteur
    participant Systeme as SystemeSurveillance
    participant Service as ServiceNotification
    actor Operateur as OperateurQG

    Capteur->>Systeme: transmettreDonnees()
    Systeme->>Systeme: analyserDonnees()

    alt Incendie détecté
        Systeme->>Systeme: genererAlerte()
        Systeme->>Service: transmettreAlerte()
        Service->>Operateur: notifierAlerteFeu()
        Operateur->>Service: consulterAlerte()
        Service-->>Operateur: afficherDetailsAlerte()
    else Aucun incendie détecté
        Systeme->>Systeme: poursuivreSurveillance()
    end
