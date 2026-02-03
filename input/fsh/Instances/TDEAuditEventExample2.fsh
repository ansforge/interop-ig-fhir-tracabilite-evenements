Instance: TDEAuditEventExample-2
InstanceOf: TDEAuditEvent
Usage: #example

* type = http://dicom.nema.org/resources/ontology/DCM#110101 "Audit Log Used"
* subtype = http://hl7.org/fhir/restful-interaction#read "read"
* recorded = 2025-01-07T09:32:15Z

* agent[0].who = Reference(PractitionerExample)
* agent[0].requestor = true

* period.start = 2025-01-07T09:30:00Z
* period.end = 2025-01-07T09:32:00Z

* source.observer = Reference(DeviceExample)
