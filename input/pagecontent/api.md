### Solution 1 : Ressource AuditEvent et API FHIR REST

La construction des flux consiste en la construction des requêtes ou des
réponses HTTP de l’API REST pour FHIR. Cette section présente les flux
permettant d’échanger les informations identifiées dans les chapitres
précédents.

<div style="text-align: center; display: block; clear: both;">
  <img src="st_image5.png" alt="Gestion des traces" style="display:block; margin:auto;">
</div>

## Flux 1 : TransmissionTrace

Ce flux permet de transmettre une trace « générique » de la « source des
traces » vers le « gestionnaire des traces ».

### Construction du flux HL7 FHIR

Ce flux est construit selon les exigences de la transaction IHE
ITI-20[^5] « Record Audit Event » dans sa version HL7 FHIR où une seule
trace est transmise à la fois : « Send Audit Resource Request Message -
FHIR Feed Interaction » .

La première étape de construction de ce flux consiste à créer la
ressource AuditEvent conformément aux exigences du contexte métier.

La ressource AuditEvent ainsi constituée sera envoyée dans le corps de
la requête HTTP POST suivante :

POST \[base\]/AuditEvent

Où \[base\] est le point de contact FHIR défini par le Gestionnaire de
trace.

# Un exemple de flux est joint (cf [annexe 3 ](#annexe-3-exemples-de-flux): 

).
## Flux 2 : ConsultationTrace

Ce flux n’est pas défini dans le contexte du protocole Syslog.

Le Flux 2 « ConsultationTrace » permet au consommateur de traces de
demander la consultation d’une trace dont l’identifiant est connu au
gestionnaire de traces. Ce flux utilise l’interaction « read » de l’API
REST de HL7 FHIR.

La première étape de construction de ce flux consiste à récupérer
l’identifiant de la ressource AuditEvent représentant la trace à
consulter.

Cet identifiant est utilisé dans la requête GET suivante :

GET \[base\]/AuditEvent/\[id\]

Où \[base\] est le point de contact défini par le gestionnaire de
trace et \[id\] l’identifiant système de la ressource AuditEvent à
consulter.

## Flux 3 : ReponseConsultationTrace

Ce flux n’est pas défini dans le contexte du protocole Syslog.

Le Flux 3 « ReponseConsultationTrace  » correspond à la réponse du
Gestionnaire de trace à la demande du Consommateur de traces de
consulter une trace dont il connaît l’identifiant système (Flux 2).

Le flux 3 se compose d’un code HTTP 200 ok et d’un contenu. Le corps de
la réponse HTTP est consituée de la ressource AuditEvent identifiée dans
la demande.

Pour des informations sur les autres codes HTTP (HTTP status code)
retournés en cas d’échec, consultez la documentation relative à
l’interaction « read » de l’API REST FHIR.

## Flux 4 : RechercheTraces

Ce flux est utilisé par le consommateur de traces pour faire une
recherche de traces auprès du gestionnaire de traces.

### Construction du flux HL7 FHIR

Dans le contexte d’une implémentation en HL7 FHIR, le flux 4 est
construit selon les exigences de l’interaction « search » de l’API REST
de FHIR et, plus particulièrement, les exigences de la transaction IHE
ITI-81[^7] « Retrieve ATNA Audit Event ».

Les paramètres de recherche possibles sont ceux définis par HL7 FHIR
pour la ressource AuditEvent.

L’URL suivante est utilisée :

GET
\[base\]/AuditEvent?date=ge\[start-time\]&date=le\[stop-time\]&\<query\>

Où \[base\] est le point de contact FHIR du gestionnaire de traces,
\[start-time\] et \[stop-time\] indique l’intervalle de temps dans
lequel les traces sont recherchées (date se réfère à la date
d’enregistrement de l’évènement). \<query\> représente les autres
paramètres, sous la forme param=valeur, permettant d’affiner la
recherche.

#### Paramètres de recherche

