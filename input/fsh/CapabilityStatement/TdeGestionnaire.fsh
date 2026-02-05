Instance: TdEGestionnaire
InstanceOf: CapabilityStatement
Usage: #definition
* name = "TdEGestionnaire"
* title = "TdE-Gestionnaire"
* status = #active
* experimental = false
* date = "2025-01-14T09:51:35+02:00"
* publisher = "ANS"
* description = "Le rôle du Gestionnaire est d'enregistrer les informations de traçabilité et fournir les traces en cas de consultation ou de recherches.
Le gestionnaire des traces peut être, par exemple, un logiciel de traçabilité ou le module de traçabilité d'un logiciel métier."
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #application/fhir+xml
* format[+] = #application/fhir+json
* implementationGuide = "https://interop.esante.gouv.fr/ig/fhir/tde"
* rest.mode = #server
* rest.documentation = "Enregistrer et fournir les traces"
* rest.security.cors = false
* rest.security.description = "L’ANS propose des référentiels dédiés à la politique de sécurité (la PGSSI-S) et des mécanismes de sécurisation sont définis dans les volets de la couche Transport du Cadre d’Interopérabilité des systèmes d’information de santé (CI-SIS)"


* rest.resource[+].type = #AuditEvent
* rest.resource[=].supportedProfile[0] = Canonical(TDEAuditEvent)
* rest.resource[=].interaction[0].code = #read
* rest.resource[=].interaction[+].code = #create
* rest.resource[=].searchParam[+].name = "TDE_AuditEvent_period-start"
* rest.resource[=].searchParam[=].definition = Canonical(TDE-AuditEvent-period-start)
* rest.resource[=].searchParam[=].type = #date
* rest.resource[=].searchParam[=].documentation = "Paramètre de recherche pour la date d'occurence d'une trace"


