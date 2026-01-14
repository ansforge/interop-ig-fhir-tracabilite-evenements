Instance: TdESource
InstanceOf: CapabilityStatement
Usage: #definition
* name = "TdESource"
* title = "TdE-Source"
* status = #active
* experimental = false
* date = "2025-01-14T09:51:35+02:00"
* publisher = "ANS"
* description = "Le rôle de la Source est de transmettre les informations de traçabilité relatives à une étape significative d'un processus métier suite à un événement au gestionnaire."
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #application/fhir+xml
* format[+] = #application/fhir+json
* implementationGuide = "https://interop.esante.gouv.fr/ig/fhir/tde"
* rest.mode = #client
* rest.documentation = "Créer les traces"
* rest.security.cors = false
* rest.security.description = "L’ANS propose des référentiels dédiés à la politique de sécurité (la PGSSI-S) et des mécanismes de sécurisation sont définis dans les volets de la couche Transport du Cadre d’Interopérabilité des systèmes d’information de santé (CI-SIS)"


* rest.resource[+].type = #AuditEvent
* rest.resource[=].supportedProfile[0] = Canonical(TDEAuditEvent)
* rest.resource[=].interaction[0].code = #create