La transaction \[ITI-81\] Retrieve ATNA Audit Event exige que la
recherche de traces soit bornée dans le temps. C’est-à-dire que le
paramètre de recherche « date » qui correspond à la date
d’enregistrement de l’évènement doit être présent pour préciser une
limite de temps (avant, après ou un intervalle). Le tableau ci-dessous
précise la mise en correspondance des paramètres de recherche identifiés
dans l’étude métier avec les paramètres de recherche HL7 FHIR de la
ressource AuditEvent.

L’élément apparaissant *en italique et en rouge* correspond à un critère
de recherche défini dans le cadre de cette spécification technique.

<table>
<colgroup>
<col style="width: 19%" />
<col style="width: 23%" />
<col style="width: 18%" />
<col style="width: 37%" />
</colgroup>
<thead>
<tr>
<th>Critère de recherche « métier »</th>
<th>Nom du paramètre</th>
<th>Type de donnée</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td>typeEvenement</td>
<td>type</td>
<td>token</td>
<td>Type de l’évènement qui a été tracé</td>
</tr>
<tr>
<td>sousTypeEvement</td>
<td>subtype</td>
<td>token</td>
<td>Sous-type de l’évènement qui a été tracé</td>
</tr>
<tr>
<td>dateOccurence</td>
<td><em>TDE_AuditEvent_period-start</em></td>
<td>dateTime</td>
<td>Date d’occurrence de l’évènement</td>
</tr>
<tr>
<td>dateDeclaration</td>
<td>recorded</td>
<td>dateTime</td>
<td>Date à laquelle l’évènement a été enregistré</td>
</tr>
<tr>
<td rowspan="2">origine</td>
<td><p>agent</p>
<p>agent-name</p>
<p>altId</p></td>
<td><p>reference</p>
<p>string</p>
<p>token</p></td>
<td>Les paramètres agent, agent-name et/ou altId peuvent être utilisés
pour identifier l’origine de la trace</td>
</tr>
<tr>
<td>agent-role</td>
<td>token</td>
<td>agent-role aura pour valeur le code utilisé pour indiquer que
l’agent est l’origine de la trace</td>
</tr>
<tr>
<td rowspan="2">destinataire</td>
<td><p>agent</p>
<p>agent-name</p>
<p>altId</p></td>
<td><p>reference</p>
<p>string</p>
<p>token</p></td>
<td>Les paramètres agent, agent-name et/ou altId peuvent être utilisés
pour identifier l’origine de la l’évènement</td>
</tr>
<tr>
<td>agent-role</td>
<td>token</td>
<td>agent-role aura pour valeur le code utilisé pour indiquer que
l’agent est le destinataire de l’évènement</td>
</tr>
<tr>
<td>autreParametre</td>
<td colspan="3">Chaque concrétisation de ses spécifications génériques
peut ajouter des paramètres de recherche. HL7 FHIR en définit<a
href="#fn1" class="footnote-ref" id="fnref1"
role="doc-noteref"><sup>1</sup></a>, d’autres paramètres peuvent être
définis par profilage.</td>
</tr>
</tbody>
</table>
<section id="footnotes" class="footnotes footnotes-end-of-document"
role="doc-endnotes">
<hr />
<ol>
<li id="fn1"><p><a
href="https://www.hl7.org/fhir/auditevent.html#search">https://www.hl7.org/fhir/auditevent.html#search</a><a
href="#fnref1" class="footnote-back" role="doc-backlink">↩︎</a></p></li>
</ol>
</section>

### Construction du flux HTTP

Dans le contexte d’une implémentation reposant sur le protocole Syslog
pour le flux de transmission des traces, le flux 4 « RechercheTraces »
est construit selon les exigences de la transaction IHE ITI-82
« Retrieve Syslog Event ». Cette transaction est une requête HTTP GET.

Les paramètres de recherche possibles sont ceux définis dans le cadre
technique IHE ; ils font référence aux champs de l’en-tête syslog.

L’URL suivante est utilisée :

