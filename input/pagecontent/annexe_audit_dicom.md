Cette section reprend, la mise en correspondance des objets de la SFE
avec la ressource FHIR « AuditEvent » et la structure AuditMessage de
DICOM :

<table style="width:98%;">
<colgroup>
<col style="width: 17%" />
<col style="width: 19%" />
<col style="width: 21%" />
<col style="width: 21%" />
<col style="width: 19%" />
</colgroup>
<thead>
<tr>
<th rowspan="2" style="text-align: center;">Nom Classe</th>
<th rowspan="2" style="text-align: center;">Nom attribut</th>
<th rowspan="2" style="text-align: center;">AuditEvent</th>
<th colspan="2" style="text-align: center;">DICOM</th>
</tr>
<tr>
<th style="text-align: center;"><strong>Elément du schéma
AuditMessage</strong></th>
<th style="text-align: center;"><strong>Sous-Elément</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: center;">Trace</td>
<td style="text-align: center;">identifiant</td>
<td style="text-align: center;">id</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td style="text-align: center;">SourceTrace</td>
<td style="text-align: center;">identifiant</td>
<td style="text-align: center;">source</td>
<td style="text-align: center;">SourceAuditIdentification</td>
<td style="text-align: center;">AuditEnterpriseSiteId</td>
</tr>
<tr>
<td rowspan="5" style="text-align: center;">Evénement</td>
<td style="text-align: center;">typeEvenement</td>
<td style="text-align: center;">type</td>
<td rowspan="5" style="text-align: center;">EventIdentification</td>
<td style="text-align: center;">EventID</td>
</tr>
<tr>
<td style="text-align: center;">sousTypeEvement</td>
<td style="text-align: center;">Subtype</td>
<td style="text-align: center;">EventTypeCode</td>
</tr>
<tr>
<td style="text-align: center;">occurence</td>
<td style="text-align: center;">period.start</td>
<td style="text-align: center;">EventDateTime</td>
</tr>
<tr>
<td style="text-align: center;">declaration</td>
<td style="text-align: center;">recorded</td>
<td style="text-align: center;">Possibilité utiliser le champ
« TIMESTAMP » du protocole syslog</td>
</tr>
<tr>
<td style="text-align: center;">description</td>
<td style="text-align: center;">outcomeDesc</td>
<td style="text-align: center;">EventOutcomeDescription</td>
</tr>
<tr>
<td rowspan="2" style="text-align: center;">ActeurEvenement</td>
<td style="text-align: center;">identifiant</td>
<td style="text-align: center;">agent.who.identifier</td>
<td rowspan="2" style="text-align: center;">ActiveParticipant</td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td style="text-align: center;">role</td>
<td style="text-align: center;">Agent.role</td>
<td style="text-align: center;">RoleIdCode</td>
</tr>
<tr>
<td rowspan="3" style="text-align: center;">ObjectEvenement</td>
<td style="text-align: center;">identifiant</td>
<td style="text-align: center;">entity.what.identifier</td>
<td rowspan="3"
style="text-align: center;">ParticipantObjectIdentification</td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td style="text-align: center;">type</td>
<td style="text-align: center;">entity.type</td>
<td style="text-align: center;">ParticipantObjectTypeCode</td>
</tr>
<tr>
<td style="text-align: center;">contenu</td>
<td style="text-align: center;">entity.what ou entity.query ou
entity.detail</td>
<td style="text-align: center;"><p>ParticipantObjectDetail.value</p>
<p>ou ParticipantObjectQuery</p>
<p>ou ParticipantObjectID</p></td>
</tr>
</tbody>
</table>