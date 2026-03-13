# Via syslog - ANS - Traçabilité des événements v2.0.0-ballot

* [**Table of Contents**](toc.md)
* [**Volume 2 - Détail des transactions**](specifications_technique_intro.md)
* **Via syslog**

## Via syslog

### Solution 2 : Audit message DICOM, protocole Syslog et opération HTTP

La construction des flux consiste en la construction des requêtes ou des réponses syslog (pour la transmission de trace) et HTTP (pour la consultation et la recherche de trace).

Contrairement à la solution basée sur HL7 FHIR, il n'est pas prévu de pouvoir consulter une trace en particulier, le protocol Syslog ne permettant pas d'identifier de manière unique les messages échangés. En revanche, le message « Syslog Event Response message » est défini de telle sorte que l'entièreté des données des traces soit retournée au Consommateur de traces.

#### Flux 1 : TransmissionTrace

##### Construction du flux Syslog

Ce flux est construit selon les exigences de la transaction [IHE ITI-20 « Record Audit Event »](https://www.ihe.net/uploadedFiles/Documents/ITI/IHE_ITI_TF_Vol2a.pdf) dans sa version Syslog : « Send Audit Event Message - Syslog Interaction ». Certaines contraintes de cette transaction doivent être adaptées à chaque contexte métier, en particulier les éléments suivants de l'en-tête Syslog :

* PRI : défini la priorité. Le profil ATNA est destiné à tracer tous les évènements liées à la sécurité des données de santé ; les codes choisis par IHE peuvent ne pas être pertinent pour certains cas d'usage concrétisant cette spécification.
* MSGID : identifie le type de message. Devrait être propre à chaque cas d'usage pour permettre une identification rapide du contexte d'émission de la trace.

La première étape de construction de ce flux consiste à créer le message qui constituera le corps du message Syslog, le message d'audit au format DICOM si la concrétion de se volet ne définit pas un autre format pour le contenu de la trace.

Ce contenu est ensuite encapsulé dans un message syslog qui sera transmis via UDP ou TLS au gestionnaire de traces.

Un exemple de flux est joint (cf [Le fichier TDE_Flux01-versionSyslog.xml](TDE_Flux01-VersionSyslog.xml)).

#### Flux 4 : RechercheTraces

Ce flux est utilisé par le consommateur de traces pour faire une recherche de traces auprès du gestionnaire de traces.

##### Construction du flux HTTP

Dans le contexte d'une implémentation reposant sur le protocole Syslog pour le flux de transmission des traces, le flux 4 « RechercheTraces » est construit selon les exigences de la transaction IHE ITI-82 « Retrieve Syslog Event ». Cette transaction est une requête HTTP GET.

Les paramètres de recherche possibles sont ceux définis dans le cadre technique IHE ; ils font référence aux champs de l'en-tête syslog.

L'URL suivante est utilisée :

GET [base]/syslogsearch?date=le[start-time]&date=ge[stoptime]&<query>

Où [base] est le point de contact FHIR du gestionnaire de traces, [start-time] et [stop-time] indique l'intervalle de temps dans lequel les traces sont recherchées (date se réfère à la date d'enregistrement de l'évènement). <query> représente les autres paramètres, sous la forme param=valeur, permettant d'affiner la recherche.

###### Paramètres de recherche

La transaction [ITI-82] Retrieve Syslog Event exige que la recherche de traces soit bornée dans le temps. C'est-à-dire que le paramètre de recherche « date » qui correspond à la date d'enregistrement de l'évènement doit être présent pour préciser une limite de temps (avant, après ou un intervalle). Le tableau ci-dessous précise la mise en correspondance des paramètres de recherche identifiés dans l'étude métier avec les paramètres de recherche défini par IHE.

Le tableau ci-dessous propose des critères de recherche supplémentaires dans le cas où la trace est véhiculé au format DICOM AuditMessage. Dans le cas où la concrétisation de ce volet utilise un autre format de trace, ce tableau devra être revu.

| | | | |
| :--- | :--- | :--- | :--- |
| typeEvenement | eventID | texte | Type de l’évènement. Permet de filtrer sur le champ EventID |
| sousTypeEvement | EventTypeCode | texte | Sous-type de l’évènement. Permet de filtrer sur le champ EventTypeCode |
| dateOccurence |  |  |  |
| dateDeclaration | recorded | dateTime | Date à laquelle l’évènement a été enregistré |
| origine | Requestor | texte | Requestor identifie l’élément ActiveParticipant dont UserIsRequestor=true et userID correspond à la valeur du paramètre. |
| destinataire | Receiver | texte | Requestor identifie l’élément ActiveParticipant dont UserIsRequestor=false et userID correspond à la valeur du paramètre. |
| autreParametre | Chaque concrétisation de ses spécifications génériques peut ajouter des paramètres de recherche. | | |

#### Flux 5 : ReponseRechercheTraces

Ce flux véhicule le résultat de la recherche de traces.

##### Construction du flux HTTP

Dans le contexte d'un échange basé sur la transaction IHE ITI-82, ce flux est composé d'un code HTTP 200 ok et le corps de la réponse HTTP est un tableau de messages Syslog au format demandé par le consommateur de traces (JSON ou XML).

Pour des informations sur les autres codes HTTP (HTTP status code) retournés en cas d'échec, consulter le cadre technique IHE, section 3.82.4.2.2.

Un exemple de flux ci dessous :

```
{
{
Pri : “string”,
Version: “string”,
Timestamp: “2015-03-17T00:05”
Hostname: “string”
App-name: “string”
Procid: “string”
Msg-id : “string”
Structured-data : “string”
Msg : “string1”
Structured_data: “string”
}
{
Pri : “string”,
Version: “string”,
Timestamp: “2015-03-17T00:05”
Hostname: “string”
App-name: “string”
Procid: “string”
Msg-id : “string”
Msg : “string2”
}
}

```

