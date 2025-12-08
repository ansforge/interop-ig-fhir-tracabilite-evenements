# TDE_AuditEvent - ANS IG Example v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **TDE_AuditEvent**

## Resource Profile: TDE_AuditEvent 

| | |
| :--- | :--- |
| *Official URL*:https://esante.gouv.fr/ci-sis/FHIR/StructureDefinition/TDE_AuditEvent | *Version*:0.1.0 |
| Draft as of 2021-12-10 | *Computable Name*:TDE_AuditEvent |

 
Traçabilité des évènements d'objets métiers 

**Utilisations:**

* Utiliser ce Profil: [TDE_BundleResultatReponseRechercheTraces](StructureDefinition-TDE-BundleResultatReponseRechercheTraces.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ans.fhir.fr.[code]|current/StructureDefinition/TDE-AuditEvent)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-TDE-AuditEvent.csv), [Excel](StructureDefinition-TDE-AuditEvent.xlsx), [Schematron](StructureDefinition-TDE-AuditEvent.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "TDE-AuditEvent",
  "url" : "https://esante.gouv.fr/ci-sis/FHIR/StructureDefinition/TDE_AuditEvent",
  "version" : "0.1.0",
  "name" : "TDE_AuditEvent",
  "status" : "draft",
  "date" : "2021-12-10",
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
      }
    ]
  }
}

```
