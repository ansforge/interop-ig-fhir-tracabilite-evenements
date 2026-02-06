# TdE-Gestionnaire - ANS - Traçabilité des événements v2.0.0-ballot

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **TdE-Gestionnaire**

## CapabilityStatement: TdE-Gestionnaire 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/tde/CapabilityStatement/TdEGestionnaire | *Version*:2.0.0-ballot |
| Active as of 2025-01-14 | *Computable Name*:TdEGestionnaire |

 
Le rôle du Gestionnaire est d'enregistrer les informations de traçabilité et fournir les traces en cas de consultation ou de recherches. Le gestionnaire des traces peut être, par exemple, un logiciel de traçabilité ou le module de traçabilité d'un logiciel métier. 

 [Raw OpenAPI-Swagger Definition file](TdEGestionnaire.openapi.json) | [Download](TdEGestionnaire.openapi.json) 



## Resource Content

```json
{
  "resourceType" : "CapabilityStatement",
  "id" : "TdEGestionnaire",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/tde/CapabilityStatement/TdEGestionnaire",
  "version" : "2.0.0-ballot",
  "name" : "TdEGestionnaire",
  "title" : "TdE-Gestionnaire",
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
  "description" : "Le rôle du Gestionnaire est d'enregistrer les informations de traçabilité et fournir les traces en cas de consultation ou de recherches.\nLe gestionnaire des traces peut être, par exemple, un logiciel de traçabilité ou le module de traçabilité d'un logiciel métier.",
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
      "mode" : "server",
      "documentation" : "Enregistrer et fournir les traces",
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
            },
            {
              "code" : "create"
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
