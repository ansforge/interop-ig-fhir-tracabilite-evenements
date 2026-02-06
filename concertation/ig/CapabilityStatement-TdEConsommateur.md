# TdE-Consommateur - ANS - Traçabilité des événements v2.0.0-ballot

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **TdE-Consommateur**

## CapabilityStatement: TdE-Consommateur 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/tde/CapabilityStatement/TdEConsommateur | *Version*:2.0.0-ballot |
| Active as of 2025-01-14 | *Computable Name*:TdEConsommateur |

 
Le rôle du Consommateur est d'accéder aux traces. Les personnes utilisant ce système peuvent être rattachées par exemple à la pharmacie hospitalière (traçabilité des médicaments), au bloc opératoire (traçabilité des actes chirurgicaux), à la sécurité (traçabilité de sécurité). 

 [Raw OpenAPI-Swagger Definition file](TdEConsommateur.openapi.json) | [Download](TdEConsommateur.openapi.json) 



## Resource Content

```json
{
  "resourceType" : "CapabilityStatement",
  "id" : "TdEConsommateur",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/tde/CapabilityStatement/TdEConsommateur",
  "version" : "2.0.0-ballot",
  "name" : "TdEConsommateur",
  "title" : "TdE-Consommateur",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-01-14T09:51:35+02:00",
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
  "description" : "Le rôle du Consommateur est d'accéder aux traces. Les personnes utilisant ce système peuvent être rattachées par exemple à la pharmacie hospitalière (traçabilité des médicaments), au bloc opératoire (traçabilité des actes chirurgicaux), à la sécurité (traçabilité de sécurité).",
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
  "kind" : "requirements",
  "fhirVersion" : "4.0.1",
  "format" : ["application/fhir+xml", "application/fhir+json"],
  "implementationGuide" : ["https://interop.esante.gouv.fr/ig/fhir/tde"],
  "rest" : [
    {
      "mode" : "client",
      "documentation" : "Accéder aux traces",
      "security" : {
        "cors" : false,
        "description" : "L’ANS propose des référentiels dédiés à la politique de sécurité (la PGSSI-S) et des mécanismes de sécurisation sont définis dans les volets de la couche Transport du Cadre d’Interopérabilité des systèmes d’information de santé (CI-SIS)"
      },
      "resource" : [
        {
          "type" : "AuditEvent",
          "supportedProfile" : [
            "https://interop.esante.gouv.fr/ig/fhir/tde/StructureDefinition/tde-auditevent"
          ],
          "interaction" : [
            {
              "code" : "read"
            }
          ],
          "searchParam" : [
            {
              "name" : "TDE_AuditEvent_period-start",
              "definition" : "https://interop.esante.gouv.fr/ig/fhir/tde/SearchParameter/TDE-AuditEvent-period-start",
              "type" : "date",
              "documentation" : "Paramètre de recherche pour la date d'occurence d'une trace"
            }
          ]
        }
      ]
    }
  ]
}

```
