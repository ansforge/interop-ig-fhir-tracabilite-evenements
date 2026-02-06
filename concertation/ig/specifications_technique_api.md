# Via API REST - ANS - Traçabilité des événements v2.0.0-ballot

* [**Table of Contents**](toc.md)
* [**Volume 2 - Détail des transactions**](specifications_technique_intro.md)
* **Via API REST**

## Via API REST

### Solution 1 : Ressource AuditEvent et API FHIR REST

La construction des flux consiste en la construction des requêtes ou des réponses HTTP de l’API REST pour FHIR. Cette section présente les flux permettant d’échanger les informations identifiées dans les chapitres précédents.

## Flux 1 : TransmissionTrace

Ce flux permet de transmettre une trace « générique » de la « source des traces » vers le « gestionnaire des traces ».

### Construction du flux HL7 FHIR

Ce flux est construit selon les exigences de la transaction [IHE ITI-20 « Record Audit Event »](https://www.ihe.net/uploadedFiles/Documents/ITI/IHE_ITI_Suppl_RESTful-ATNA.pdf) dans sa version HL7 FHIR où une seule trace est transmise à la fois : « Send Audit Resource Request Message - FHIR Feed Interaction ». La première étape de construction de ce flux consiste à créer la ressource AuditEvent conformément aux exigences du contexte métier.

La ressource AuditEvent ainsi constituée sera envoyée dans le corps de la requête HTTP POST suivante :

```
POST [base]/AuditEvent

```

Où [base] est le point de contact FHIR défini par le Gestionnaire de trace.

## Flux 2 : ConsultationTrace

Ce flux n’est pas défini dans le contexte du protocole Syslog. Le Flux 2 « ConsultationTrace » permet au consommateur de traces de demander la consultation d’une trace dont l’identifiant est connu au gestionnaire de traces. Ce flux utilise l’interaction « read » de l’API REST de HL7 FHIR.

La première étape de construction de ce flux consiste à récupérer l’identifiant de la ressource AuditEvent représentant la trace à consulter. Cet identifiant est utilisé dans la requête GET suivante :

```
GET [base]/AuditEvent/[id]

```

Où [base] est le point de contact défini par le gestionnaire de trace et [id] l’identifiant système de la ressource AuditEvent à consulter.

## Flux 3 : ReponseConsultationTrace

Ce flux n’est pas défini dans le contexte du protocole Syslog. Le Flux 3 « ReponseConsultationTrace » correspond à la réponse du Gestionnaire de trace à la demande du Consommateur de traces de consulter une trace dont il connaît l’identifiant système (Flux 2).

Le flux 3 se compose d’un code HTTP 200 ok et d’un contenu. Le corps de la réponse HTTP est constitué de la ressource AuditEvent identifiée dans la demande. Pour des informations sur les autres codes HTTP (HTTP status code) retournés en cas d’échec, consultez la documentation relative à l’interaction « read » de l’API REST FHIR.

## Flux 4 : RechercheTraces

Ce flux est utilisé par le consommateur de traces pour faire une recherche de traces auprès du gestionnaire de traces.

### Construction du flux HL7 FHIR

Dans le contexte d’une implémentation en HL7 FHIR, le flux 4 est construit selon les exigences de l’interaction « search » de l’API REST de FHIR et, plus particulièrement, les exigences de la transaction [IHE ITI-81 « Retrieve ATNA Audit Event »](https://www.ihe.net/uploadedFiles/Documents/ITI/IHE_ITI_Suppl_RESTful-ATNA.pdf). Les paramètres de recherche possibles sont ceux définis par HL7 FHIR pour la ressource AuditEvent.

L’URL suivante est utilisée :

```
GET [base]/AuditEvent?date=ge[start-time]&date=le[stop-time]&<query>

```

Où [base] est le point de contact FHIR du gestionnaire de traces, [start-time] et [stop-time] indiquent l’intervalle de temps dans lequel les traces sont recherchées (date se réfère à la date d’enregistrement de l’évènement).  représente les autres paramètres, sous la forme param=valeur, permettant d’affiner la recherche.

Un exemple d’appel de recherche de traces est le suivant :

```
GET [base]/AuditEvent?date=ge2026-01-14&date=le2026-01-16&type=rest&subtype=operation

```

#### Paramètres de recherche

La transaction [ITI-81] Retrieve ATNA Audit Event exige que la recherche de traces soit bornée dans le temps. C’est-à-dire que le paramètre de recherche « date » qui correspond à la date d’enregistrement de l’évènement doit être présent pour préciser une limite de temps (avant, après ou un intervalle). Le tableau ci-dessous précise la mise en correspondance des paramètres de recherche identifiés dans l’étude métier avec les paramètres de recherche HL7 FHIR de la ressource AuditEvent.

L’élément apparaissant **en italique** correspond à un critère de recherche défini dans le cadre de cette spécification technique.

| | | | |
| :--- | :--- | :--- | :--- |
| typeEvenement | type | token | Type de l’évènement qui a été tracé |
| sousTypeEvement | subtype | token | Sous-type de l’évènement qui a été tracé |
| dateOccurence | **TDE_AuditEvent_period-start** | dateTime | Date d’occurrence de l’évènement |
| dateDeclaration | date | dateTime | Date à laquelle l’évènement a été enregistré |
| origine | agentagent-namealtId | referencestringtoken | Les paramètres agent, agent-name et/ou altId peuvent être utilisés pour identifier l’origine de la trace |
| agent-role | token | agent-role aura pour valeur le code utilisé pour indiquer que l’agent est l’origine de la trace | |
| destinataire | agentagent-namealtId | referencestringtoken | Les paramètres agent, agent-name et/ou altId peuvent être utilisés pour identifier l’origine de la l’évènement |
| agent-role | token | agent-role aura pour valeur le code utilisé pour indiquer que l’agent est le destinataire de l’évènement | |
| autreParametre | Chaque concrétisation de ses spécifications génériques peut ajouter des paramètres de recherche.[HL7 FHIR](https://www.hl7.org/fhir/auditevent.html#search)en définit d’autres paramètres peuvent être définis par profilage | | |

## Flux 5 : ReponseRechercheTraces

Ce flux véhicule le résultat de la recherche de traces.

### Construction du flux HL7 FHIR

Dans le contexte d’un échange basé sur le standard HL7 FHIR, ce flux est basé sur les ressources FHIR Bundle, AuditEvent et OperationOutcome (en cas d’erreur) telles qu’utilisées dans la transaction IHE ITI-81 « Retrieve ATNA Audit Event ». Conformément au supplément RESTful ATNA du profil IHE ATNA, la réponse retournée par le Gestionnaire de trace au Consommateur de traces est composée d’un Bundle (profil TDE_BundleResultatReponseRechercheTraces) de type « searchset » encapsulant 0, 1 à plusieurs ressources AuditEvent (profil TDE_AuditEvent). La ressource Bundle constituera alors le corps de la réponse HTTP 200 ok. Pour des informations sur les autres codes HTTP (HTTP status code) retournés en cas d’échec, consultez la documentation relative à l’interaction [« read »](https://hl7.org/fhir/R4/http.html#read) de l’API REST FHIR.

