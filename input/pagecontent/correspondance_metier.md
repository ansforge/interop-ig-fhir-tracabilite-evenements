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
