# Correspondances métier - ANS - Traçabilité des événements v2.0.0-ballot

* [**Table of Contents**](toc.md)
* [**Volume 2 - Détail des transactions**](specifications_technique_intro.md)
* **Correspondances métier**

## Correspondances métier

### Mise en correspondance avec le standard HL7 DICOM

Le tableau ci-dessous représente la mise en correspondance de l'objet « Trace » avec la structure AuditMessage définie par DICOM.

| | | | |
| :--- | :--- | :--- | :--- |
| **Nom classes** | **Nom attributs** | **Elément du schéma AuditMessage** | **Sous-Elément** |
| Trace | identifiant [0..1] : Identifiant |  |  |
| SourceTrace [0..1] | identifiant [0..1] : Identifiant | SourceAuditIdentification | AuditEnterpriseSiteId |
| Événement [1..1] | typeEvenement [0..1] Code | EventIdentification | EventID [1..1] |
| sousTypeEvenement [0..1] Code | EventTypeCode [1..1] | | |
| occurence [0..1] DateHeure | EventDateTime [1..1] | | |
| declaration [0..1] DateHeure | Possibilité utiliser le champ « TIMESTAMP » du protocole syslog | | |
| description [0..1] Texte | EventOutcomeDescription | | |
| ActeurEvenement [0..2] | identifiant [1..1] Identifiant | ActiveParticipant | ActiveParticipant userId [1..1] |
| role [1..1] Code | RoleIdCode | | |
| ObjetEvenement [0..*] | type [0..1] Code | ParticipantObjectIdentification | ParticipantObjectTypeCode |
| contenu [0..1] ObjetBinaire | ParticipantObjectDetail.valueou ParticipantObjectQueryou ParticipantObjectID | | |

Le contenu à véhiculer dans la trace sera défini par chaque instanciation de ce volet. Il peut s'agir des paramètres utilisés pour faire une recherche qui pourront être recopiés dans le champ ParticipantObjectQuery de l'élément ParticipantObjectIdentification ou de tout autre contenu qui pourra être véhiculé dans le champ ParticipantObjectDetail.value.

