# Artifacts Summary - ANS IG Example v0.1.0

* [**Table of Contents**](toc.md)
* **Artifacts Summary**

## Artifacts Summary

This page provides a list of the FHIR artifacts defined as part of this implementation guide.

### Behavior: Search Parameters 

These define the properties by which a RESTful server can be searched. They can also be used for sorting and including related resources.

| | |
| :--- | :--- |
| [TDE-AuditEvent-period-start](SearchParameter-TDE-AuditEvent-period-start.md) | Paramètre de recherche créé pour le volet PDSm de manière à pouvoir utiliser comme critère de recherche l'élément context.period.start correspondant à lobjet dateDebutActe |

### Structures: Resource Profiles 

These define constraints on FHIR resources for systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [TDEAuditEvent](StructureDefinition-TDEAuditEvent.md) | Traçabilité des évènements d'objets métiers |
| [TDEBundleResultatReponseRechercheTraces](StructureDefinition-TDEBundleResultatReponseRechercheTraces.md) |  |

### Example: Example Instances 

These are example instances that show what data produced and consumed by systems conforming with this implementation guide might look like.

| |
| :--- |
| [DeviceExample](Device-DeviceExample.md) |
| [PractitionerExample](Practitioner-PractitionerExample.md) |
| [TDEAuditEventExample](AuditEvent-TDEAuditEventExample.md) |
| [TDEBundleResultatReponseRechercheTracesExample](Bundle-TDEBundleResultatReponseRechercheTracesExample.md) |

