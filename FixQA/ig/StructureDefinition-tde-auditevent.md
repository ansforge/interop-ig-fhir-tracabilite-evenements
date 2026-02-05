# TdE AuditEvent - ANS - Traçabilité des événements v2.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **TdE AuditEvent**

## Resource Profile: TdE AuditEvent 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/tde/StructureDefinition/tde-auditevent | *Version*:2.0.0 |
| Draft as of 2026-02-05 | *Computable Name*:TDEAuditEvent |

 
Profil représentant la trace d'un évènement 

**Utilisations:**

* Utilise ce/t/te Profil: [TDEBundleResultatReponseRechercheTraces](StructureDefinition-TDEBundleResultatReponseRechercheTraces.md)
* Exemples pour ce/t/te Profil: [AuditEvent/TDEAuditEventExample-2](AuditEvent-TDEAuditEventExample-2.md) and [AuditEvent/TDEAuditEventExample](AuditEvent-TDEAuditEventExample.md)
* CapabilityStatements utilisant ce Profil: [TdE-Consommateur](CapabilityStatement-TdEConsommateur.md), [TdE-Gestionnaire](CapabilityStatement-TdEGestionnaire.md) and [TdE-Source](CapabilityStatement-TdESource.md)

Vous pouvez également vérifier [les usages dans le FHIR IG Statistics](https://packages2.fhir.org/xig/ans.fhir.fr.tde|current/StructureDefinition/tde-auditevent)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-tde-auditevent.csv), [Excel](StructureDefinition-tde-auditevent.xlsx), [Schematron](StructureDefinition-tde-auditevent.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "tde-auditevent",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/tde/StructureDefinition/tde-auditevent",
  "version" : "2.0.0",
  "name" : "TDEAuditEvent",
  "title" : "TdE AuditEvent",
  "status" : "draft",
  "date" : "2026-02-05T08:37:08+00:00",
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
  "description" : "Profil représentant la trace d'un évènement",
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
