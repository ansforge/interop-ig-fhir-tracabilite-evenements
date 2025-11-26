# St - ANS IG Example v0.1.0

* [**Table of Contents**](toc.md)
* **St**

## St

Ce document s’adresse aux maîtrises d’œuvre des systèmes d’information qui implémentent des fonctionnalités de traçabilité d’évènements.

> Cette spécification technique s’appuie sur le standard HL7 FHIR R4 et sur le le supplément au profil ATNA (Audit Trail and Node Authentication) RESTful ATNA1 d’IHE. L’hypothèse est faite que le lecteur est familier de ces concepts.

## Standards utilisés

Ces spécifications techniques se basent sur le standard HL7 FHIR (R4) et sur le profil IHE ATNA et, plus particulièrement, le supplément RESTful ATNA. La version actuelle du profil ATNA se base sur les standards DICOM et syslog. Le supplément RESTful ATNA vise à ajouter des interfaces HL7 FHIR R4 aux acteurs impliqués dans ce profil.

> Ces spécifications font référence :

* D’une part, à la ressource AuditEvent ainsi qu’aux spécifications de l’API REST FHIR ;
* D’autre part, au protocole et à la structure de messages syslog, éventuellement couplée à la structure de message d’audit définie par DICOM2.

La syntaxe utilisée pour les exemples HL7 FHIR de ces spécifications est la syntaxe JSON.

### Profil IHE utilisé

Le profil utilisé est le profil IHE ATNA qui offre les fonctionnalités suivantes :

* Enregistrement de traces dans un dépôt via la transaction ITI-20
* Recherche de traces basée sur le contenu des traces via la transaction ITI-81 (opération

« Search » de l’API REST FHIR);

* Recherche de traces basées sur les métadonnées syslog via la transaction ITI-82 (Opération HTTP GET avec une URL paramétrique).

