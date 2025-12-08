Profile: TDE_AuditEvent
Parent: AuditEvent
Id: TDE_AuditEvent
Description: "Traçabilité des évènements d'objets métiers"
* ^url = "https://esante.gouv.fr/ci-sis/FHIR/StructureDefinition/TDE_AuditEvent"
* ^version = "1.0"
* ^status = #draft
* ^date = "2021-12-10"
* ^publisher = "ANS"
* subtype ..1
* period.start 1..
* agent ..2
* agent.who 1..