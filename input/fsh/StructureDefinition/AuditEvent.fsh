Profile: TDEAuditEvent
Parent: AuditEvent
Description: "Traçabilité des évènements d'objets métiers"
* subtype ..1
* period.start 1..
* agent ..2
* agent.who 1..

* source.observer only Reference(Device or PractitionerRole or Practitioner or FRCorePractitionerProfile or FRCorePractitionerRole or RelatedPerson or FRCoreRelatedPersonProfile or Organization or FRCoreOrganizationProfile or Patient or FRCorePatientINSProfile or FRCorePatientProfile)