# Volume 1 - Etude fonctionnelle - ANS - Traçabilité des événements v2.0.0-ballot

* [**Table of Contents**](toc.md)
* **Volume 1 - Etude fonctionnelle**

## Volume 1 - Etude fonctionnelle

### Organisation du contexte métier

Le domaine « Traçabilité » regroupe les groupes de processus qui décrivent la gestion des informations de traçabilité, informations qu'un système enregistre à chaque action qui lui est associée. Dans le cadre de la présente étude, ce domaine est constitué d'un unique groupe de processus « Gestion des traces ».

Figure : Organisation du contexte métier de l'étude "Gestion des traces"

Le périmètre de l'étude englobe les processus en couleur sur le diagramme de paquetage.

#### Gestion des traces

Le groupe de processus « Gestion des traces » regroupe les processus qui permettent de gérer les traces produites lors de la vie d'un produit :

* Créer des traces ;
* Consulter une trace ;
* Recherches des traces.

A noter que la gestion consiste en la création des traces et leur consultation. La suppression des traces ne fait pas partie du périmètre de l'étude.

### Définition des processus collaboratifs

#### Cas d'utilisations

##### Processus collaboratif "Créer des traces"

Figure : Processus collaboratif "Créer des traces"

| | |
| :--- | :--- |
| Pré-conditions | La source des traces est habilitée à enregistrer des traces auprès du gestionnaire des traces. |
| Post-conditions | N/A |
| Contraintes fonctionnelles | N/A |
| Scénario nominal | 1 - La source des traces transmet les informations au gestionnaire de traces.2 - Le gestionnaire des traces confirme ou non l'enregistrement des traces. |

Table : Caractéristiques du processus collaboratif

##### Processus collaboratif "Consulter une trace"

Figure : Processus collaboratif "Consulter une trace"

| | |
| :--- | :--- |
| Pré-conditions | Le consommateur des traces est habilité à consulter des traces auprès du gestionnaire des traces. |
| Post-conditions | N/A |
| Contraintes fonctionnelles | N/A |
| Scénario nominal | 1 - Le consommateur des traces effectue une demande de consultation d'une trace auprès du gestionnaire des traces.2 - Le gestionnaire des traces renvoie le détail de la trace au consommateur des traces. |

Table : Caractéristiques du processus collaboratif

##### Processus collaboratif "Rechercher des traces"

Figure : Processus collaboratif "Rechercher des traces"

| | |
| :--- | :--- |
| Pré-conditions | Le consommateur des traces est habilité à rechercher des traces auprès du gestionnaire des traces. |
| Post-conditions | N/A |
| Contraintes fonctionnelles | N/A |
| Scénario nominal | 1 - Le consommateur des traces effectue une recherche de traces auprès du gestionnaire des traces.2 - Le gestionnaire des traces renvoie la liste des traces répondant aux critères de recherche. |

Table : Caractéristiques du processus collaboratif

#### Liste des acteurs pour l'ensemble des processus

| | |
| :--- | :--- |
| Consommateur des traces | Il s'agit d'un acteur système interne ou externe habilité à accéder aux traces. Les personnes utilisant ce système peuvent être rattachées par exemple à la pharmacie hospitalière (traçabilité des médicaments), au bloc opératoire (traçabilité des actes chirurgicaux), à la sécurité (traçabilité de sécurité). |
| Gestionnaire des traces | Il s'agit d'un acteur système qui enregistre les informations de traçabilité et fournit les traces en cas de consultation ou de recherches. Le gestionnaire des traces peut être, par exemple, un logiciel de traçabilité ou le module de traçabilité d'un logiciel métier. |
| Source des traces | Il s'agit d'un acteur système qui transmet les informations de traçabilité relatives à une étape significative d'un processus métier suite à un événement au gestionnaire. |

Table : Table des acteurs

### Description des processus collaboratifs et identification des flux

#### Créer des traces

Figure : Processus collaboratif "Créer des traces"

##### Description des actions

| | |
| :--- | :--- |
| Créer des traces | Envoyer les informations de traçabilité de la source au gestionnaire des traces. |
| Recevoir et enregistrer les traces | Recevoir et enregistrer les informations de traçabilité. |

