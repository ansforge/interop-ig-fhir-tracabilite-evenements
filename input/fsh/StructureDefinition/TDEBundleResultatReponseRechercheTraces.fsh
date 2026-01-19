Profile: TDEBundleResultatReponseRechercheTraces
Parent: Bundle
Description: "Bundle de réponse à la recherche de traces"

* entry ^slicing.discriminator.type = #profile
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #open
* entry contains AuditEvent 0..*
* entry[AuditEvent].link ..1
* entry[AuditEvent].resource 1..
* entry[AuditEvent].resource only TDEAuditEvent