GET
\[base\]/syslogsearch?date=le\[start-time\]&date=ge\[stoptime\]&\<query\>

Où \[base\] est le point de contact FHIR du gestionnaire de traces,
\[start-time\] et \[stop-time\] indique l’intervalle de temps dans
lequel les traces sont recherchées (date se réfère à la date
d’enregistrement de l’évènement). \<query\> représente les autres
paramètres, sous la forme param=valeur, permettant d’affiner la
recherche.

#### Paramètres de recherche

La transaction \[ITI-82\] Retrieve Syslog Event exige que la recherche
de traces soit bornée dans le temps. C’est-à-dire que le paramètre de
recherche « date » qui correspond à la date d’enregistrement de
l’évènement doit être présent pour préciser une limite de temps (avant,
après ou un intervalle). Le tableau ci-dessous précise la mise en
correspondance des paramètres de recherche identifiés dans l’étude
métier avec les paramètres de recherche défini par IHE.

Le tableau ci-dessous propose des critères de recherche supplémentaires
dans le cas où la trace est véhiculé au format DICOM AuditMessage. Dans
le cas où la concrétisation de ce volet utilise un autre format de
trace, ce tableau devra être revu.

<table>
<colgroup>
<col style="width: 19%" />
<col style="width: 19%" />
<col style="width: 19%" />
<col style="width: 40%" />
</colgroup>
<thead>
<tr>
<th>Critère de recherche « métier »</th>
<th>Nom du paramètre</th>
<th>Type de donnée</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td>typeEvenement</td>
<td>eventID</td>
<td>texte</td>
<td>Type de l’évènement. Permet de filtrer sur le champ EventID</td>
</tr>
<tr>
<td>sousTypeEvement</td>
<td>EventTypeCode</td>
<td>texte</td>
<td>Sous-type de l’évènement. Permet de filtrer sur le champ
EventTypeCode</td>
</tr>
<tr>
<td>dateOccurence</td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>dateDeclaration</td>
<td>recorded</td>
<td>dateTime</td>
<td>Date à laquelle l’évènement a été enregistré</td>
</tr>
<tr>
<td>origine</td>
<td>Requestor</td>
<td>texte</td>
<td>Requestor identifie l’élément ActiveParticipant dont
UserIsRequestor=true et userID correspond à la valeur du paramètre.</td>
</tr>
<tr>
<td>destinataire</td>
<td>Receiver</td>
<td>texte</td>
<td>Requestor identifie l’élément ActiveParticipant dont
UserIsRequestor=false et userID correspond à la valeur du
paramètre.</td>
</tr>
<tr>
<td>autreParametre</td>
<td colspan="3">Chaque concrétisation de ses spécifications génériques
peut ajouter des paramètres de recherche.</td>
</tr>
</tbody>
</table>

## Flux 5 : ReponseRechercheTraces

Ce flux véhicule le résultat de la recherche de traces.

### Construction du flux HL7 FHIR

Dans le contexte d’un échange basé sur le standard HL7 FHIR, ce flux est
basé sur les ressources FHIR Bundle, AuditEvent et OperationOutcome (en
cas d’erreur) telles qu’utilisées dans la transaction IHE ITI-81
« Retrieve ATNA Audit Event ».

Conformément au supplément RESTful ATNA du profil IHE ATNA, la réponse
retournée par le Gestionnaire de trace au Consommateur de traces est
composée d’un Bundle (profil TDE_BundleResultatReponseRechercheTraces)
de type « searchset » encapsulant 0, 1 à plusieurs ressources AuditEvent
(profil TDE_AuditEvent) .

La ressource Bundle constituera alors le corps de la réponse HTTP 200
ok.

Un exemple de flux est joint (cf [annexe
3 ](#annexe-3-exemples-de-flux): **Erreur ! Source du renvoi
introuvable.**).

Pour des informations sur les autres codes HTTP (HTTP status code)
retournés en cas d’échec, consultez la documentation relative à
l’interaction « read » de l’API REST FHIR.
