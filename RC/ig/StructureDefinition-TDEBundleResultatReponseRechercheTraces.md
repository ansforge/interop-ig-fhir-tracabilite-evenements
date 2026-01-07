# TDEBundleResultatReponseRechercheTraces - ANS IG Example v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **TDEBundleResultatReponseRechercheTraces**

## Resource Profile: TDEBundleResultatReponseRechercheTraces 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/[code]/StructureDefinition/TDEBundleResultatReponseRechercheTraces | *Version*:0.1.0 |
| Draft as of 2026-01-07 | *Computable Name*:TDEBundleResultatReponseRechercheTraces |

**Utilisations:**

* Exemples pour ce Profil: [Bundle/TDEBundleResultatReponseRechercheTracesExample](Bundle-TDEBundleResultatReponseRechercheTracesExample.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ans.fhir.fr.[code]|current/StructureDefinition/TDEBundleResultatReponseRechercheTraces)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-TDEBundleResultatReponseRechercheTraces.csv), [Excel](StructureDefinition-TDEBundleResultatReponseRechercheTraces.xlsx), [Schematron](StructureDefinition-TDEBundleResultatReponseRechercheTraces.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "TDEBundleResultatReponseRechercheTraces",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/[code]/StructureDefinition/TDEBundleResultatReponseRechercheTraces",
  "version" : "0.1.0",
  "name" : "TDEBundleResultatReponseRechercheTraces",
  "status" : "draft",
  "date" : "2026-01-07T15:46:12+00:00",
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
      "identity" : "v2",
      "uri" : "http://hl7.org/v2",
      "name" : "HL7 v2 Mapping"
    },
    {
      "identity" : "rim",
      "uri" : "http://hl7.org/v3",
      "name" : "RIM Mapping"
    },
    {
      "identity" : "cda",
      "uri" : "http://hl7.org/v3/cda",
      "name" : "CDA (R2)"
    },
    {
      "identity" : "w5",
      "uri" : "http://hl7.org/fhir/fivews",
      "name" : "FiveWs Pattern Mapping"
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Bundle",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Bundle",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Bundle",
        "path" : "Bundle"
      },
      {
        "id" : "Bundle.entry",
        "path" : "Bundle.entry",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "profile",
              "path" : "resource"
            }
          ],
          "rules" : "open"
        }
      },
      {
        "id" : "Bundle.entry:AuditEvent",
        "path" : "Bundle.entry",
        "sliceName" : "AuditEvent",
        "min" : 0,
        "max" : "*"
      },
      {
        "id" : "Bundle.entry:AuditEvent.link",
        "path" : "Bundle.entry.link",
        "max" : "1"
      },
      {
        "id" : "Bundle.entry:AuditEvent.resource",
        "path" : "Bundle.entry.resource",
        "min" : 1,
        "type" : [
          {
            "code" : "AuditEvent",
            "profile" : [
              "https://interop.esante.gouv.fr/ig/fhir/[code]/StructureDefinition/TDEAuditEvent"
            ]
          }
        ]
      }
    ]
  }
}

```
