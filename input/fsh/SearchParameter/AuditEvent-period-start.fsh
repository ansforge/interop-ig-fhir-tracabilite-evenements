Instance: TDE-AuditEvent-period-start
InstanceOf: SearchParameter
Title: "TdE AuditEvent period.start"
Description: "Paramètre de recherche créé pour le volet TdE de manière à pouvoir utiliser comme critère de recherche l'élément AuditEvent.period.start correspondant à l'objet dateOccurence"
Usage: #definition
* status = #active
* name = "TDE_AuditEvent_period-start"
* code = #period-start
* base = #AuditEvent
* type = #date
* expression = "AuditEvent.period.start"
* multipleOr = true
* multipleAnd = true
* comparator[0] = #eq
* comparator[+] = #ne
* comparator[+] = #gt
* comparator[+] = #lt
* comparator[+] = #ge
* comparator[+] = #le
* comparator[+] = #sa
* comparator[+] = #eb
* comparator[+] = #ap
