# TDEBundleResultatReponseRechercheTraces - ANS - Traçabilité des événements v2.0.0-ballot

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **TDEBundleResultatReponseRechercheTraces**

## Resource Profile: TDEBundleResultatReponseRechercheTraces 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/tde/StructureDefinition/TDEBundleResultatReponseRechercheTraces | *Version*:2.0.0-ballot |
| Draft as of 2026-02-09 | *Computable Name*:TDEBundleResultatReponseRechercheTraces |

 
Bundle de réponse à la recherche de traces 

**Utilisations:**

* Exemples pour ce/t/te Profil: [Bundle/TDEBundleResultatReponseRechercheTracesExample](Bundle-TDEBundleResultatReponseRechercheTracesExample.md)

Vous pouvez également vérifier [les usages dans le FHIR IG Statistics](https://packages2.fhir.org/xig/ans.fhir.fr.tde|current/StructureDefinition/TDEBundleResultatReponseRechercheTraces)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-TDEBundleResultatReponseRechercheTraces.csv), [Excel](StructureDefinition-TDEBundleResultatReponseRechercheTraces.xlsx), [Schematron](StructureDefinition-TDEBundleResultatReponseRechercheTraces.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "TDEBundleResultatReponseRechercheTraces",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/tde/StructureDefinition/TDEBundleResultatReponseRechercheTraces",
  "version" : "2.0.0-ballot",
  "name" : "TDEBundleResultatReponseRechercheTraces",
  "status" : "draft",
  "date" : "2026-02-09T08:40:43+00:00",
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
  "description" : "Bundle de réponse à la recherche de traces",
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
              "https://interop.esante.gouv.fr/ig/fhir/tde/StructureDefinition/tde-auditevent"
            ]
          }
        ]
      }
    ]
  }
}

```
