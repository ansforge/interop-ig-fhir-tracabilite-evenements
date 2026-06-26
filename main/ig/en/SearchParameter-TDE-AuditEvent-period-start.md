# TdE AuditEvent period.start - ANS - Traçabilité des événements v2.0.0

## SearchParameter: TdE AuditEvent period.start 

 
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
  "date" : "2026-06-26T11:49:40+00:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [{
    "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "Paramètre de recherche créé pour le volet TdE de manière à pouvoir utiliser comme critère de recherche l'élément AuditEvent.period.start correspondant à l'objet dateOccurence",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "FR",
      "display" : "FRANCE"
    }]
  }],
  "code" : "period-start",
  "base" : ["AuditEvent"],
  "type" : "date",
  "expression" : "AuditEvent.period.start",
  "multipleOr" : true,
  "multipleAnd" : true,
  "comparator" : ["eq",
  "ne",
  "gt",
  "lt",
  "ge",
  "le",
  "sa",
  "eb",
  "ap"]
}

```
