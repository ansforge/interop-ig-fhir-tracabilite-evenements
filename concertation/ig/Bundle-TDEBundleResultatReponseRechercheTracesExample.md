# TDEBundleResultatReponseRechercheTracesExample - ANS - Traçabilité des événements v2.0.0-ballot

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **TDEBundleResultatReponseRechercheTracesExample**

## Example Bundle: TDEBundleResultatReponseRechercheTracesExample



## Resource Content

```json
{
  "resourceType" : "Bundle",
  "id" : "TDEBundleResultatReponseRechercheTracesExample",
  "meta" : {
    "profile" : [
      "https://interop.esante.gouv.fr/ig/fhir/tde/StructureDefinition/TDEBundleResultatReponseRechercheTraces"
    ]
  },
  "type" : "searchset",
  "entry" : [
    {
      "fullUrl" : "http://example.org/fhir/AuditEvent/TDEAuditEventExample",
      "resource" : {
        "resourceType" : "AuditEvent",
        "id" : "TDEAuditEventExample",
        "meta" : {
          "profile" : [
            "https://interop.esante.gouv.fr/ig/fhir/tde/StructureDefinition/tde-auditevent"
          ]
        },
        "text" : {
          "status" : "generated",
          "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><a name=\"AuditEvent_TDEAuditEventExample\"> </a><p class=\"res-header-id\"><b>Narratif généré : ÉvènementSécurité TDEAuditEventExample</b></p><a name=\"TDEAuditEventExample\"> </a><a name=\"hcTDEAuditEventExample\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profil: <a href=\"StructureDefinition-tde-auditevent.html\">TdE AuditEvent</a></p></div><p><b>type</b>: <a href=\"http://terminology.hl7.org/7.0.1/CodeSystem-audit-event-type.html#audit-event-type-rest\">Audit Event ID: rest</a> (RESTful Operation)</p><p><b>subtype</b>: <a href=\"http://hl7.org/fhir/R4/codesystem-restful-interaction.html#restful-interaction-read\">FHIR Restful Interactions: read</a> (read)</p><p><b>period</b>: 2026-01-07 09:30:00+0000 --&gt; 2026-01-07 09:32:00+0000</p><p><b>recorded</b>: 2026-01-07 09:32:15+0000</p><h3>Agents</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Who</b></td><td><b>Requestor</b></td></tr><tr><td style=\"display: none\">*</td><td><a href=\"Practitioner-PractitionerExample.html\">Practitioner Jean DUPONT </a></td><td>true</td></tr></table><h3>Sources</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Observer</b></td></tr><tr><td style=\"display: none\">*</td><td><a href=\"Device-DeviceExample.html\">Device : manufacturer = Éditeur SI Santé</a></td></tr></table></div>"
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
        "period" : {
          "start" : "2026-01-07T09:30:00Z",
          "end" : "2026-01-07T09:32:00Z"
        },
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
    },
    {
      "fullUrl" : "http://example.org/fhir/AuditEvent/TDEAuditEventExample-2",
      "resource" : {
        "resourceType" : "AuditEvent",
        "id" : "TDEAuditEventExample-2",
        "meta" : {
          "profile" : [
            "https://interop.esante.gouv.fr/ig/fhir/tde/StructureDefinition/tde-auditevent"
          ]
        },
        "text" : {
          "status" : "generated",
          "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><a name=\"AuditEvent_TDEAuditEventExample-2\"> </a><p class=\"res-header-id\"><b>Narratif généré : ÉvènementSécurité TDEAuditEventExample-2</b></p><a name=\"TDEAuditEventExample-2\"> </a><a name=\"hcTDEAuditEventExample-2\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profil: <a href=\"StructureDefinition-tde-auditevent.html\">TdE AuditEvent</a></p></div><p><b>type</b>: <a href=\"http://hl7.org/fhir/R4/codesystem-dicom-dcim.html#dicom-dcim-110101\">DICOM: 110101</a> (Audit Log Used)</p><p><b>subtype</b>: <a href=\"http://hl7.org/fhir/R4/codesystem-restful-interaction.html#restful-interaction-read\">FHIR Restful Interactions: read</a> (read)</p><p><b>period</b>: 2025-01-07 09:30:00+0000 --&gt; 2025-01-07 09:32:00+0000</p><p><b>recorded</b>: 2025-01-07 09:32:15+0000</p><h3>Agents</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Who</b></td><td><b>Requestor</b></td></tr><tr><td style=\"display: none\">*</td><td><a href=\"Practitioner-PractitionerExample.html\">Practitioner Jean DUPONT </a></td><td>true</td></tr></table><h3>Sources</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Observer</b></td></tr><tr><td style=\"display: none\">*</td><td><a href=\"Device-DeviceExample.html\">Device : manufacturer = Éditeur SI Santé</a></td></tr></table></div>"
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
    }
  ]
}

```
