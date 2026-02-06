# Mise en correspondance AuditEvent / DICOM - ANS - Traçabilité des événements v2.0.0-ballot

* [**Table of Contents**](toc.md)
* **Mise en correspondance AuditEvent / DICOM**

## Mise en correspondance AuditEvent / DICOM

Cette section reprend, la mise en correspondance des objets de la SFE avec la ressource FHIR « AuditEvent » et la structure AuditMessage de DICOM :

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| **Elément du schéma AuditMessage** | **Sous-Elément** | | | |
| Trace | identifiant | id |  |  |
| SourceTrace | identifiant | source | SourceAuditIdentification | AuditEnterpriseSiteId |
| Evénement | typeEvenement | type | EventIdentification | EventID |
| sousTypeEvement | Subtype | EventTypeCode | | |
| occurence | period.start | EventDateTime | | |
| declaration | recorded | Possibilité utiliser le champ « TIMESTAMP » du protocole syslog | | |
| description | outcomeDesc | EventOutcomeDescription | | |
| ActeurEvenement | identifiant | agent.who.identifier | ActiveParticipant |  |
| role | Agent.role | RoleIdCode | | |
| ObjectEvenement | identifiant | entity.what.identifier | ParticipantObjectIdentification |  |
| type | entity.type | ParticipantObjectTypeCode | | |
| contenu | entity.what ou entity.query ou entity.detail | ParticipantObjectDetail.valueou ParticipantObjectQueryou ParticipantObjectID | | |

