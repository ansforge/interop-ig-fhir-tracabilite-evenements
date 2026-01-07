Profile: TDEAuditEvent
Parent: AuditEvent
Description: "Traçabilité des évènements d'objets métiers"
* subtype ..1
* period.start 1..
* agent ..2
* agent.who 1..

* source.observer only Reference(Device or FRCorePractitionerProfile or FRCorePractitionerRole or FRCoreRelatedPersonProfile or FRCoreOrganizationProfile or FRCorePatientINSProfile or FRCorePatientProfile)