Table : Tableau des actions

##### Identification des flux

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| Flux 1 : TransmissionTrace | Créer des traces | Source des traces | Gestionnaire des traces | Oui |
| Flux 1bis : RetourTransmissionTrace | Créer des traces | Gestionnaire des traces | Source des traces | Flux technique hors étude |

Table : Flux

#### Consulter une trace

Figure : Processus collaboratif "Consulter une trace"

##### Description des actions

| | |
| :--- | :--- |
| Demander à consulter une trace | Le consommateur des traces demande à consulter une trace. |
| Consulter la réponse | Le consommateur des traces reçoit et traite le retour du gestionnaire des traces. |
| Réceptionner la demande | Le gestionnaire réceptionne la demande de consultation d'une trace. |
| Fournir la trace | Le gestionnaire des traces fournit la trace demandée. |

Table : Tableau des actions

##### Identification des flux

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| Flux 2 : ConsultationTrace | Consulter une trace | Consommateur des traces | Gestionnaire des traces | Oui |
| Flux 3 : ReponseConsultationTrace | Consulter une trace | Gestionnaire des traces | Consommateur des traces | Oui |

Table : Flux

#### Rechercher des traces

Figure : Processus collaboratif "Rechercher des traces"

##### Description des actions

| | |
| :--- | :--- |
| Rechercher des traces | Le consommateur des traces effectue une recherche de traces auprès du gestionnaire des traces en précisant les critères de sa recherche. |
| Consulter la réponse | Le consommateur des traces consulte les traces retournées par le gestionnaire des traces. |
| Réceptionner la recherche | Le gestionnaire des traces reçoit les critères de recherches. |
| Rechercher et fournir les traces | Les traces sont recherchées par le gestionnaire des traces selon les critères définis par le consommateur des traces. Les traces trouvées sont ensuite retournées au consommateur. |

Table : Tableau des actions

##### Identification des flux

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| Flux 4 : RechercheTraces | Rechercher des traces | Consommateur des traces | Gestionnaire des traces | Oui |
| Flux 5 : ReponseRechercheTraces | Rechercher des traces | Gestionnaire des traces | Consommateur des traces | Oui |

Table : Flux

#### Synthèse des flux

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| Flux 1 : TransmissionTrace | Créer des traces | Source des traces | Gestionnaire des traces | Oui |
| Flux 1bis : RetourTransmissionTrace | Créer des traces | Gestionnaire des traces | Source des traces | Flux technique hors étude |
| Flux 2 : ConsultationTrace | Consulter une trace | Consommateur des traces | Gestionnaire des traces | Oui |
| Flux 3 : ReponseConsultationTrace | Consulter une trace | Gestionnaire des traces | Consommateur des traces | Oui |
| Flux 4 : RechercheTraces | Rechercher des traces | Consommateur des traces | Gestionnaire des traces | Oui |
| Flux 5 : ReponseRechercheTraces | Rechercher des traces | Gestionnaire des traces | Consommateur des traces | Oui |

Table : Synthèse des flux identifiés

### Identification des concepts véhiculés dans les flux d'informations et correspondance avec les classes et attributs du MOS

#### Concepts métier - Factorisation par concept

| | | |
| :--- | :--- | :--- |
| Trace | Ensemble des informations enregistrées relatant les actions entreprises par un système en conséquence d'un événement. | Flux 1 - TransmissionTraceFlux 2 - ConsultationTraceFlux 3 - ReponseConsultationTrace |
| Source | Système qui transmet les informations de traçabilité relatives à une étape significative d'un processus métier. | Flux 1 - TransmissionTraceFlux 3 - ReponseConsultationTrace |
| Evènement | Fait marquant relatif à un objet, une personne, un processus, etc | Flux 1 - TransmissionTraceFlux 3 - ReponseConsultationTrace |
| Acteurs de l'évènement | Acteurs liés à l'évènement. Il peut s'agir d'une personne (physique ou morale) ou d'un système à l'origine de l'évènement (émetteur) ou destinataire de l'évènement (récepteur). | Flux 1 - TransmissionTraceFlux 3 - ReponseConsultationTrace |
| Objet de l'évènement | Tout objet impacté par un évènement qui doit être tracé. Le contenu correspond aux informations associées à l'évènement envoyées au gestionnaire de traces et qui doivent être conservées | Flux 1 - TransmissionTraceFlux 3 - ReponseConsultationTrace |

