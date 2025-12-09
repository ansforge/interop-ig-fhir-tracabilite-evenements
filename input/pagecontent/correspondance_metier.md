### Mise en correspondance avec le standard HL7 FHIR

Le tableau ci-dessous représente la mise en correspondance de l’objet
« Trace » avec la ressource FHIR AuditEvent.

<table style="width:100%;">
<caption><p>Tableau 2 Mise en correspondance entre l'objet Trace et la
ressource FHIR AuditEvent</p></caption>
<colgroup>
<col style="width: 21%" />
<col style="width: 29%" />
<col style="width: 20%" />
<col style="width: 27%" />
</colgroup>
<thead>
<tr>
<th colspan="2" style="text-align: left;">Éléments métier</th>
<th colspan="2" style="text-align: center;">Éléments FHIR</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><strong>Nom classes</strong></td>
<td style="text-align: left;"><strong>Nom attributs</strong></td>
<td style="text-align: center;"><strong>Ressource</strong></td>
<td style="text-align: center;"><strong>Elément</strong></td>
</tr>
<tr>
<td style="text-align: left;">Trace</td>
<td style="text-align: left;">identifiant [0..1] : Identifiant</td>
<td rowspan="11" style="text-align: center;">AuditEvent</td>
<td style="text-align: center;">id [1..1] id</td>
</tr>
<tr>
<td style="text-align: left;">SourceTrace [0..1]</td>
<td style="text-align: left;">identifiant [0..1] : Identifiant</td>
<td style="text-align: center;"><p>source [1..1].observer[1..1].
identifier [0..*] identifier</p>
<p>Reference (PractitionerRole|Practitioner|
Organization|Device|Patient|RelatedPerson)</p></td>
</tr>
<tr>
<td rowspan="5" style="text-align: left;">Événement [1..1]</td>
<td style="text-align: left;">typeEvenement [0..1] Code</td>
<td style="text-align: center;"><p>type [1..1] coding</p>
<p><em>Audit Event ID (extensible)<sup>1</sup></em></p></td>
</tr>
<tr>
<td style="text-align: left;">sousTypeEvenement [0..1] Code</td>
<td style="text-align: center;"><p>subtype [0..1] coding</p>
<p><em>Audit Event Sub-Type (extensible)<sup>1</sup></em></p></td>
</tr>
<tr>
<td style="text-align: left;">occurence [0..1] DateHeure</td>
<td style="text-align: center;">period[0..1].start[0..1] dateTime</td>
</tr>
<tr>
<td style="text-align: left;">declaration [0..1] DateHeure</td>
<td style="text-align: center;">recorded [1..1] instant</td>
</tr>
<tr>
<td style="text-align: left;">description [0..1] Texte</td>
<td style="text-align: center;">outcomeDesc [0..1] string</td>
</tr>
<tr>
<td rowspan="2" style="text-align: left;">ActeurEvenement [0..2]</td>
<td style="text-align: left;">identifiant [1..1] Identifiant</td>
<td style="text-align: center;"><p>agent[1..*].who[0..1].identifier
[0..*] identifier</p>
<p>Reference (PractitionerRole|Practitioner|Organization|
Device|Patient|RelatedPerson)</p></td>
</tr>
<tr>
<td style="text-align: left;">role [1..1] Code</td>
<td style="text-align: center;">agent[0..1].role[0..*]
CodeableConcept</td>
</tr>
<tr>
<td rowspan="2" style="text-align: left;">ObjetEvenement [0..*]</td>
<td style="text-align: left;">type [0..1] Code</td>
<td style="text-align: center;">entity[0..*].type[0..1] Coding</td>
</tr>
<tr>
<td style="text-align: left;">contenu [0..1] ObjetBinaire</td>
<td style="text-align: center;"><p>entity[0..*].what Reference</p>
<p>ou entity[0..*].query[0..1] base64Binary</p>
<p>ou entity[0..*].detail[0..*] BackBoneElement</p></td>
</tr>
</tbody>
</table>

