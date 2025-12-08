# Spécifications techniques - ANS IG Example v0.1.0

* [**Table of Contents**](toc.md)
* **Spécifications techniques**

## Spécifications techniques

Ce document s’adresse aux maîtrises d’œuvre des systèmes d’information qui implémentent des fonctionnalités de traçabilité d’évènements. Cette spécification technique s’appuie sur le standard HL7 FHIR R4 et sur le le supplément au profil ATNA (Audit Trail and Node Authentication) RESTful ATNA1 d’IHE. L’hypothèse est faite que le lecteur est familier de ces concepts.

## Standards utilisés

Ces spécifications techniques se basent sur le standard HL7 FHIR (R4) et sur le profil IHE ATNA et, plus particulièrement, le supplément RESTful ATNA. La version actuelle du profil ATNA se base sur les standards DICOM et syslog. Le supplément RESTful ATNA vise à ajouter des interfaces HL7 FHIR R4 aux acteurs impliqués dans ce profil. Ces spécifications font référence :

* D’une part, à la ressource AuditEvent ainsi qu’aux spécifications de l’API REST FHIR ;
* D’autre part, au protocole et à la structure de messages syslog, éventuellement couplée à la structure de message d’audit définie par DICOM2.

La syntaxe utilisée pour les exemples HL7 FHIR de ces spécifications est la syntaxe JSON.

### Profil IHE utilisé

Le profil utilisé est le profil IHE ATNA qui offre les fonctionnalités suivantes :

* Enregistrement de traces dans un dépôt via la transaction ITI-20
* Recherche de traces basée sur le contenu des traces via la transaction ITI-81 (opération

« Search » de l’API REST FHIR);

* Recherche de traces basées sur les métadonnées syslog via la transaction ITI-82 (Opération HTTP GET avec une URL paramétrique).

