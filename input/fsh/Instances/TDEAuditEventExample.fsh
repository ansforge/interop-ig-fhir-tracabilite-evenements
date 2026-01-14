Instance: TDEAuditEventExample
InstanceOf: TDEAuditEvent
Usage: #example

* type = http://terminology.hl7.org/CodeSystem/audit-event-type#rest "RESTful Operation"
* subtype = http://hl7.org/fhir/restful-interaction#read "read"
* recorded = 2026-01-07T09:32:15Z

* agent[0].who = Reference(PractitionerExample)
* agent[0].requestor = true

* period.start = 2026-01-07T09:30:00Z
* period.end = 2026-01-07T09:32:00Z

* source.observer = Reference(DeviceExample)

Instance: PractitionerExample
InstanceOf: FRCorePractitionerProfile
Usage: #example

* identifier.system = "https://rpps.esante.gouv.fr"
* identifier.value = "10001234567"

* name.family = "DUPONT"
* name.given = "Jean"

Instance: DeviceExample
InstanceOf: Device
Usage: #example

* manufacturer = "Éditeur SI Santé"
* deviceName.name = "SIH"
* deviceName.type = #user-friendly-name
