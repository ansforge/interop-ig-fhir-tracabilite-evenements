Instance: TdEConsommateur
InstanceOf: CapabilityStatement
Usage: #definition
* name = "TdEConsommateur"
* title = "TdE-Consommateur"
* status = #active
* experimental = false
* date = "2025-01-14T09:51:35+02:00"
* publisher = "ANS"
* description = "Le rôle du Consommateur est d'accéder aux traces. Les personnes utilisant ce système peuvent être rattachées par exemple à la pharmacie hospitalière (traçabilité des médicaments), au bloc opératoire (traçabilité des actes chirurgicaux), à la sécurité (traçabilité de sécurité)."
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #application/fhir+xml
* format[+] = #application/fhir+json
* implementationGuide = "https://interop.esante.gouv.fr/ig/fhir/tde"
* rest.mode = #client
* rest.documentation = "Accéder aux traces"
* rest.security.cors = false
* rest.security.description = "L’ANS propose des référentiels dédiés à la politique de sécurité (la PGSSI-S) et des mécanismes de sécurisation sont définis dans les volets de la couche Transport du Cadre d’Interopérabilité des systèmes d’information de santé (CI-SIS)"


* rest.resource[+].type = #AuditEvent
* rest.resource[=].supportedProfile[0] = Canonical(TDEAuditEvent)
* rest.resource[=].interaction[0].code = #read
* rest.resource[=].searchParam[+].name = "TDE_AuditEvent_period-start"
* rest.resource[=].searchParam[=].definition = Canonical(TDE-AuditEvent-period-start)
* rest.resource[=].searchParam[=].type = #date
* rest.resource[=].searchParam[=].documentation = "Paramètre de recherche pour la date d'occurence d'une trace"


