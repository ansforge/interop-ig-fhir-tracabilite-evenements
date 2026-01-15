# TDEAuditEvent - ANS IG Example v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **TDEAuditEvent**

## Resource Profile: TDEAuditEvent 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/[code]/StructureDefinition/TDEAuditEvent | *Version*:0.1.0 |
| Draft as of 2026-01-15 | *Computable Name*:TDEAuditEvent |

 
Traçabilité des évènements d'objets métiers 

**Utilisations:**

* Utiliser ce Profil: [TDEBundleResultatReponseRechercheTraces](StructureDefinition-TDEBundleResultatReponseRechercheTraces.md)
* Exemples pour ce Profil: [AuditEvent/TDEAuditEventExample](AuditEvent-TDEAuditEventExample.md)
* CapabilityStatements utilisant ce Profil: [TdE-Consommateur](CapabilityStatement-TdEConsommateur.md), [TdE-Gestionnaire](CapabilityStatement-TdEGestionnaire.md) and [TdE-Source](CapabilityStatement-TdESource.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ans.fhir.fr.[code]|current/StructureDefinition/TDEAuditEvent)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-TDEAuditEvent.csv), [Excel](StructureDefinition-TDEAuditEvent.xlsx), [Schematron](StructureDefinition-TDEAuditEvent.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "TDEAuditEvent",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/[code]/StructureDefinition/TDEAuditEvent",
  "version" : "0.1.0",
  "name" : "TDEAuditEvent",
  "status" : "draft",
  "date" : "2026-01-15T13:02:31+00:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [
    {
      "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
      "telecom" : [
        {
          "system" : "url",
          "value" : "https://esante.gouv.fr"
        }
      ]
    }
  ],
  "description" : "Traçabilité des évènements d'objets métiers",
  "jurisdiction" : [
    {
      "coding" : [
        {
          "system" : "urn:iso:std:iso:3166",
          "code" : "FR",
          "display" : "FRANCE"
        }
      ]
    }
  ],
  "fhirVersion" : "4.0.1",
  "mapping" : [
    {
      "identity" : "workflow",
      "uri" : "http://hl7.org/fhir/workflow",
      "name" : "Workflow Pattern"
    },
    {
      "identity" : "rim",
      "uri" : "http://hl7.org/v3",
      "name" : "RIM Mapping"
    },
    {
      "identity" : "dicom",
      "uri" : "http://nema.org/dicom",
      "name" : "DICOM Tag Mapping"
    },
    {
      "identity" : "w5",
      "uri" : "http://hl7.org/fhir/fivews",
      "name" : "FiveWs Pattern Mapping"
    },
    {
      "identity" : "w3c.prov",
      "uri" : "http://www.w3.org/ns/prov",
      "name" : "W3C PROV"
    },
    {
      "identity" : "fhirprovenance",
      "uri" : "http://hl7.org/fhir/provenance",
      "name" : "FHIR Provenance Mapping"
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "AuditEvent",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/AuditEvent",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "AuditEvent",
        "path" : "AuditEvent"
      },
      {
        "id" : "AuditEvent.subtype",
        "path" : "AuditEvent.subtype",
        "max" : "1"
      },
      {
        "id" : "AuditEvent.period.start",
        "path" : "AuditEvent.period.start",
        "min" : 1
      },
      {
        "id" : "AuditEvent.agent",
        "path" : "AuditEvent.agent",
        "max" : "2"
      },
      {
        "id" : "AuditEvent.agent.who",
        "path" : "AuditEvent.agent.who",
        "min" : 1
      },
      {
        "id" : "AuditEvent.source.observer",
        "path" : "AuditEvent.source.observer",
        "type" : [
          {
            "code" : "Reference",
            "targetProfile" : [
              "http://hl7.org/fhir/StructureDefinition/Device",
              "http://hl7.org/fhir/StructureDefinition/PractitionerRole",
              "http://hl7.org/fhir/StructureDefinition/Practitioner",
              "https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-practitioner",
              "https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-practitioner-role",
              "http://hl7.org/fhir/StructureDefinition/RelatedPerson",
              "https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-related-person",
              "http://hl7.org/fhir/StructureDefinition/Organization",
              "https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-organization",
              "http://hl7.org/fhir/StructureDefinition/Patient",
              "https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-patient-ins",
              "https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-patient"
            ]
          }
        ]
      }
    ]
  }
}

```