Le contenu (ObjetEvenement.contenu) à véhiculer dans la trace sera
défini par chaque instanciation de ce volet. Il peut s’agir d’une autre
ressource FHIR auquel cas elle sera référencée par entity.what, des
paramètres utilisés pour faire une recherche qui pourront être recopiés
dans le champ entity.query ou de tout autre contenu qui pourra être
véhiculé dans le champ entity.detail.value.

### Mise en correspondance avec le standard HL7 DICOM

Le tableau ci-dessous représente la mise en correspondance de l’objet
« Trace » avec la structure AuditMessage définie par DICOM.

<table style="width:100%;">
<caption><p>Tableau 3 Mise en correspondance entre l'objet Trace et le
schema AuditMessage de DICOM</p></caption>
<colgroup>
<col style="width: 21%" />
<col style="width: 26%" />
<col style="width: 23%" />
<col style="width: 27%" />
</colgroup>
<thead>
<tr>
<th colspan="2" style="text-align: left;">Éléments métier</th>
<th colspan="2" style="text-align: center;">Éléments DICOM</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><strong>Nom classes</strong></td>
<td style="text-align: left;"><strong>Nom attributs</strong></td>
<td style="text-align: center;"><strong>Elément du schéma
AuditMessage</strong></td>
<td style="text-align: center;"><strong>Sous-Elément</strong></td>
</tr>
<tr>
<td style="text-align: left;">Trace</td>
<td style="text-align: left;">identifiant [0..1] : Identifiant</td>
<td style="text-align: left;"></td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td style="text-align: left;">SourceTrace [0..1]</td>
<td style="text-align: left;">identifiant [0..1] : Identifiant</td>
<td style="text-align: left;">SourceAuditIdentification</td>
<td style="text-align: center;">AuditEnterpriseSiteId</td>
</tr>
<tr>
<td rowspan="5" style="text-align: left;">Événement [1..1]</td>
<td style="text-align: left;">typeEvenement [0..1] Code</td>
<td rowspan="5" style="text-align: left;">EventIdentification</td>
<td style="text-align: center;">EventID [1..1]</td>
</tr>
<tr>
<td style="text-align: left;">sousTypeEvenement [0..1] Code</td>
<td style="text-align: center;">EventTypeCode [1..1]</td>
</tr>
<tr>
<td style="text-align: left;">occurence [0..1] DateHeure</td>
<td style="text-align: center;">EventDateTime [1..1]</td>
</tr>
<tr>
<td style="text-align: left;">declaration [0..1] DateHeure</td>
<td style="text-align: center;">Possibilité utiliser le champ
« TIMESTAMP » du protocole syslog</td>
</tr>
<tr>
<td style="text-align: left;">description [0..1] Texte</td>
<td style="text-align: center;">EventOutcomeDescription</td>
</tr>
<tr>
<td rowspan="2" style="text-align: left;">ActeurEvenement [0..2]</td>
<td style="text-align: left;">identifiant [1..1] Identifiant</td>
<td rowspan="2" style="text-align: left;">ActiveParticipant</td>
<td style="text-align: center;">ActiveParticipant userId [1..1]</td>
</tr>
<tr>
<td style="text-align: left;">role [1..1] Code</td>
<td style="text-align: center;">RoleIdCode</td>
</tr>
<tr>
<td rowspan="2" style="text-align: left;">ObjetEvenement [0..*]</td>
<td style="text-align: left;">type [0..1] Code</td>
<td rowspan="2"
style="text-align: left;">ParticipantObjectIdentification</td>
<td style="text-align: left;">ParticipantObjectTypeCode</td>
</tr>
<tr>
<td style="text-align: left;">contenu [0..1] ObjetBinaire</td>
<td style="text-align: center;"><p>ParticipantObjectDetail.value</p>
<p>ou ParticipantObjectQuery</p>
<p>ou ParticipantObjectID</p></td>
</tr>
</tbody>
</table>

Le contenu à véhiculer dans la trace sera défini par chaque
instanciation de ce volet. Il peut s’agir des paramètres utilisés pour
faire une recherche qui pourront être recopiés dans le champ
ParticipantObjectQuery de l’élément ParticipantObjectIdentification ou
de tout autre contenu qui pourra être véhiculé dans le champ
ParticipantObjectDetail.value.
