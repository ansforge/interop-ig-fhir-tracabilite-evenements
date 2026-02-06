# TdE-Source - ANS - Traçabilité des événements v2.0.0-ballot

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **TdE-Source**

## CapabilityStatement: TdE-Source 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/tde/CapabilityStatement/TdESource | *Version*:2.0.0-ballot |
| Active as of 2025-01-14 | *Computable Name*:TdESource |

 
Le rôle de la Source est de transmettre les informations de traçabilité relatives à une étape significative d'un processus métier suite à un événement au gestionnaire. 

 [Raw OpenAPI-Swagger Definition file](TdESource.openapi.json) | [Download](TdESource.openapi.json) 



## Resource Content

```json
{
  "resourceType" : "CapabilityStatement",
  "id" : "TdESource",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/tde/CapabilityStatement/TdESource",
  "version" : "2.0.0-ballot",
  "name" : "TdESource",
  "title" : "TdE-Source",
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
  "description" : "Le rôle de la Source est de transmettre les informations de traçabilité relatives à une étape significative d'un processus métier suite à un événement au gestionnaire.",
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
      "documentation" : "Créer les traces",
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
              "code" : "create"
            }
          ]
        }
      ]
    }
  ]
}

```
