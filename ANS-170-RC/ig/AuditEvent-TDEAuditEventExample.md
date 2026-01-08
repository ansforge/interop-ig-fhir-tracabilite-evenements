# TDEAuditEventExample - ANS IG Example v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **TDEAuditEventExample**

## Example AuditEvent: TDEAuditEventExample

Profil: [TDEAuditEvent](StructureDefinition-TDEAuditEvent.md)

**type**: [Audit Event ID: rest](http://terminology.hl7.org/7.0.1/CodeSystem-audit-event-type.html#audit-event-type-rest) (RESTful Operation)

**subtype**: [FHIR Restful Interactions: read](http://hl7.org/fhir/R4/codesystem-restful-interaction.html#restful-interaction-read) (read)

**recorded**: 2026-01-07 09:32:15+0000

### Agents

| | | |
| :--- | :--- | :--- |
| - | **Who** | **Requestor** |
| * | [Practitioner Jean DUPONT](Practitioner-PractitionerExample.md) | true |

### Sources

| | |
| :--- | :--- |
| - | **Observer** |
| * | [Device : manufacturer = Éditeur SI Santé](Device-DeviceExample.md) |



## Resource Content

```json
{
  "resourceType" : "AuditEvent",
  "id" : "TDEAuditEventExample",
  "meta" : {
    "profile" : [
      "https://interop.esante.gouv.fr/ig/fhir/[code]/StructureDefinition/TDEAuditEvent"
    ]
  },
  "type" : {
    "system" : "http://terminology.hl7.org/CodeSystem/audit-event-type",
    "code" : "rest",
    "display" : "RESTful Operation"
  },
  "subtype" : [
    {
      "system" : "http://hl7.org/fhir/restful-interaction",
      "code" : "read",
      "display" : "read"
    }
  ],
  "recorded" : "2026-01-07T09:32:15Z",
  "agent" : [
    {
      "who" : {
        "reference" : "Practitioner/PractitionerExample"
      },
      "requestor" : true
    }
  ],
  "source" : {
    "observer" : {
      "reference" : "Device/DeviceExample"
    }
  }
}

```