Table : Concepts métier

#### Mise en équivalence MOS

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| Trace |   |   |   |   |
| Source |   |   |   |   |
| Evènement | X |   |   | Evenement |
| Acteurs de l'évènement |   |   |   |   |
| Objet de l'évènement |   |   |   |   |

Table : Mise en équivalence MOS

### Modélisation des flux d'informations

#### Flux 1 - TransmissionTrace

Figure : Flux 1 - TransmissionTrace

##### Classe "Trace"

Ensemble d'informations qu'un système enregistre à chaque action qui lui est associé.

| | |
| :--- | :--- |
| identifiant : [0..1] Identifiant | Identifiant de la trace. |

Table : Attributs de la classe "Trace"

##### Classe "SourceTrace"

Système ayant émis la trace de l'évènement.

| | |
| :--- | :--- |
| identifiant : [0..1] Identifiant | Identifiant de la source de la trace. |

Table : Attributs de la classe "SourceTrace"

##### Classe "Evenement"

Fait marquant relatif à un objet, une personne, un processus, etc

| | |
| :--- | :--- |
| typeEvenement : [0..1] Code | Code spécifiant le type de l'évènement. |
| sousTypeEvenement : [0..1] Code | Code spécifiant le sous type de l'évènement |
| occurence : [0..1] DateHeure | Date/heure à laquelle l'évènement est arrivé. |
| declaration : [0..1] DateHeure | Date/heure à laquelle l'évènement est déclaré. |
| description : [0..1] Texte | Description textuelle de l'évènement. |

Table : Attributs de la classe "Evenement"

##### Classe "ActeurEvenement"

Représente un acteur de l'évènement. De manière générale, il y aura un acteur émetteur, à l'origine de l'évènement et un acteur destinataire de l'évènement.

| | |
| :--- | :--- |
| identifiant : [1..1] Identifiant | Identifiant de l'acteur de l'évènement. |
| role : [1..1] Code | Rôle de l'acteur de l'évènement |

Table : Attributs de la classe "ActeurEvenement"

##### Classe "ObjetEvenement"

Détaille l'objet de l'évènement : tout objet impacté par un évènement qui doit être tracé.

| | |
| :--- | :--- |
| identifiant : [0..1] Identifiant | Identifiant de l'objet de l'évènement. |
| type : [0..1] Code | Type d'objet de l'évènement. |
| contenu : [0..1] ObjetBinaire | Le contenu correspond aux informations associées à l'évènement envoyées au gestionnaire de traces et qui doivent être conservées. Par exemple, l'identifiant du document recherché. |

Table : Attributs de la classe "ObjetEvenement"

#### Flux 2 - ConsultationTrace

Figure : Flux 2 - ConsultationTrace

##### Classe "Trace"

Ensemble d'informations qu'un système enregistre à chaque action qui lui est associé.

| | |
| :--- | :--- |
| identifiant : [0..1] Identifiant | Identifiant de la trace. |

Table : Attributs de la classe "Trace"

#### Flux 3 - ReponseConsultationTrace

Le modèle du flux est identique au flux 1 à la différence que la consultation peut ne retourner aucune trace.

#### Flux 5 - ReponseRechercheTraces

Le modèle du flux est identique au flux 1 à la différence que la consultation peut ne retourner aucune source, une seule ou plusieurs.

#### Flux de recherche : Flux 4 - RechercheTraces

| | | |
| :--- | :--- | :--- |
| Evenement/typeEvenement | Code spécifiant le type de l'évènement. | Non |
| Evenement/declaration | Date/heure à laquelle l'évènement est déclaré. | Non |
| Evenement/sousTypeEvenement | Code spécifiant le sous type de l'évènement | Non |
| Evenement/occurence | Date/heure à laquelle l'évènement est arrivé. | Non |
| ActeurEvenement/identifiant | Identifiant de l'acteur de l'évènement. | Non |
| ActeurEvenement/role | Rôle de l'acteur de l'évènement | Non |

Table : Flux de recherche

