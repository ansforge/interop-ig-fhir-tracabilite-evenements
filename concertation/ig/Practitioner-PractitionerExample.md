# PractitionerExample - ANS - Traçabilité des événements v2.0.0-ballot

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **PractitionerExample**

## Example Practitioner: PractitionerExample

Profil: [FR Core Practitioner Profile](https://hl7.fr/ig/fhir/core/2.1.0/StructureDefinition-fr-core-practitioner.html)

**identifier**: `https://rpps.esante.gouv.fr`/10001234567

**name**: Jean DUPONT 



## Resource Content

```json
{
  "resourceType" : "Practitioner",
  "id" : "PractitionerExample",
  "meta" : {
    "profile" : [
      "https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-practitioner"
    ]
  },
  "identifier" : [
    {
      "system" : "https://rpps.esante.gouv.fr",
      "value" : "10001234567"
    }
  ],
  "name" : [
    {
      "family" : "DUPONT",
      "given" : ["Jean"]
    }
  ]
}

```
