# Correspondances métier - ANS IG Example v0.1.0

* [**Table of Contents**](toc.md)
* **Correspondances métier**

## Correspondances métier

### Mise en correspondance avec le standard HL7 FHIR

Le tableau ci-dessous représente la mise en correspondance de l’objet « Trace » avec la ressource FHIR AuditEvent.

| | | | |
| :--- | :--- | :--- | :--- |
| **Nom classes** | **Nom attributs** | **Ressource** | **Elément** |
| Trace | identifiant [0..1] : Identifiant | AuditEvent | id [1..1] id |
| SourceTrace [0..1] | identifiant [0..1] : Identifiant | source [1..1].observer[1..1]. identifier [0..*] identifierReference (PractitionerRole|Practitioner| Organization|Device|Patient|RelatedPerson) | |
| Événement [1..1] | typeEvenement [0..1] Code | type [1..1] coding**Audit Event ID (extensible)1** | |
| sousTypeEvenement [0..1] Code | subtype [0..1] coding**Audit Event Sub-Type (extensible)1** | | |
| occurence [0..1] DateHeure | period[0..1].start[0..1] dateTime | | |
| declaration [0..1] DateHeure | recorded [1..1] instant | | |
| description [0..1] Texte | outcomeDesc [0..1] string | | |
| ActeurEvenement [0..2] | identifiant [1..1] Identifiant | agent[1..*].who[0..1].identifier [0..*] identifierReference (PractitionerRole|Practitioner|Organization| Device|Patient|RelatedPerson) | |
| role [1..1] Code | agent[0..1].role[0..*] CodeableConcept | | |
| ObjetEvenement [0..*] | type [0..1] Code | entity[0..*].type[0..1] Coding | |
| contenu [0..1] ObjetBinaire | entity[0..*].what Referenceou entity[0..*].query[0..1] base64Binaryou entity[0..*].detail[0..*] BackBoneElement | | |

Le contenu (ObjetEvenement.contenu) à véhiculer dans la trace sera défini par chaque instanciation de ce volet. Il peut s’agir d’une autre ressource FHIR auquel cas elle sera référencée par entity.what, des paramètres utilisés pour faire une recherche qui pourront être recopiés dans le champ entity.query ou de tout autre contenu qui pourra être véhiculé dans le champ entity.detail.value.

### Mise en correspondance avec le standard HL7 DICOM

Le tableau ci-dessous représente la mise en correspondance de l’objet « Trace » avec la structure AuditMessage définie par DICOM.

| | | | |
| :--- | :--- | :--- | :--- |
| **Nom classes** | **Nom attributs** | **Elément du schéma AuditMessage** | **Sous-Elément** |
| Trace | identifiant [0..1] : Identifiant |  |  |
| SourceTrace [0..1] | identifiant [0..1] : Identifiant | SourceAuditIdentification | AuditEnterpriseSiteId |
| Événement [1..1] | typeEvenement [0..1] Code | EventIdentification | EventID [1..1] |
| sousTypeEvenement [0..1] Code | EventTypeCode [1..1] | | |
| occurence [0..1] DateHeure | EventDateTime [1..1] | | |
| declaration [0..1] DateHeure | Possibilité utiliser le champ « TIMESTAMP » du protocole syslog | | |
| description [0..1] Texte | EventOutcomeDescription | | |
| ActeurEvenement [0..2] | identifiant [1..1] Identifiant | ActiveParticipant | ActiveParticipant userId [1..1] |
| role [1..1] Code | RoleIdCode | | |
| ObjetEvenement [0..*] | type [0..1] Code | ParticipantObjectIdentification | ParticipantObjectTypeCode |
| contenu [0..1] ObjetBinaire | ParticipantObjectDetail.valueou ParticipantObjectQueryou ParticipantObjectID | | |

Le contenu à véhiculer dans la trace sera défini par chaque instanciation de ce volet. Il peut s’agir des paramètres utilisés pour faire une recherche qui pourront être recopiés dans le champ ParticipantObjectQuery de l’élément ParticipantObjectIdentification ou de tout autre contenu qui pourra être véhiculé dans le champ ParticipantObjectDetail.value.

