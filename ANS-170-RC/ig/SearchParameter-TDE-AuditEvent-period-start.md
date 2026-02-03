# TdE AuditEvent period.start - ANS - Traçabilité des événements v2.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **TdE AuditEvent period.start**

## SearchParameter: TdE AuditEvent period.start 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/tde/SearchParameter/TDE-AuditEvent-period-start | *Version*:2.0.0 |
| Active as of 2026-02-03 | *Computable Name*:TDE_AuditEvent_period-start |

 
Paramètre de recherche créé pour le volet TdE de manière à pouvoir utiliser comme critère de recherche l'élément AuditEvent.period.start correspondant à l'objet dateOccurence 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "TDE-AuditEvent-period-start",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/tde/SearchParameter/TDE-AuditEvent-period-start",
  "version" : "2.0.0",
  "name" : "TDE_AuditEvent_period-start",
  "status" : "active",
  "date" : "2026-02-03T13:33:49+00:00",
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
  "description" : "Paramètre de recherche créé pour le volet TdE de manière à pouvoir utiliser comme critère de recherche l'élément AuditEvent.period.start correspondant à l'objet dateOccurence",
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
  "code" : "period-start",
  "base" : ["AuditEvent"],
  "type" : "date",
  "expression" : "AuditEvent.period.start",
  "multipleOr" : true,
  "multipleAnd" : true,
  "comparator" : [
    "eq",
    "ne",
    "gt",
    "lt",
    "ge",
    "le",
    "sa",
    "eb",
    "ap"
  ]
}

```