1 https[://www.ihe.net/uploadedFiles/Documents/ITI/IHE_ITI_Suppl_RESTful-ATNA.pdf](http://www.ihe.net/uploadedFiles/Documents/ITI/IHE_ITI_Suppl_RESTful-ATNA.pdf) 2 [http://dicom.nema.org/dicom/2013/output/chtml/part15/sect_A.5.html](http://dicom.nema.org/dicom/2013/output/chtml/part15/sect_A.5.html)

### Ressources FHIR utilisées

La principale ressource HL7 FHIR utilisée est la suivante :

* AuditEvent

Les ressources Practionner et PrationnerRole peuvent aussi être utilisées, référencées par la ressource AuditEvent. Le tableau ci-après spécifie les profils utilisés pour les ressources et types de données mentionnés dans ce document. Les présentes spécifications définissent également un profil propre au présent volet (préfixe TDE). Pour les ressources et types de données non mentionnés dans ce tableau, le profil à utiliser est celui défini par HL7 FHIR.

| | | |
| :--- | :--- | :--- |
| AuditEvent | TDE_AuditEvent | Profil défini dans ce volet |
| Bundle | TDE_BundleResultatReponseRechercheTraces | Profil défini dans ce volet |

****Tableau 1 : Profils des ressources FHIR utilisés dans le volet TDE**** **_Note éditoriale :_** Dans l’ensemble de ce document, lorsqu’il est fait référence à la ressource AuditEvent, il est entendu que le profil TDE_AuditEvent doit être utilisé.

## Utilisation

Les spécifications d'interopérabilité présentées dans ce volet ne présagent pas des conditions de leur mise en œuvre dans le cadre d'un système d'information partagé. Il appartient à tout responsable de traitement de s'assurer que les services utilisant ces spécifications respectent les cadres et bonnes pratiques applicables à ce genre de service (ex : cadre juridique, bonnes pratiques de sécurité, ergonomie, accessibilité …). Il est à noter que les contraintes de sécurité concernant les flux échangés ne sont pas traitées dans ce document. Celles-ci sont du ressort de chaque responsable de l’implémentation du mécanisme qui est dans l’obligation de se conformer au cadre juridique en la matière. L’ANS propose des référentiels dédiés à la politique de sécurité (la PGSSI-S3) et des mécanismes de sécurisation sont définis dans les volets de la couche Transport4 du Cadre d’Interopérabilité des systèmes d’information de santé (CI-SIS). 3 [_https://esante.gouv.fr/securite/politique-generale-de-securite-des-systemes-d-information-de-sante_](https://esante.gouv.fr/securite/politique-generale-de-securite-des-systemes-d-information-de-sante) 4 [_http://esante.gouv.fr/services/referentiels/ci-sis/espace-publication/couche-transport_](http://esante.gouv.fr/services/referentiels/ci-sis/espace-publication/couche-transport)

# Contenu structuré des flux

## Correspondance entre objets métier et objets des standards HL7 FHIR, DICOM et syslog

Dans cette section, une mise en correspondance est faite entre :

* Les objets métier identifiés à l’issue de l’étude métier,
* Les ressources et éléments, du standard HL7 FHIR,
* Les éléments du standard syslog,
* Les éléments du standard DICOM. Pour chaque objet métier, les tableaux ci-après reprennent l’ensemble des éléments métier identifiés dans l’étude métier du cas d’usage. Pour chaque attribut de chaque classe métier, la ressource FHIR et plus particulièrement l’élément de cette ressource qui sera utilisé pour véhiculer l’information est identifié. Il en est de même pour les éléments des standards DICOM et syslog. Ce travail concerne les flux structurés énumérés ci-dessous :
* Flux 1 - TransmissionTrace : demande d’enregistrement d’une trace dans un gestionnaire de trace ;
* Flux 2 - ConsultationTrace : demande de consultation d’une trace en particulier ;
* Flux 3 - ReponseConsultationTrace : retourne la trace demandée par le flux 2 ;
* Flux 4 - RechercheTraces : recherche de traces avec une liste de critères de recherche ;
* Flux 5 - ReponseRechercheTraces : retourne la liste des traces répondant aux critères de recherche. Le flux 1bis « RetourTransmissionTrace » a été identifié mais n’est pas inclus dans le périmètre de cette spécification technique. Pour rappel :
* L’objet « Trace » contient les éléments relatifs à la source de la trace et à l’évènement qui est tracé dans le système d’information.
* L’objet « Evenement » comprend les différents attributs d’un événement : l’identifiant de l’évènement, son type, la date à laquelle il a eu lieu (occurrence) et la date à laquelle il a été déclaré (déclaration). D’autre part, il permet d’identifier les acteurs à l’origine et à destination de l’évènement ainsi que l’objet de cet évènement. Le terme « objet de l’évènement » se réfère à l’objet des données qui ont été échangées comme par exemple le patient ou un dispositif médical.

### Mise en correspondance avec le standard HL7 FHIR

Le tableau ci-dessous représente la mise en correspondance de l’objet « Trace » avec la ressource FHIR AuditEvent.

| | | | |
| :--- | :--- | :--- | :--- |
| **Nom classes** | **Nom attributs** | **Ressource** | **Elément** |
| Trace | identifiant [0..1] : Identifiant | AuditEvent | id [1..1] id |
| SourceTrace [0..1] | identifiant [0..1] : Identifiant | source [1..1].observer[1..1]. identifier [0..*] identifierReference (PractitionerRole|Practitioner| Organization|Device|Patient|R elatedPerson) | |
| Événement [1..1] | typeEvenement [0..1] Code | type [1..1] coding**Audit Event ID (extensible)1** | |
| sousTypeEvenement [0..1] Code | subtype [0..1] coding**Audit Event Sub-Type (extensible)1** | | |
| occurence [0..1] DateHeure | period[0..1].start[0..1] dateTime | | |
| declaration [0..1] DateHeure | recorded [1..1] instant | | |
| description [0..1] Texte | outcomeDesc [0..1] string | | |
| ActeurEvenement [0..2] | identifiant [1..1] Identifiant | agent[1..*].who[0..1].identifier [0..*] identifierReference (PractitionerRole|Practitioner| Organization| Device|Patient|RelatedPerson) | |
| role [1..1] Code | agent[0..1].role[0..*] CodeableConcept | | |
| ObjetEvenement [0..*] | type [0..1] Code | entity[0..*].type[0..1] Coding | |
| contenu [0..1] ObjetBinaire | entity[0..*].what Referenceou entity[0..*].query[0..1] base64Binaryou entity[0..*].detail[0..*] BackBoneElement | | |

##### Tableau 2 Mise en correspondance entre l'objet Trace et la ressource FHIR AuditEvent

Le contenu (ObjetEvenement.contenu) à véhiculer dans la trace sera défini par chaque instanciation de ce volet. Il peut s’agir d’une autre ressource FHIR auquel cas elle sera référencée par entity.what, des paramètres utilisés pour faire une recherche qui pourront être recopiés dans le champ entity.query ou de tout autre contenu qui pourra être véhiculé dans le champ entity.detail.value.

### Mise en correspondance avec le standard HL7 DICOM

###

Le tableau ci-dessous représente la mise en correspondance de l’objet « Trace » avec la structure AuditMessage définie par DICOM.

| | | | |
| :--- | :--- | :--- | :--- |
| **Nom classes** | **Nom attributs** | **Elément du schéma AuditMessage** | **Sous-Elément** |
| Trace | identifiant [0..1] : Identifiant |  |  |
| SourceTrace [0..1] | identifiant [0..1] : Identifiant | SourceAuditIdentification | AuditEnterpriseSiteId |
| Événement [1..1] | typeEvenement [0..1] Code | EventIdentification | EventID [1..1] |
| sousTypeEvenement [0..1] Code | EventTypeCode [1..1] | | |
| occurence [0..1] DateHeure | EventDateTime [1..1] | | |
| declaration [0..1] DateHeure | Possibilité utiliser le champ« TIMESTAMP » du protocole syslog | | |
| description [0..1] Texte | EventOutcomeDescription | | |
| ActeurEvenement [0..2] | identifiant [1..1] Identifiant | ActiveParticipant | ActiveParticipant userId [1..1] |
| role [1..1] Code | RoleIdCode | | |
| ObjetEvenement [0..*] | type [0..1] Code | ParticipantObjectIdentific ation | ParticipantObjectTypeCode |
| contenu [0..1] ObjetBinaire | ParticipantObjectDetail.valueou ParticipantObjectQuery ou ParticipantObjectID | | |

##### Tableau 3 Mise en correspondance entre l'objet Trace et le schema AuditMessage de DICOM

Le contenu à véhiculer dans la trace sera défini par chaque instanciation de ce volet. Il peut s’agir des paramètres utilisés pour faire une recherche qui pourront être recopiés dans le champ ParticipantObjectQuery de l’élément ParticipantObjectIdentification ou de tout autre contenu qui pourra être véhiculé dans le champ ParticipantObjectDetail.value.

## Contenu des flux structurés

Ces spécifications techniques présentent deux manières de représenter et d’échanger l’information dans le contexte du volet générique « Traçabilité d’évènements ». Cette section définies le contenu structuré des flux dans chacun des deux cas suivants :

* La trace est représentée par la ressource HL7 FHIR R4 AuditEvent
* La trace est représentée par le message DICOM AuditMessage (XML)

Le contenu structuré devra être revu et potentiellement amendé pour chaque concrétisation spécifique à un cas d’usage défini. Cependant, les règles suivantes s’appliquent :

* Les éléments définis comme obligatoires (cardinalité 1..1 ou 1..*) par le standard (HL7 FHIR ou DICOM) ou par cette spécification technique ne peuvent être rendus optionnels ;
* Les éléments qui ne sont pas répétables dans cette spécification (cardinalité maximum finie) ne peuvent pas être définis répétables ;
* Les jeux de valeur dont le contenu est une liste stricte de valeurs codées (required indiqué entre parenthèses dans les tableaux suivants) ne peuvent pas être modifiés.

En revanche, en fonction des besoins du cas d’usage, il est possible de :

* Rendre obligatoire certains éléments actuellement optionnel dans ces spécifications techniques ;
* Définir des jeux de valeur pour les champs codés du moment que le jeu de valeur n’est pas défini

(binding = example) ni limité à un ensemble fini de valeurs (binding = extensible);

* Limiter le nombre de répétitions des champs dont la cardinalité maximum est infinie (*).

Lors de la concrétisation de cette spécification, il est conseillé de recopier les tableaux des sections suivantes et de compléter la colonne « contrainte » pour indiquer quelles sont les contraintes spécifiques au cas d’usage.

### Ressource HL7 FHIR « AuditEvent »

Le tableau ci-dessous reprend la ressource FHIR AuditEvent, identifiée pour représenter le concept métier « Trace ». Les éléments retenus lors de la mise en correspondance sont repris et complétés par d’autres éléments qui sont obligatoires selon les spécifications FHIR et sont listés dans l’ordre requis par ces dernières. Les cardinalités retenues sont les cardinalités métier lorsque celle-ci sont plus strictes que les cardinalités du standard.

Les éléments qui constituent des extensions ou des éléments de ressources contenues seront précisés dans la colonne « Contraintes » des tableaux concernés.

En annexe, des exemples permettent de mieux comprendre la composition des ressources. Le concept métier « Trace » correspond à la ressource HL7 FHIR « AuditEvent ».

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| AuditEvent | id | id [0..1] |  | Identifiant unique de la trance |
| type | Coding [1..1] |  | Identifiant de l’événementJeu de valeurs :[_AuditEvent ID_</a(extensible)</p> </td> </tr>subtypeCoding [0..*]Cardinalité contrainte à [0..1]Type d’événementJeu de valeurs :[_Audit Event Sub-Type_</a(extensible)</p> </td> </tr>actioncode [0..1]Type d’action réalisée pendant l’évènementperiod.startdateTime [0..1]Cardinalité contrainte à [1..1]Date d’occurrence (début de l’évènement)period.enddateTime [0..1]Date de fin de l’évènement</tr>recordedinstant [1..1]Date / Heure de la déclaration de l’événementoutcomecode [0..1]Indicateur de succès ou d’échec de l’évènementJeu de valeurs:[_AuditEventOutcome_](https://www.hl7.org/fhir/valueset-audit-event-outcome.html)(required)outcomeDes cstring [0..1]Description de l’issue de l’évènementpurposeOfEv entLa ou les raisons de l’évènementagentBackboneElement [1..*]Contraint à [1..2] pour représenter l’origine et ledestinataire de l’évènement.Décrit les acteurs (système, personnes) à l’origine et à destination de l’évènement.sourceBackboneElement [1..1]Décrit le système émetteur de la traceentityBackboneElement [0..*]Décrit le ou les objets de l’évènement</thead>agenttypeCodeableConcept [0..1]Type d’acteurJeu de valeur :[_ParticipationRoleType_](https://www.hl7.org/fhir/valueset-participation-role-type.html)(Extensible)roleCodeableConcept [0..1]Rôle de l’acteur dans l’évenementJeu de valeur :[_SecurityRoleType_](https://www.hl7.org/fhir/valueset-security-role-type.html)(example)whoReference(Practitione rRole | Practitioner | Organization | Device| Patient | RelatedPerson) [0..1]Cardinalité contrainte à [1..1]A noter que l’attribut identifier de la ressource référencée est contrainte à la cardinalité [1..*]Si l’acteur est représenté par une ressource dans le système d’information, cette dernière doit être référencée icialtIdstring [0..1]Identification alternative de l’acteurnamestring [0..1]Nom de l’acteur (compréhensible par un utilisateur)</table>
| | | | |
| :--- | :--- | :--- | :--- |
| location | Reference(Location) [0..1] |  | Indique où se trouve l’acteur de l’évènement |
| policy | uri [0..*] |  | Règles qui autorisent l’évènement |
| media | Coding [0..1] |  | Si l’évènement concerne l’import ou l’exportation de données, le type de support impliqué.Jeu de valeurs :[_Media Code Type_</a(extensible)</p> </th> </tr>network.addr essstring [0..1]Identifiant de l’équipement utilisé par l’acteurnetwork.typecode [0..1]Type de point d’accès de l’équipement utilisé par l’acteurJeu de valeurs :[_AuditEventAgentNetworkType_](https://www.hl7.org/fhir/valueset-network-type.html)(required)purposeOfUs eCodableConcept [0..*]Les raisons que l’utilisateur a de participer à cet évènement</thead>sourcesitestring [0..1]Emplacement de la source de la trace au sein du système d’informationobserverReference(Practitione rRole | Practitioner | Organization | Device | Patient |RelatedPerson) [1..1]Identifie la source de la tracetypeCoding [0..*]Identifie le type de sourceJeu de valeurs:[_Audit Event Source Type_</a(Extensible)</p> </td> </tr>entitywhatReference(Any) [0..1]Référence la ressource objet de l’évènement (ex : ressource Patient, Device)typeCoding [0..1]Type d’objetJeu de valeurs:[_Audit event entity type_</a(Extensible)</p> </td> </tr>roleCoding [0..1]Rôle de cet objet dans l’évènementJeu de valeurs :[_AuditEventEntityRole_](https://www.hl7.org/fhir/valueset-object-role.html)(Extensible)lifecycleCoding [0..1]Etat de l’objet dans son cycle de vie</tbody> </table>
| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| securityLabel | Coding [0..*] |  | Etiquettes de sécurité liées à l’objetJeu de valeurs :[_SecurityLabels_](https://www.hl7.org/fhir/valueset-security-labels.html)(Extensible) | |
| name | string [0..1] |  | Nom de l’objet | |
| description | string [0..1] |  | Description textuelle de l’objet | |
| query | base64Binary [0..1] |  | Paramètres de recherche | |
| detail | BackboneElement [0..*] |  | Contenu de la trace quand celui-ci ne peut pas être véhiculé par les champs what, name ou query. | |
| detail | type | string [1..1] |  | Nom de la propriété |
| value[] | string oubase64Binary [1..1] |  | contenu de la trace | |
### DICOM Audit message Le tableau ci-dessous reprend la structure du message DICOM AuditMessage, identifié pour représenter le concept métier « Trace ». Les éléments retenus lors de la mise en correspondance sont repris et complétés par d’autres éléments qui sont obligatoires selon les spécifications DICOM et sont listés dans l’ordre requis par ces dernières. Les cardinalités retenues sont les cardinalités métier lorsque celle-ci sont plus strictes que les cardinalités du standard. En annexe, des exemples permettent de mieux comprendre la composition du message d’audit DICOM.
| | | | | | |
| :--- | :--- | :--- | :--- | :--- | :--- |
| AuditMessage | EventActionCode | token [0..1] |  | Identifie le type d’action entreprise pendant l’évènementJeu de valeurs (required) | |
| EventDateTime | dateTime [1..1] |  | Date à laquelle l’évènement a eu lieu | | |
| EventOutcomeIndicator | token [1..1] |  | Indique si l’évènement a été ou non un succèsJeu de valeurs (required) | | |
| EventID | CodedValueType [1..1] |  | Identifie le type d’évènement | | |
| EventTypeCode | CodedValueType [0..*] |  | Précise la l’évènement | catégorie | de |
| EventOutcomeDescripti on | string [0..1] |  | Description l’évènement | de l’issue | de |

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| ActiveParticipant | [1..*] | Cardinalité contrainte à [1..2] pour représenter l’origine et le destinataire de l’évènement. | Identifie le ou les acteurs qui ont pris part à l’évènement | |
| AuditSourceIdentificatio n | [1..1] |  | Identifie le système à l’origine de la trace | |
| ParticipantObjectIdentifi cation | [0..*] |  | Identifie le ou les objets de l’évènement. | |
|  | userID | string [1..1] |  | Identifie de manière unique l’utilisateur qui participe activement à l’évènement |
|  | AlternativeUserID | string [0..1] |  | Identifiant unique alternatif |
|  | UserName | string [0..1] |  | Name de l’utilisateur (exploitable par un humain) |
|  |  |  |  | Indique si l’acteur est à l’originie ou à destination de l’évènement. |
|  | UserIsRequestor | boolean [1..1] | * True si l’acteur a initié l’évènement
 | |
|  |  |  | False si l’acteur est destinataire de l’évènement. | |
| ActiveParticipant | NetworkAccessPointID | token [0..1] |  | Identifie l’acteur d’un point de vue réseau (nom de la machine ou adresse IP, ou numéro de téléphone ou email adresse ou URI) |
|  | NetworkAccessPointTy peCode | token [0..1] |  | Indique le type d’équipement identifié parNetworkAccessPointID |
|  |  |  | Jeu de valeur (required) | |
|  | RoleIDCode | CodedValueType [0..*] |  | Liste les rôles de l’utilisateurJeu de valeurs (extensible) |
|  | MediaIdentifier | string [0..1] |  | Identifiant du media (ID du Volume, URI, ou tout autre élément permettant d’identifier le média) quand celui émet ou reçoit de l’information. |
|  | MediaType | CodedValueType [0..1] |  | Type de médiaJeu de valeurs (extensible) |

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| AuditSourceID | token [1..1] |  | Identifiant de la source | |
| AuditSourceTypeCode | AuditSourceType CodeContent [0..*] |  | Type de sourceJeu de valeurs (extensible) | |
| ParticipantObjectI dentification | ParticipantObjectID | token [0..1] |  | Identifie une instance spécifique de l'objet de l'évènement |
| ParticipantObjectTypeC ode | token [0..1] |  | décrit le type d'identifiant qui est contenu dans ParticipantObjectID Jeu de valeurs (extensible) | |
| ParticipantObjectTypeC odeRole | token [0..1] |  | Rôle de l’objet de l’évènementJeu de valeurs (required) | |
| ParticipantObjectDataLi feCycle | token [0..1] |  | Etat de l’objet dans son cycle de vieJeu de valeurs (required) | |
| ParticipantObjectSensiti vity | token [0..1] |  | Règles qui autorisent l’évènement | |
| ParticipantObjectIDTyp eCode | CodedValueType [1..1] |  | Décrit l’identifiant qui est donné dans le champ ParticipantObjectID | |
| ParticipantObjectName | token [0..1] |  | Description de l’objet de l’évènement, par exemple, nom de la personne. | |
| ParticipantObjectQuery | base64Binary [0..1] |  | Le contenu de la requête qui a été exécutée dans le cas où l’évènement est une recherche. | |
| ParticipantObjectDetail | ValuePair [0..*] |  | Contenu de la trace quand celui-ci ne peut pas être véhiculé par les champs ParticipantObjectName ou ParticipantObjectQuery | |
| ParticipantObjectDescri ption | DICOMObjectDes criptionContents [0..*] |  | Permet de décrire plus finement les objets DICOM impliqués dans l’évènement. | |
| DICOMObjectDes criptionContents | MPPS | UID [0..*] |  | UID des MPPS associée à l’objet de l’évènement |
| Accession | Number [0..*] |  | Accession number | |
| SOPClass | [0..*] |  | Les UIDs des SOP Class DICOM de l’objet | |

| | | | |
| :--- | :--- | :--- | :--- |
| Encrypted | [0..1] |  | Positionné à True si les données ont été encryptées, False sinon. |
| Anonymyzed | [0..1] |  | Positionné à True si toutes les données relatives à l’identité du patient ont été anonymisées, False sinon. |
# Construction des flux Dans ces spécifications techniques, deux solutions sont retenues pour supporter les échanges définis au cours de l’étude métier pour le volet générique de traçabilité d’évènements : * Solution 1 basée sur l’API REST de HL7 FHIR avec pour contenu la ressource AuditEvent ; * Solution 2 basée sur le protocole Syslog pour la transmission et une API HTTP REST pour la recherche et la consultation. Cette seconde solution préconise l’utilisation des messages DICOM AuditMessage pour véhiculer l’information mais ne limite pas l’implémentation à ce seul format. Bien que ces deux solutions puissent coexister pour répondre à un cas d’usage, il est important de noter que au moins deux structures de traces vont alors coexister au sein du gestionnaire de traces (HL7 FHIR AuditEvent et DICOM Audit Message) et que les possibilités de recherche offertes par les transactions ITI-81 et ITI-82 du cadre technique IHE portent sur deux ensembles de données distincts : * Le contenu des ressources AuditEvent dans le cas de la transaction ITI-81 ; * Les méta données Syslog dans le cas de la transaction ITI-82. Il conviendra certainement que chaque cas d’usage implémentant ce volet générique choisisse l’une ou l’autre des solutions pour éviter toute incohérence au sein du système d’information. Des tables de mises en correspondance entre DICOM Audit Message et HL7 FHIR AuditEvent sont mises à disposition dans le standard HL7 FHIR et dans le supplément RESTful ATNA publié par IHE. ## Synthèse des flux ### Solution 1 : Ressource AuditEvent et API FHIR REST La construction des flux consiste en la construction des requêtes ou des réponses HTTP de l’API REST pour FHIR. Cette section présente les flux permettant d’échanger les informations identifiées dans les chapitres précédents.![](st_image4.jpeg)### Solution 2 : Audit message DICOM, protocole Syslog et opération HTTP La construction des flux consiste en la construction des requêtes ou des réponses syslog (pour la transmission de trace) et HTTP (pour la consultation et la recherche de trace).![](st_image5.jpeg)Contrairement à la solution basée sur HL7 FHIR, il n’est pas prévu de pouvoir consulter une trace en particulier, le protocol Syslog ne permettant pas d’identifier de manière unique les messages échangés. En revanche, le message « Syslog Event Response message » est défini de telle sorte que l’entièreté des données des traces soit retournée au Consommateur de traces. ## Flux 1 : TransmissionTrace Ce flux permet de transmettre une trace « générique » de la « source des traces » vers le « gestionnaire des traces ». ### Construction du flux HL7 FHIR Ce flux est construit selon les exigences de la transaction IHE ITI-205 « Record Audit Event » dans sa version HL7 FHIR où une seule trace est transmise à la fois : « Send Audit Resource Request Message \- FHIR Feed Interaction » . La première étape de construction de ce flux consiste à créer la ressource AuditEvent conformément aux exigences du contexte métier. La ressource AuditEvent ainsi constituée sera envoyée dans le corps de la requête HTTP POST suivante : POST \[base\]/AuditEvent Où \[base\] est le point de contact FHIR défini par le Gestionnaire de trace. Un exemple de flux est joint (cf [_annexe 3_:](#annexe-3-exemples-de-flux) ). ### Construction du flux Syslog Ce flux est construit selon les exigences de la transaction IHE ITI-206 « Record Audit Event » dans sa version Syslog : « Send Audit Event Message - Syslog Interaction ». Certaines contraintes de cette transaction doivent être adaptées à chaque contexte métier, en particulier les éléments suivants de l’en- tête Syslog : * PRI : défini la priorité. Le profil ATNA est destiné à tracer tous les évènements liées à la sécurité des données de santé ; les codes choisis par IHE peuvent ne pas être pertinent pour certains cas d’usage concrétisant cette spécification. * MSGID : identifie le type de message. Devrait être propre à chaque cas d’usage pour permettre une identification rapide du contexte d’émission de la trace. La première étape de construction de ce flux consiste à créer le message qui constituera le corps du message Syslog, le message d’audit au format DICOM si la concrétion de se volet ne définit pas un autre format pour le contenu de la trace. Ce contenu est ensuite encapsulé dans un message syslog qui sera transmis via UDP ou TLS au gestionnaire de traces. 5 [_https://www.ihe.net/uploadedFiles/Documents/ITI/IHE_ITI_Suppl_RESTful-ATNA.pdf_](https://www.ihe.net/uploadedFiles/Documents/ITI/IHE_ITI_Suppl_RESTful-ATNA.pdf) section 3.20 6 [_https://www.ihe.net/uploadedFiles/Documents/ITI/IHE_ITI_TF_Vol2a.pdf_](https://www.ihe.net/uploadedFiles/Documents/ITI/IHE_ITI_TF_Vol2a.pdf) Section 3.20 Un exemple de flux est joint (cf [_annexe 3_](#annexe-3-exemples-de-flux)). ## Flux 2 : ConsultationTrace Ce flux n’est pas défini dans le contexte du protocole Syslog. Le Flux 2 « ConsultationTrace » permet au consommateur de traces de demander la consultation d’une trace dont l’identifiant est connu au gestionnaire de traces. Ce flux utilise l’interaction « read » de l’API REST de HL7 FHIR. La première étape de construction de ce flux consiste à récupérer l’identifiant de la ressource AuditEvent représentant la trace à consulter. Cet identifiant est utilisé dans la requête GET suivante : GET \[base\]/AuditEvent/\[id\] Où \[base\] est le point de contact défini par le gestionnaire de trace et \[id\] l’identifiant système de la ressource AuditEvent à consulter. ## Flux 3 : ReponseConsultationTrace Ce flux n’est pas défini dans le contexte du protocole Syslog. Le Flux 3 « ReponseConsultationTrace » correspond à la réponse du Gestionnaire de trace à la demande du Consommateur de traces de consulter une trace dont il connaît l’identifiant système (Flux 2). Le flux 3 se compose d’un code HTTP 200 ok et d’un contenu. Le corps de la réponse HTTP est consituée de la ressource AuditEvent identifiée dans la demande. Pour des informations sur les autres codes HTTP (HTTP status code) retournés en cas d’échec, consultez la documentation relative à l’interaction « read » de l’API REST FHIR. ## Flux 4 : RechercheTraces Ce flux est utilisé par le consommateur de traces pour faire une recherche de traces auprès du gestionnaire de traces. ### Construction du flux HL7 FHIR Dans le contexte d’une implémentation en HL7 FHIR, le flux 4 est construit selon les exigences de l’interaction « search » de l’API REST de FHIR et, plus particulièrement, les exigences de la transaction IHE ITI-817 « Retrieve ATNA Audit Event ». Les paramètres de recherche possibles sont ceux définis par HL7 FHIR pour la ressource AuditEvent. L’URL suivante est utilisée : 7 [_https://www.ihe.net/uploadedFiles/Documents/ITI/IHE_ITI_Suppl_RESTful-ATNA.pdf_](https://www.ihe.net/uploadedFiles/Documents/ITI/IHE_ITI_Suppl_RESTful-ATNA.pdf) Section 3.81 GET \[base\]/AuditEvent?date=ge\[start-time\]&date=le\[stop-time\]&\<query\> Où \[base\] est le point de contact FHIR du gestionnaire de traces, \[start-time\] et \[stop-time\] indique l’intervalle de temps dans lequel les traces sont recherchées (date se réfère à la date d’enregistrement de l’évènement). \<query\représente les autres paramètres, sous la forme param=valeur, permettant d’affiner la recherche. #### Paramètres de recherche La transaction \[ITI-81\] Retrieve ATNA Audit Event exige que la recherche de traces soit bornée dans le temps. C’est-à-dire que le paramètre de recherche « date » qui correspond à la date d’enregistrement de l’évènement doit être présent pour préciser une limite de temps (avant, après ou un intervalle). Le tableau ci-dessous précise la mise en correspondance des paramètres de recherche identifiés dans l’étude métier avec les paramètres de recherche HL7 FHIR de la ressource AuditEvent. L’élément apparaissant *en italique et en rouge* correspond à un critère de recherche défini dans le cadre de cette spécification technique.
| | | | |
| :--- | :--- | :--- | :--- |
| typeEvenement | type | token | Type de l’évènement qui a été tracé |
| sousTypeEvement | subtype | token | Sous-type de l’évènement qui a été tracé |
| dateOccurence | **TDE_AuditEvent_period- start** | dateTime | Date d’occurrence de l’évènement |
| dateDeclaration | recorded | dateTime | Date à laquelle l’évènement a été enregistré |
| origine | agent agent-namealtId | reference stringtoken | Les paramètres agent, agent-name et/ou altId peuvent être utilisés pour identifier l’origine de la trace |
| agent-role | token | agent-role aura pour valeur le code utilisé pour indiquer que l’agent est l’origine de la trace | |
| destinataire | agent agent-namealtId | reference stringtoken | Les paramètres agent, agent-name et/ou altId peuvent être utilisés pour identifier l’origine de la l’évènement |
| agent-role | token | agent-role aura pour valeur le code utilisé pour indiquer que l’agent est le destinataire de l’évènement | |
| autreParametre | Chaque concrétisation de ses spécifications génériques peut ajouter des paramètres de recherche. HL7 FHIR en définit8, d’autres paramètres peuvent être définis par profilage. | | |
### Construction du flux HTTP Dans le contexte d’une implémentation reposant sur le protocole Syslog pour le flux de transmission des traces, le flux 4 « RechercheTraces » est construit selon les exigences de la transaction IHE ITI-82 « Retrieve Syslog Event ». Cette transaction est une requête HTTP GET. 8 [_https://www.hl7.org/fhir/auditevent.html#search_](https://www.hl7.org/fhir/auditevent.html#search) Les paramètres de recherche possibles sont ceux définis dans le cadre technique IHE ; ils font référence aux champs de l’en-tête syslog. L’URL suivante est utilisée : GET \[base\]/syslogsearch?date=le\[start-time\]&date=ge\[stoptime\]&\<query\> Où \[base\] est le point de contact FHIR du gestionnaire de traces, \[start-time\] et \[stop-time\] indique l’intervalle de temps dans lequel les traces sont recherchées (date se réfère à la date d’enregistrement de l’évènement). \<query\représente les autres paramètres, sous la forme param=valeur, permettant d’affiner la recherche. #### Paramètres de recherche La transaction \[ITI-82\] Retrieve Syslog Event exige que la recherche de traces soit bornée dans le temps. C’est-à-dire que le paramètre de recherche « date » qui correspond à la date d’enregistrement de l’évènement doit être présent pour préciser une limite de temps (avant, après ou un intervalle). Le tableau ci-dessous précise la mise en correspondance des paramètres de recherche identifiés dans l’étude métier avec les paramètres de recherche défini par IHE. Le tableau ci-dessous propose des critères de recherche supplémentaires dans le cas où la trace est véhiculé au format DICOM AuditMessage. Dans le cas où la concrétisation de ce volet utilise un autre format de trace, ce tableau devra être revu.
| | | | |
| :--- | :--- | :--- | :--- |
| typeEvenement | eventID | texte | Type de l’évènement. Permet de filtrer sur le champ EventID |
| sousTypeEvement | EventTypeCode | texte | Sous-type de l’évènement. Permet de filtrer sur le champ EventTypeCode |
| dateOccurence |  |  |  |
| dateDeclaration | recorded | dateTime | Date à laquelle l’évènement a été enregistré |
| origine | Requestor | texte | Requestor identifie l’élément ActiveParticipant dont UserIsRequestor=true et userID correspond à la valeur du paramètre. |
| destinataire | Receiver | texte | Requestor identifie l’élément ActiveParticipant dont UserIsRequestor=false et userID correspond à la valeur du paramètre. |
| autreParametre | Chaque concrétisation de ses spécifications génériques peut ajouter des paramètres de recherche. | | |
## Flux 5 : ReponseRechercheTraces Ce flux véhicule le résultat de la recherche de traces. ### Construction du flux HL7 FHIR Dans le contexte d’un échange basé sur le standard HL7 FHIR, ce flux est basé sur les ressources FHIR Bundle, AuditEvent et OperationOutcome (en cas d’erreur) telles qu’utilisées dans la transaction IHE ITI-81 « Retrieve ATNA Audit Event ». Conformément au supplément RESTful ATNA du profil IHE ATNA, la réponse retournée par le Gestionnaire de trace au Consommateur de traces est composée d’un Bundle (profil TDE_BundleResultatReponseRechercheTraces) de type « searchset » encapsulant 0, 1 à plusieurs ressources AuditEvent (profil TDE_AuditEvent). La ressource Bundle constituera alors le corps de la réponse HTTP 200 ok. Un exemple de flux est joint (cf [_annexe 3_](#annexe-3-exemples-de-flux)). Pour des informations sur les autres codes HTTP (HTTP status code) retournés en cas d’échec, consultez la documentation relative à l’interaction « read » de l’API REST FHIR. ### Construction du flux HTTP Dans le contexte d’un échange basé sur la transaction IHE ITI-82, ce flux est composé d’un code HTTP 200 ok et le corps de la réponse HTTP est un tableau de messages Syslog au format demandé par le consommateur de traces (JSON ou XML). Pour des informations sur les autres codes HTTP (HTTP status code) retournés en cas d’échec, consulter le cadre technique IHE, section 3.82.4.2.2. # Disposition de sécurité Les données véhiculées à travers les flux de ce volet générique peuvent être des données à caractère personnel contenant notamment les noms des patients et des professionnels. Cette section présente les éventuelles recommandations de sécurité qui s’appliquent au volet générique « Traçabilité d’évènements ». Il s’agit d’un sous-ensemble lié à la dimension interopérabilité de dispositions de sécurité plus globales visant à couvrir les exigences de sécurité d’un système cible. Il est du ressort du responsable de traitement du système cible de mettre en œuvre des dispositions de sécurité adaptées à son analyse de risques pour le service. En fonction de sa politique de sécurité, il peut choisir ou pas de mettre en œuvre les dispositions spécifiques décrites dans cette section. Les référentiels de sécurité édités par l’ANS fournissent des recommandations sur ce sujet. ## Authentification et droit d’accès Pas de disposition spécifique à ce volet. ## Confidentialité Pas de disposition spécifique à ce volet. ## Intégrité Pas de disposition spécifique à ce volet. ## Traçabilité Pas de disposition spécifique à ce volet. ## Imputabilité Pas de disposition spécifique à ce volet. ## Disponibilité Pas de disposition spécifique à ce volet. # Annexe 1 : Bilan de profilage des ressources FHIR Cette section résume les modifications apportées aux spécifications de base des ressources FHIR. Le tableau ci-après liste l’ensemble des ressources FHIR utilisées dans ce document et indique les modifications qui y ont été apportées.
| | | |
| :--- | :--- | :--- |
| AuditEvent | * Modifications de certaines cardinalités
 |  |
**Tableau 4 : Bilan de profilage des ressources FHIR** # Annexe 2 : Ressource de conformité Les ressources de conformité suivantes ont été créées et sont à disposition des éditeurs sur l’espace de publication du CI-SIS sur esante.gouv.fr : - StructureDefinition pour le profil spécifique au volet « Traçabilité d’évènements »
| | | | |
| :--- | :--- | :--- | :--- |
| AuditEvent | TDE_AuditEvent | [http://esante.gouv.fr/ci-](http://esante.gouv.fr/ci-)sis/fhir/StructureDefinition/TDE_AuditEvent | 1.0 |
| Bundle | TDE_BundleResultatR eponseRechercheTrac es | [http://esante.gouv.fr/ci-](http://esante.gouv.fr/ci-)sis/fhir/StructureDefinition/TDE_BundleResultatRepon seRechercheTraces 1.0 | 1.0 |
##### Tableau 5 Profils FHIR créés dans le volet traçabilité d’évènements - SearchParameter pour identifier les paramètres de recherche.
| | | |
| :--- | :--- | :--- |
| TDE_AuditEvent_period-start | [http://esante.gouv.fr/ci-](http://esante.gouv.fr/ci-)sis/fhir/SearchParameter/TDE_AuditEvent_period-start | 1.0 |
##### Tableau 6 : SearchParameter pour les paramètres de recherche créés dans le cadre de ce volet - CapabilityStatement pour les acteurs identifiés dans l’étude métier du présent volet.
| | | |
| :--- | :--- | :--- |
| SourceDesTraces | [http://esante.gouv.fr/ci-](http://esante.gouv.fr/ci-)sis/fhir/CapabilityStatements/TDE.SourceDesTraces | 1.0 |
| ConsommateurDesTraces | [http://esante.gouv.fr/ci-](http://esante.gouv.fr/ci-)sis/fhir/CapabilityStatements/TDE.ConsommateurDesTraces | 1.0 |
| GestionnaireDeTrace | [http://esante.gouv.fr/ci-sis/fhir/CapabilityStatements/TDE.](http://esante.gouv.fr/ci-sis/fhir/CapabilityStatements/TDE)GestionnaireDeTrace | 1.0 |
##### Tableau 7 : CapabiltyStatements pour les acteurs définis dans ce volet - ImplementationGuide
|
|

|
|
***Tableau 8 : ImplementationGuide*** # Annexe 3 : Exemples de flux Les exemples HL7 FHIR sont donnés en utilisant la syntaxe JSON et ne présagent en rien de la syntaxe utilisée par les systèmes mettant en œuvre ce volet. > Ci-joint des fichiers d’exemple : > POST http://base_url_server_gestionnaire_trace/AuditEvent - **Flux 01 – Version Syslog** : TDE_Flux01-VersionSyslog.xml GET <http://hapi.fhir.org/baseR4/AuditEvent?type=rest&subtype=operation> - **Flux 05 – Version HTTP** : TDE_Flux05-VersionHTT # Annexe 4 : Glossaire
| | |
| :--- | :--- |
| API | Application Programming Interface |
| ANS | Agence du Numérique en Santé |
| CI-SIS | Cadre d’Interopérabilité des Systèmes d’Information de Santé |
| FHIR | Fast Healthcare Interoperability Resources |
| HL7 | Health Level 7 |
| HTTP | HyperText Transfer Protocol |
| JDV | Jeu De valeurs |
| MOS | Modèle des Objets de Santé |
| NOS | Nomenclatures des Objets de Santé |
| JSON | JavaScript Object Notation |
| REST | Representational State Transfer |
| TRE | Terminologie de Référence |
# Annexe 5 : Documents de référence 1. CI-SIS Etude Métier – Traçabilité d’évènements 2. CI-SIS Etude normes et standards – Traçabilité d’évènements # Annexe 6 : Historique du document
| | | | | | | |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| 1.0.C | ANS | 15/03/2021 |  |  |  |  |
| Motif et nature de la modification :**Première version pour concertation publique** | | | | | | |
| 1.0 | ANS | 14/06/2021 |  |  |  |  |
| Motif et nature de la modification :**Finalisation de la première version du document** | | | | | | |
| 1.1 |  |  |  |  | **ANS** | Le 01/04/2022 |
| Motif et nature de la modification :**Intégration CP CP-2022_01-MAJ_Volets_FHIR-V1.0*** Création du profil TDE_AuditEvent
* Création du paramètre de recherche TDE_AuditEvent_period-start
* Renommage du volet en « Traçabilité d’évènements »
 | | | | | | |
| 1.2 | ANS | 28/11/2022 | ANS | 28/11/2022 | ANS | 28/11/2022 |
| Motif et nature de la modification :* Changement du le profil « TDE_AuditEvent » : modification de la cardinalité de l’élément « subtype
» à [0..1].* Pour le critère de recherche « dateDeclaration », changement du nom du paramètre en « recorded
».* Changement du type de données en « dateTime » pour les critères de recherche sur les dates.
* Ajout à la liste des ressources profilée : TDE_BundleResultatReponseRechercheTraces
* Précision sur le type du bundle et la cardinalité des entrées dans le flux de réponse à la recherche de trace
* ObjectEvenement
 | | | | | | |
](https://www.hl7.org/fhir/valueset-audit-entity-type.html)](https://www.hl7.org/fhir/valueset-audit-source-type.html)](https://www.hl7.org/fhir/valueset-dicm-405-mediatype.html) |
](https://www.hl7.org/fhir/valueset-audit-event-sub-type.html)](https://www.hl7.org/fhir/valueset-audit-event-type.html) | |

