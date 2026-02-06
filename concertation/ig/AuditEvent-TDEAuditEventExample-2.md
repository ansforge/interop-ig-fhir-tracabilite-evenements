# TDEAuditEventExample-2 - ANS - Traçabilité des événements v2.0.0-ballot

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **TDEAuditEventExample-2**

## Example AuditEvent: TDEAuditEventExample-2

Profil: [TdE AuditEvent](StructureDefinition-tde-auditevent.md)

**type**: [DICOM: 110101](http://hl7.org/fhir/R4/codesystem-dicom-dcim.html#dicom-dcim-110101) (Audit Log Used)

**subtype**: [FHIR Restful Interactions: read](http://hl7.org/fhir/R4/codesystem-restful-interaction.html#restful-interaction-read) (read)

**period**: 2025-01-07 09:30:00+0000 --> 2025-01-07 09:32:00+0000

**recorded**: 2025-01-07 09:32:15+0000

### Agents

| | | |
| :--- | :--- | :--- |
| - | **Who** | **Requestor** |
| * | [Practitioner Jean DUPONT ](Practitioner-PractitionerExample.md) | true |

### Sources

| | |
| :--- | :--- |
| - | **Observer** |
| * | [Device : manufacturer = Éditeur SI Santé](Device-DeviceExample.md) |



## Resource Content

```json
{
  "resourceType" : "AuditEvent",
  "id" : "TDEAuditEventExample-2",
  "meta" : {
    "profile" : [
      "https://interop.esante.gouv.fr/ig/fhir/tde/StructureDefinition/tde-auditevent"
    ]
  },
  "type" : {
    "system" : "http://dicom.nema.org/resources/ontology/DCM",
    "code" : "110101",
    "display" : "Audit Log Used"
  },
  "subtype" : [
    {
      "system" : "http://hl7.org/fhir/restful-interaction",
      "code" : "read",
      "display" : "read"
    }
  ],
  "period" : {
    "start" : "2025-01-07T09:30:00Z",
    "end" : "2025-01-07T09:32:00Z"
  },
  "recorded" : "2025-01-07T09:32:15Z",
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
