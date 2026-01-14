# TDE-AuditEvent-period-start - ANS IG Example v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **TDE-AuditEvent-period-start**

## SearchParameter: TDE-AuditEvent-period-start 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/[code]/SearchParameter/TDE-AuditEvent-period-start | *Version*:0.1.0 |
| Active as of 2021-12-01 | *Computable Name*:TDE_AuditEvent_period-start |

 
Paramètre de recherche créé pour le volet TdE de manière à pouvoir utiliser comme critère de recherche l'élément AuditEvent.period.start correspondant à l'objet dateOccurence 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "TDE-AuditEvent-period-start",
  "meta" : {
    "lastUpdated" : "2021-10-21T14:10:19.925+00:00"
  },
  "url" : "https://interop.esante.gouv.fr/ig/fhir/[code]/SearchParameter/TDE-AuditEvent-period-start",
  "version" : "0.1.0",
  "name" : "TDE_AuditEvent_period-start",
  "status" : "active",
  "date" : "2021-12-01",
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