1 https[://www.ihe.net/uploadedFiles/Documents/ITI/IHE_ITI_Suppl_RESTful-ATNA.pdf](http://www.ihe.net/uploadedFiles/Documents/ITI/IHE_ITI_Suppl_RESTful-ATNA.pdf)

> 2[http://dicom.nema.org/dicom/2013/output/chtml/part15/sect_A.5.html](http://dicom.nema.org/dicom/2013/output/chtml/part15/sect_A.5.html)

### Ressources FHIR utilisées

La principale ressource HL7 FHIR utilisée est la suivante :

* AuditEvent

Les ressources Practionner et PrationnerRole peuvent aussi être utilisées, référencées par la ressource AuditEvent.

> Le tableau ci-après spécifie les profils utilisés pour les ressources et types de données mentionnés dans ce document. Les présentes spécifications définissent également un profil propre au présent volet (préfixe TDE). Pour les ressources et types de données non mentionnés dans ce tableau, le profil à utiliser est celui défini par HL7 FHIR.

| | | |
| :--- | :--- | :--- |
| > AuditEvent | > TDE_AuditEvent | > Profil défini dans ce volet |
| > Bundle | > TDE_BundleResultatReponseRechercheTraces | > Profil défini dans ce volet |

****Tableau 1 : Profils des ressources FHIR utilisés dans le volet TDE****

> **_Note éditoriale :_**Dans l’ensemble de ce document, lorsqu’il est fait référence à la ressource AuditEvent, il est entendu que le profil TDE_AuditEvent doit être utilisé.

## Utilisation

Les spécifications d'interopérabilité présentées dans ce volet ne présagent pas des conditions de leur mise en œuvre dans le cadre d'un système d'information partagé. Il appartient à tout responsable de traitement de s'assurer que les services utilisant ces spécifications respectent les cadres et bonnes pratiques applicables à ce genre de service (ex : cadre juridique, bonnes pratiques de sécurité, ergonomie, accessibilité …). Il est à noter que les contraintes de sécurité concernant les flux échangés ne sont pas traitées dans ce document. Celles-ci sont du ressort de chaque responsable de l’implémentation du mécanisme qui est dans l’obligation de se conformer au cadre juridique en la matière. L’ANS propose des référentiels dédiés à la politique de sécurité (la PGSSI-S3) et des mécanismes de sécurisation sont définis dans les volets de la couche Transport4 du Cadre d’Interopérabilité des systèmes d’information de santé (CI-SIS).

> 3[_https://esante.gouv.fr/securite/politique-generale-de-securite-des-systemes-d-information-de-sante_](https://esante.gouv.fr/securite/politique-generale-de-securite-des-systemes-d-information-de-sante)4[_http://esante.gouv.fr/services/referentiels/ci-sis/espace-publication/couche-transport_](http://esante.gouv.fr/services/referentiels/ci-sis/espace-publication/couche-transport)

# Contenu structuré des flux

## Correspondance entre objets métier et objets des standards HL7 FHIR, DICOM et syslog

Dans cette section, une mise en correspondance est faite entre :

> ▶ Les objets métier identifiés à l’issue de l’étude métier,▶ Les ressources et éléments, du standard HL7 FHIR,▶ Les éléments du standard syslog,▶ Les éléments du standard DICOM.Pour chaque objet métier, les tableaux ci-après reprennent l’ensemble des éléments métier identifiés dans l’étude métier du cas d’usage. Pour chaque attribut de chaque classe métier, la ressource FHIR et plus particulièrement l’élément de cette ressource qui sera utilisé pour véhiculer l’information est identifié. Il en est de même pour les éléments des standards DICOM et syslog.Ce travail concerne les flux structurés énumérés ci-dessous :▶ Flux 1 - TransmissionTrace : demande d’enregistrement d’une trace dans un gestionnaire de trace ;▶ Flux 2 - ConsultationTrace : demande de consultation d’une trace en particulier ;▶ Flux 3 - ReponseConsultationTrace : retourne la trace demandée par le flux 2 ;▶ Flux 4 - RechercheTraces : recherche de traces avec une liste de critères de recherche ;▶ Flux 5 - ReponseRechercheTraces : retourne la liste des traces répondant aux critères derecherche.Le flux 1bis « RetourTransmissionTrace » a été identifié mais n’est pas inclus dans le périmètre de cette spécification technique.Pour rappel :▶ L’objet « Trace » contient les éléments relatifs à la source de la trace et à l’évènement qui est tracé dans le système d’information.▶ L’objet « Evenement » comprend les différents attributs d’un événement : l’identifiant de l’évènement, son type, la date à laquelle il a eu lieu (occurrence) et la date à laquelle il a été déclaré (déclaration). D’autre part, il permet d’identifier les acteurs à l’origine et à destination de l’évènement ainsi que l’objet de cet évènement. Le terme « objet de l’évènement » se réfère à l’objet des données qui ont été échangées comme par exemple le patient ou un dispositif médical.

### Mise en correspondance avec le standard HL7 FHIR

Le tableau ci-dessous représente la mise en correspondance de l’objet « Trace » avec la ressource FHIR AuditEvent.

| | | | |
| :--- | :--- | :--- | :--- |
| > **Nom classes** | > **Nom attributs** | > **Ressource** | > **Elément** |
| > Trace | > identifiant [0..1] : Identifiant | > AuditEvent | > id [1..1] id |
| > SourceTrace [0..1] | > identifiant [0..1] : Identifiant | > source [1..1].observer[1..1]. identifier [0..*] identifierReference (PractitionerRole|Practitioner| Organization|Device|Patient|R elatedPerson) | |
| > Événement [1..1] | > typeEvenement [0..1] Code | > type [1..1] coding**Audit Event ID (extensible)1** | |
| > sousTypeEvenement [0..1] Code | > subtype [0..1] coding**Audit Event Sub-Type (extensible)1** | | |
| > occurence [0..1] DateHeure | > period[0..1].start[0..1] dateTime | | |
| > declaration [0..1] DateHeure | > recorded [1..1] instant | | |
| > description [0..1] Texte | > outcomeDesc [0..1] string | | |
| > ActeurEvenement [0..2] | > identifiant [1..1] Identifiant | > agent[1..*].who[0..1].identifier [0..*] identifierReference (PractitionerRole|Practitioner| Organization| Device|Patient|RelatedPerson) | |
| > role [1..1] Code | > agent[0..1].role[0..*] CodeableConcept | | |
| > ObjetEvenement [0..*] | > type [0..1] Code | > entity[0..*].type[0..1] Coding | |
| > contenu [0..1] ObjetBinaire | > entity[0..*].what Referenceou entity[0..*].query[0..1] base64Binaryou entity[0..*].detail[0..*] BackBoneElement | | |

##### Tableau 2 Mise en correspondance entre l'objet Trace et la ressource FHIR AuditEvent

Le contenu (ObjetEvenement.contenu) à véhiculer dans la trace sera défini par chaque instanciation de ce volet. Il peut s’agir d’une autre ressource FHIR auquel cas elle sera référencée par entity.what, des paramètres utilisés pour faire une recherche qui pourront être recopiés dans le champ entity.query ou de tout autre contenu qui pourra être véhiculé dans le champ entity.detail.value.

### Mise en correspondance avec le standard HL7 DICOM

###

Le tableau ci-dessous représente la mise en correspondance de l’objet « Trace » avec la structure AuditMessage définie par DICOM.

| | | | |
| :--- | :--- | :--- | :--- |
| > **Nom classes** | > **Nom attributs** | > **Elément du schéma AuditMessage** | > **Sous-Elément** |
| > Trace | > identifiant [0..1] : Identifiant |  |  |
| > SourceTrace [0..1] | > identifiant [0..1] : Identifiant | > SourceAuditIdentification | > AuditEnterpriseSiteId |
| > Événement [1..1] | > typeEvenement [0..1] Code | > EventIdentification | > EventID [1..1] |
| > sousTypeEvenement [0..1] Code | > EventTypeCode [1..1] | | |
| > occurence [0..1] DateHeure | > EventDateTime [1..1] | | |
| > declaration [0..1] DateHeure | > Possibilité utiliser le champ« TIMESTAMP » du protocole syslog | | |
| > description [0..1] Texte | > EventOutcomeDescription | | |
| > ActeurEvenement [0..2] | > identifiant [1..1] Identifiant | > ActiveParticipant | > ActiveParticipant userId [1..1] |
| > role [1..1] Code | > RoleIdCode | | |
| > ObjetEvenement [0..*] | > type [0..1] Code | > ParticipantObjectIdentific ation | > ParticipantObjectTypeCode |
| > contenu [0..1] ObjetBinaire | > ParticipantObjectDetail.valueou ParticipantObjectQuery ou ParticipantObjectID | | |

##### Tableau 3 Mise en correspondance entre l'objet Trace et le schema AuditMessage de DICOM

Le contenu à véhiculer dans la trace sera défini par chaque instanciation de ce volet. Il peut s’agir des paramètres utilisés pour faire une recherche qui pourront être recopiés dans le champ ParticipantObjectQuery de l’élément ParticipantObjectIdentification ou de tout autre contenu qui pourra être véhiculé dans le champ ParticipantObjectDetail.value.

## Contenu des flux structurés

Ces spécifications techniques présentent deux manières de représenter et d’échanger l’information dans le contexte du volet générique « Traçabilité d’évènements ». Cette section définies le contenu structuré des flux dans chacun des deux cas suivants :

* La trace est représentée par la ressource HL7 FHIR R4 AuditEvent
* La trace est représentée par le message DICOM AuditMessage (XML)

Le contenu structuré devra être revu et potentiellement amendé pour chaque concrétisation spécifique à un cas d’usage défini. Cependant, les règles suivantes s’appliquent :

> ▶ Les éléments définis comme obligatoires (cardinalité 1..1 ou 1..*) par le standard (HL7 FHIR ou DICOM) ou par cette spécification technique ne peuvent être rendus optionnels ;▶ Les éléments qui ne sont pas répétables dans cette spécification (cardinalité maximum finie) ne peuvent pas être définis répétables ;▶ Les jeux de valeur dont le contenu est une liste stricte de valeurs codées (required indiqué entre parenthèses dans les tableaux suivants) ne peuvent pas être modifiés.En revanche, en fonction des besoins du cas d’usage, il est possible de :▶ Rendre obligatoire certains éléments actuellement optionnel dans ces spécifications techniques ;▶ Définir des jeux de valeur pour les champs codés du moment que le jeu de valeur n’est pas défini(binding = example) ni limité à un ensemble fini de valeurs (binding = extensible);▶ Limiter le nombre de répétitions des champs dont la cardinalité maximum est infinie (*).Lors de la concrétisation de cette spécification, il est conseillé de recopier les tableaux des sections suivantes et de compléter la colonne « contrainte » pour indiquer quelles sont les contraintes spécifiques au cas d’usage.

### Ressource HL7 FHIR « AuditEvent »

Le tableau ci-dessous reprend la ressource FHIR AuditEvent, identifiée pour représenter le concept métier « Trace ». Les éléments retenus lors de la mise en correspondance sont repris et complétés par d’autres éléments qui sont obligatoires selon les spécifications FHIR et sont listés dans l’ordre requis par ces dernières. Les cardinalités retenues sont les cardinalités métier lorsque celle-ci sont plus strictes que les cardinalités du standard.

> Les éléments qui constituent des extensions ou des éléments de ressources contenues seront précisés dans la colonne « Contraintes » des tableaux concernés.En annexe, des exemples permettent de mieux comprendre la composition des ressources. Le concept métier « Trace » correspond à la ressource HL7 FHIR « AuditEvent ».

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| > AuditEvent | > id | > id [0..1] |  | > Identifiant unique de la trance |
| > type | > Coding [1..1] |  | > Identifiant de l’événementJeu de valeurs :[_Audit Event ID_</a(extensible)</p> </blockquote></td> </tr> </tbody> </table>
|
|
](https://www.hl7.org/fhir/valueset-audit-event-type.html) | |

