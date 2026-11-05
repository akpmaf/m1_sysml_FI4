package sdff {
part def CapteurFumee;
part def CapteurTemperature;
part def CapteurHumidite;
part def CapteurVent;
part def ModuleGPS;
part def MicroControleur;
part def LogicielAnalyse;

part def PanneauSolaire;
part def Batterie;
part def Boitier;
part def SystemeFixation;
part def InterfaceConfiguration;

package recette {
    private import sdff::requirements::*;

    verification detectionFeuVerifiee {
        verify detectionFeu;
    }
    verification alerteQGVerifiee {
        verify alerteQuartierGeneral;
    }
    verification localisationVerifiee {
        verify localisationFeu;
    }
    verification transmissionVerifiee {
        verify transmissionADistance;
    }
    verification mesureEnvironnementVerifiee {
        verify mesureEnvironnement;
    }
    verification preventionVerifiee {
        verify preventionIncendie;
    }
    verification fixationVerifiee {
        verify fixationArbre;
    }
    verification configurationVerifiee {
        verify configurationSysteme;
    }
    verification liaisonRadioVerifiee {
        verify liaisonRadio;
    }
    verification fonctionsVerifiees {
        verify fonctions;
    }
    verification interactionsVerifiees {
        verify interactionsMaterielles;
    }
}
package controle {
    private import sdff::requirements::*;

    verification coutControle {
        verify coutRevient;
    }
    verification dimensionsControlees {
        verify dimensionsReduites;
    }
    verification autonomieControlee {
        verify autonomieEnergetique;
    }
    verification intemperiesControlees {
        verify resistanceintemperies;
    }
    verification detectionPrecoceControlee {
        verify detectionPrecoce;
    }
    verification fausseAlerteControlee {
        verify limitationFaussesAlertes;
    }
    verification contraintesControlees {
        verify contraintes;
    }
}
private import sdff::parts::*;
private import sdff::requirements::*;
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
part ModuleRadio : ModuleRadio {
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
