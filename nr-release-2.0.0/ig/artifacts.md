# Artifacts Summary - ANS - Traçabilité des événements v2.0.0-ballot

* [**Table of Contents**](toc.md)
* **Artifacts Summary**

## Artifacts Summary

This page provides a list of the FHIR artifacts defined as part of this implementation guide.

### Behavior: Capability Statements 

The following artifacts define the specific capabilities that different types of systems are expected to have in order to comply with this implementation guide. Systems conforming to this implementation guide are expected to declare conformance to one or more of the following capability statements.

| | |
| :--- | :--- |
| [TdE-Consommateur](CapabilityStatement-TdEConsommateur.md) | Le rôle du Consommateur est d'accéder aux traces. Les personnes utilisant ce système peuvent être rattachées par exemple à la pharmacie hospitalière (traçabilité des médicaments), au bloc opératoire (traçabilité des actes chirurgicaux), à la sécurité (traçabilité de sécurité). |
| [TdE-Gestionnaire](CapabilityStatement-TdEGestionnaire.md) | Le rôle du Gestionnaire est d'enregistrer les informations de traçabilité et fournir les traces en cas de consultation ou de recherches. Le gestionnaire des traces peut être, par exemple, un logiciel de traçabilité ou le module de traçabilité d'un logiciel métier. |
| [TdE-Source](CapabilityStatement-TdESource.md) | Le rôle de la Source est de transmettre les informations de traçabilité relatives à une étape significative d'un processus métier suite à un événement au gestionnaire. |

### Behavior: Search Parameters 

These define the properties by which a RESTful server can be searched. They can also be used for sorting and including related resources.

| | |
| :--- | :--- |
| [TdE AuditEvent period.start](SearchParameter-TDE-AuditEvent-period-start.md) | Paramètre de recherche créé pour le volet TdE de manière à pouvoir utiliser comme critère de recherche l'élément AuditEvent.period.start correspondant à l'objet dateOccurence |

### Structures: Resource Profiles 

These define constraints on FHIR resources for systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [TDEBundleResultatReponseRechercheTraces](StructureDefinition-TDEBundleResultatReponseRechercheTraces.md) | Bundle de réponse à la recherche de traces |
| [TdE AuditEvent](StructureDefinition-tde-auditevent.md) | Profil représentant la trace d'un évènement |

### Example: Example Instances 

These are example instances that show what data produced and consumed by systems conforming with this implementation guide might look like.

| |
| :--- |
| [DeviceExample](Device-DeviceExample.md) |
| [PractitionerExample](Practitioner-PractitionerExample.md) |
| [TDEAuditEventExample](AuditEvent-TDEAuditEventExample.md) |
| [TDEAuditEventExample-2](AuditEvent-TDEAuditEventExample-2.md) |
| [TDEBundleResultatReponseRechercheTracesExample](Bundle-TDEBundleResultatReponseRechercheTracesExample.md) |

