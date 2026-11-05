package SDFF {

    package parts {

        /* Ports de communication */
        port def PortDonnees;
        port def PortRadio;
        port def PortEnergie;
        port def PortReseau;
        port def PortSupervision;

        /* Dispositif de détection */
        part def DispositifDetection {

            part capteurFumee : CapteurFumee;
            part capteurTemperature : CapteurTemperature;
            part moduleGPS : ModuleGPS;
            part uniteTraitement : UniteTraitement;
            part moduleRadio : ModuleRadio;
            part alimentation : ModuleEnergie;
            part fixation : SystemeFixation;

            port donneesFumee : PortDonnees;
            port donneesTemperature : PortDonnees;
            port donneesGPS : PortDonnees;
            port communicationRadio : PortRadio;
            port alimentationElectrique : PortEnergie;
        }

        /* Module énergétique */
        part def ModuleEnergie {

            part batterie : Batterie;
            part panneauSolaire : PanneauSolaire;
        }

        /* Passerelle de communication */
        part def Passerelle {

            part moduleRadio : ModuleRadio;
            part reseauIP : ReseauIP;

            port communicationRadio : PortRadio;
            port communicationIP : PortReseau;
        }

        /* Infrastructure distante */
        part def InfrastructureDistante {

            part serveur : ServeurAlerte;
            part historique : BaseHistorique;
            part notifications : ServiceNotification;

            port receptionDonnees : PortReseau;
            port supervision : PortSupervision;
        }

        /* Interface de supervision */
        part def InterfaceSupervision {

            part tableauDeBord : TableauDeBord;
            part export : ServiceExport;

            port receptionInformations : PortSupervision;
        }

        /* Système complet */
        part def SystemeDetectionFeuxForet {

            part dispositif : DispositifDetection;
            part passerelle : Passerelle;
            part infrastructure : InfrastructureDistante;
            part interfaceSupervision : InterfaceSupervision;

            /* Communication entre le dispositif et la passerelle */
            connect dispositif.communicationRadio
                to passerelle.communicationRadio;

            /* Communication entre la passerelle et l'infrastructure */
            connect passerelle.communicationIP
                to infrastructure.receptionDonnees;

            /* Transmission des informations vers la supervision */
            connect infrastructure.supervision
                to interfaceSupervision.receptionInformations;
        }
    }

    private import SDFF::parts::*;

    part systeme : SystemeDetectionFeuxForet;
}