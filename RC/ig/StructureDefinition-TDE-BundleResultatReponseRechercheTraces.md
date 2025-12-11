# TDE_BundleResultatReponseRechercheTraces - ANS IG Example v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **TDE_BundleResultatReponseRechercheTraces**

## Resource Profile: TDE_BundleResultatReponseRechercheTraces 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/[code]/StructureDefinition/TDE_BundleResultatReponseRechercheTraces | *Version*:0.1.0 |
| Draft as of 2025-12-11 | *Computable Name*:TDE_BundleResultatReponseRechercheTraces |

**Utilisations:**

* Ce Profil nest utilisé par aucun profil dans ce guide dimplémentation

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ans.fhir.fr.[code]|current/StructureDefinition/TDE-BundleResultatReponseRechercheTraces)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-TDE-BundleResultatReponseRechercheTraces.csv), [Excel](StructureDefinition-TDE-BundleResultatReponseRechercheTraces.xlsx), [Schematron](StructureDefinition-TDE-BundleResultatReponseRechercheTraces.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "TDE-BundleResultatReponseRechercheTraces",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/[code]/StructureDefinition/TDE_BundleResultatReponseRechercheTraces",
  "version" : "0.1.0",
  "name" : "TDE_BundleResultatReponseRechercheTraces",
  "status" : "draft",
  "date" : "2025-12-11T14:42:43+00:00",
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
              "https://interop.esante.gouv.fr/ig/fhir/[code]/StructureDefinition/TDE_AuditEvent"
            ]
          }
        ]
      }
    ]
  }
}

```
