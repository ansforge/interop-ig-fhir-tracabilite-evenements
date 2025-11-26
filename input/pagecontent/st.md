Ce document s’adresse aux maîtrises d’œuvre des systèmes d’information
qui implémentent des fonctionnalités de traçabilité d’évènements.
>
Cette spécification technique s’appuie sur le standard HL7 FHIR R4 et
sur le le supplément au profil ATNA (Audit Trail and Node
Authentication) RESTful ATNA1 d’IHE. L’hypothèse est faite que le
lecteur est familier de ces concepts.

## Standards utilisés

Ces spécifications techniques se basent sur le standard HL7 FHIR (R4)
et sur le profil IHE ATNA et, plus particulièrement, le supplément
RESTful ATNA. La version actuelle du profil ATNA se base sur les
standards DICOM et syslog. Le supplément RESTful ATNA vise à ajouter
des interfaces HL7 FHIR R4 aux acteurs impliqués dans ce profil.
>
Ces spécifications font référence :

- D’une part, à la ressource AuditEvent ainsi qu’aux spécifications de
  l’API REST FHIR ;

- D’autre part, au protocole et à la structure de messages syslog,
  éventuellement couplée à la structure de message d’audit définie par
  DICOM2.

La syntaxe utilisée pour les exemples HL7 FHIR de ces spécifications
est la syntaxe JSON.

### Profil IHE utilisé

Le profil utilisé est le profil IHE ATNA qui offre les fonctionnalités
suivantes :

- Enregistrement de traces dans un dépôt via la transaction ITI-20

  - Soit à l’aide du protocole Syslog (c’est-à-dire conforme à la
    RFC5424)

  - Soit à l’aide de l’opération « Create » de l’API REST de FHIR.ou au
    format HL7 FHIR (ressource FHIR AuditEvent) ;

- Recherche de traces basée sur le contenu des traces via la transaction
  ITI-81 (opération

« Search » de l’API REST FHIR);

- Recherche de traces basées sur les métadonnées syslog via la
  transaction ITI-82 (Opération HTTP GET avec une URL paramétrique).

1
https[://www.ihe.net/uploadedFiles/Documents/ITI/IHE_ITI_Suppl_RESTful-ATNA.pdf](http://www.ihe.net/uploadedFiles/Documents/ITI/IHE_ITI_Suppl_RESTful-ATNA.pdf)
>
2 <http://dicom.nema.org/dicom/2013/output/chtml/part15/sect_A.5.html>

### Ressources FHIR utilisées

La principale ressource HL7 FHIR utilisée est la suivante :

- AuditEvent

Les ressources Practionner et PrationnerRole peuvent aussi être
utilisées, référencées par la ressource AuditEvent.
>
Le tableau ci-après spécifie les profils utilisés pour les ressources
et types de données mentionnés dans ce document. Les présentes
spécifications définissent également un profil propre au présent volet
(préfixe TDE). Pour les ressources et types de données non mentionnés
dans ce tableau, le profil à utiliser est celui défini par HL7 FHIR.

<table style="width:99%;">
<colgroup>
<col style="width: 21%" />
<col style="width: 45%" />
<col style="width: 31%" />
</colgroup>
<thead>
<tr>
<th><blockquote>
<p><strong>Ressource</strong></p>
</blockquote></th>
<th><blockquote>
<p><strong>Profil</strong></p>
</blockquote></th>
<th><blockquote>
<p><strong>Description</strong></p>
</blockquote></th>
</tr>
</thead>
<tbody>
<tr>
<td><blockquote>
<p>AuditEvent</p>
</blockquote></td>
<td><blockquote>
<p>TDE_AuditEvent</p>
</blockquote></td>
<td><blockquote>
<p>Profil défini dans ce volet</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>Bundle</p>
</blockquote></td>
<td><blockquote>
<p>TDE_BundleResultatReponseRechercheTraces</p>
</blockquote></td>
<td><blockquote>
<p>Profil défini dans ce volet</p>
</blockquote></td>
</tr>
</tbody>
</table>

***Tableau 1 : Profils des ressources FHIR utilisés dans le volet
TDE***
>
**<u>Note éditoriale :</u>**
>
Dans l’ensemble de ce document, lorsqu’il est fait référence à la
ressource AuditEvent, il est entendu que le profil TDE_AuditEvent doit
être utilisé.

## Utilisation

Les spécifications d'interopérabilité présentées dans ce volet ne
présagent pas des conditions de leur mise en œuvre dans le cadre d'un
système d'information partagé. Il appartient à tout responsable de
traitement de s'assurer que les services utilisant ces spécifications
respectent les cadres et bonnes pratiques applicables à ce genre de
service (ex : cadre juridique, bonnes pratiques de sécurité,
ergonomie, accessibilité ...). Il est à noter que les contraintes de
sécurité concernant les flux échangés ne sont pas traitées dans ce
document. Celles-ci sont du ressort de chaque responsable de
l’implémentation du mécanisme qui est dans l’obligation de se
conformer au cadre juridique en la matière. L’ANS propose des
référentiels dédiés à la politique de sécurité (la PGSSI-S3) et des
mécanismes de sécurisation sont définis dans les volets de la couche
Transport4 du Cadre d’Interopérabilité des systèmes d’information de
santé (CI-SIS).
>
3
[<u>https://esante.gouv.fr/securite/politique-generale-de-securite-des-systemes-d-information-de-sante</u>](https://esante.gouv.fr/securite/politique-generale-de-securite-des-systemes-d-information-de-sante)
>
4
[<u>http://esante.gouv.fr/services/referentiels/ci-sis/espace-publication/couche-transport</u>](http://esante.gouv.fr/services/referentiels/ci-sis/espace-publication/couche-transport)

# Contenu structuré des flux

## Correspondance entre objets métier et objets des standards HL7 FHIR, DICOM et syslog

Dans cette section, une mise en correspondance est faite entre :
>
▶ Les objets métier identifiés à l’issue de l’étude métier,
>
▶ Les ressources et éléments, du standard HL7 FHIR,
>
▶ Les éléments du standard syslog,
>
▶ Les éléments du standard DICOM.
>
Pour chaque objet métier, les tableaux ci-après reprennent l’ensemble
des éléments métier identifiés dans l’étude métier du cas d’usage.
Pour chaque attribut de chaque classe métier, la ressource FHIR et
plus particulièrement l’élément de cette ressource qui sera utilisé
pour véhiculer l’information est identifié. Il en est de même pour les
éléments des standards DICOM et syslog.
>
Ce travail concerne les flux structurés énumérés ci-dessous :
>
▶ Flux 1 - TransmissionTrace : demande d’enregistrement d’une trace
dans un gestionnaire de trace ;
>
▶ Flux 2 - ConsultationTrace : demande de consultation d’une trace en
particulier ;
>
▶ Flux 3 - ReponseConsultationTrace : retourne la trace demandée par
le flux 2 ;
>
▶ Flux 4 - RechercheTraces : recherche de traces avec une liste de
critères de recherche ;
>
▶ Flux 5 - ReponseRechercheTraces : retourne la liste des traces
répondant aux critères de
>
recherche.
>
Le flux 1bis « RetourTransmissionTrace » a été identifié mais n’est
pas inclus dans le périmètre de cette spécification technique.
>
Pour rappel :
>
▶ L’objet « Trace » contient les éléments relatifs à la source de la
trace et à l’évènement qui est tracé dans le système d’information.
>
▶ L’objet « Evenement » comprend les différents attributs d’un
événement : l’identifiant de l’évènement, son type, la date à laquelle
il a eu lieu (occurrence) et la date à laquelle il a été déclaré
(déclaration). D’autre part, il permet d’identifier les acteurs à
l’origine et à destination de l’évènement ainsi que l’objet de cet
évènement. Le terme « objet de l’évènement » se réfère à l’objet des
données qui ont été échangées comme par exemple le patient ou un
dispositif médical.

### Mise en correspondance avec le standard HL7 FHIR

Le tableau ci-dessous représente la mise en correspondance de l’objet
« Trace » avec la ressource FHIR AuditEvent.

<table style="width:97%;">
<colgroup>
<col style="width: 21%" />
<col style="width: 28%" />
<col style="width: 19%" />
<col style="width: 27%" />
</colgroup>
<thead>
<tr>
<th colspan="2"><blockquote>
<p><strong>Éléments métier</strong></p>
</blockquote></th>
<th colspan="2" style="text-align: center;"><blockquote>
<p><strong>Éléments FHIR</strong></p>
</blockquote></th>
</tr>
</thead>
<tbody>
<tr>
<td><blockquote>
<p><strong>Nom classes</strong></p>
</blockquote></td>
<td><blockquote>
<p><strong>Nom attributs</strong></p>
</blockquote></td>
<td><blockquote>
<p><strong>Ressource</strong></p>
</blockquote></td>
<td style="text-align: center;"><blockquote>
<p><strong>Elément</strong></p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>Trace</p>
</blockquote></td>
<td><blockquote>
<p>identifiant [0..1] : Identifiant</p>
</blockquote></td>
<td rowspan="11"><blockquote>
<p>AuditEvent</p>
</blockquote></td>
<td style="text-align: center;"><blockquote>
<p>id [1..1] id</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>SourceTrace [0..1]</p>
</blockquote></td>
<td><blockquote>
<p>identifiant [0..1] : Identifiant</p>
</blockquote></td>
<td style="text-align: center;"><blockquote>
<p>source [1..1].observer[1..1]. identifier [0..*] identifier</p>
<p>Reference (PractitionerRole|Practitioner|
Organization|Device|Patient|R elatedPerson)</p>
</blockquote></td>
</tr>
<tr>
<td rowspan="5"><blockquote>
<p>Événement [1..1]</p>
</blockquote></td>
<td><blockquote>
<p>typeEvenement [0..1] Code</p>
</blockquote></td>
<td style="text-align: center;"><blockquote>
<p>type [1..1] coding</p>
<p><em>Audit Event ID (extensible)1</em></p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>sousTypeEvenement [0..1] Code</p>
</blockquote></td>
<td style="text-align: center;"><blockquote>
<p>subtype [0..1] coding</p>
<p><em>Audit Event Sub-Type (extensible)1</em></p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>occurence [0..1] DateHeure</p>
</blockquote></td>
<td style="text-align: center;"><blockquote>
<p>period[0..1].start[0..1] dateTime</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>declaration [0..1] DateHeure</p>
</blockquote></td>
<td style="text-align: center;"><blockquote>
<p>recorded [1..1] instant</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>description [0..1] Texte</p>
</blockquote></td>
<td style="text-align: center;"><blockquote>
<p>outcomeDesc [0..1] string</p>
</blockquote></td>
</tr>
<tr>
<td rowspan="2"><blockquote>
<p>ActeurEvenement [0..2]</p>
</blockquote></td>
<td><blockquote>
<p>identifiant [1..1] Identifiant</p>
</blockquote></td>
<td style="text-align: center;"><blockquote>
<p>agent[1..*].who[0..1].identifier [0..*] identifier</p>
<p>Reference (PractitionerRole|Practitioner| Organization|
Device|Patient|RelatedPerson</p>
<p>)</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>role [1..1] Code</p>
</blockquote></td>
<td style="text-align: center;"><blockquote>
<p>agent[0..1].role[0..*] CodeableConcept</p>
</blockquote></td>
</tr>
<tr>
<td rowspan="2"><blockquote>
<p>ObjetEvenement [0..*]</p>
</blockquote></td>
<td><blockquote>
<p>type [0..1] Code</p>
</blockquote></td>
<td style="text-align: center;"><blockquote>
<p>entity[0..*].type[0..1] Coding</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>contenu [0..1] ObjetBinaire</p>
</blockquote></td>
<td style="text-align: center;"><blockquote>
<p>entity[0..*].what Reference</p>
<p>ou entity[0..*].query[0..1] base64Binary</p>
<p>ou entity[0..*].detail[0..*] BackBoneElement</p>
</blockquote></td>
</tr>
</tbody>
</table>

##### Tableau 2 Mise en correspondance entre l'objet Trace et la ressource FHIR AuditEvent

Le contenu (ObjetEvenement.contenu) à véhiculer dans la trace sera
défini par chaque instanciation de ce volet. Il peut s’agir d’une
autre ressource FHIR auquel cas elle sera référencée par entity.what,
des paramètres utilisés pour faire une recherche qui pourront être
recopiés dans le champ entity.query ou de tout autre contenu qui
pourra être véhiculé dans le champ entity.detail.value.

### Mise en correspondance avec le standard HL7 DICOM

### 

Le tableau ci-dessous représente la mise en correspondance de l’objet
« Trace » avec la structure AuditMessage définie par DICOM.

<table style="width:97%;">
<colgroup>
<col style="width: 21%" />
<col style="width: 25%" />
<col style="width: 22%" />
<col style="width: 27%" />
</colgroup>
<thead>
<tr>
<th colspan="2"><blockquote>
<p><strong>Éléments métier</strong></p>
</blockquote></th>
<th colspan="2"><blockquote>
<p><strong>Éléments DICOM</strong></p>
</blockquote></th>
</tr>
</thead>
<tbody>
<tr>
<td><blockquote>
<p><strong>Nom classes</strong></p>
</blockquote></td>
<td><blockquote>
<p><strong>Nom attributs</strong></p>
</blockquote></td>
<td><blockquote>
<p><strong>Elément du schéma AuditMessage</strong></p>
</blockquote></td>
<td><blockquote>
<p><strong>Sous-Elément</strong></p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>Trace</p>
</blockquote></td>
<td><blockquote>
<p>identifiant [0..1] : Identifiant</p>
</blockquote></td>
<td></td>
<td></td>
</tr>
<tr>
<td><blockquote>
<p>SourceTrace [0..1]</p>
</blockquote></td>
<td><blockquote>
<p>identifiant [0..1] : Identifiant</p>
</blockquote></td>
<td><blockquote>
<p>SourceAuditIdentification</p>
</blockquote></td>
<td><blockquote>
<p>AuditEnterpriseSiteId</p>
</blockquote></td>
</tr>
<tr>
<td rowspan="5"><blockquote>
<p>Événement [1..1]</p>
</blockquote></td>
<td><blockquote>
<p>typeEvenement [0..1] Code</p>
</blockquote></td>
<td rowspan="5"><blockquote>
<p>EventIdentification</p>
</blockquote></td>
<td><blockquote>
<p>EventID [1..1]</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>sousTypeEvenement [0..1] Code</p>
</blockquote></td>
<td><blockquote>
<p>EventTypeCode [1..1]</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>occurence [0..1] DateHeure</p>
</blockquote></td>
<td><blockquote>
<p>EventDateTime [1..1]</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>declaration [0..1] DateHeure</p>
</blockquote></td>
<td><blockquote>
<p>Possibilité utiliser le champ</p>
<p>« TIMESTAMP » du protocole syslog</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>description [0..1] Texte</p>
</blockquote></td>
<td><blockquote>
<p>EventOutcomeDescription</p>
</blockquote></td>
</tr>
<tr>
<td rowspan="2"><blockquote>
<p>ActeurEvenement [0..2]</p>
</blockquote></td>
<td><blockquote>
<p>identifiant [1..1] Identifiant</p>
</blockquote></td>
<td rowspan="2"><blockquote>
<p>ActiveParticipant</p>
</blockquote></td>
<td><blockquote>
<p>ActiveParticipant userId [1..1]</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>role [1..1] Code</p>
</blockquote></td>
<td><blockquote>
<p>RoleIdCode</p>
</blockquote></td>
</tr>
<tr>
<td rowspan="2"><blockquote>
<p>ObjetEvenement [0..*]</p>
</blockquote></td>
<td><blockquote>
<p>type [0..1] Code</p>
</blockquote></td>
<td rowspan="2"><blockquote>
<p>ParticipantObjectIdentific ation</p>
</blockquote></td>
<td><blockquote>
<p>ParticipantObjectTypeCode</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>contenu [0..1] ObjetBinaire</p>
</blockquote></td>
<td><blockquote>
<p>ParticipantObjectDetail.value</p>
<p>ou ParticipantObjectQuery ou ParticipantObjectID</p>
</blockquote></td>
</tr>
</tbody>
</table>

##### Tableau 3 Mise en correspondance entre l'objet Trace et le schema AuditMessage de DICOM

Le contenu à véhiculer dans la trace sera défini par chaque
instanciation de ce volet. Il peut s’agir des paramètres utilisés pour
faire une recherche qui pourront être recopiés dans le champ
ParticipantObjectQuery de l’élément ParticipantObjectIdentification ou
de tout autre contenu qui pourra être véhiculé dans le champ
ParticipantObjectDetail.value.

## Contenu des flux structurés

Ces spécifications techniques présentent deux manières de représenter
et d’échanger l’information dans le contexte du volet générique «
Traçabilité d’évènements ». Cette section définies le contenu
structuré des flux dans chacun des deux cas suivants :

- La trace est représentée par la ressource HL7 FHIR R4 AuditEvent

- La trace est représentée par le message DICOM AuditMessage (XML)

Le contenu structuré devra être revu et potentiellement amendé pour
chaque concrétisation spécifique à un cas d’usage défini. Cependant,
les règles suivantes s’appliquent :
>
▶ Les éléments définis comme obligatoires (cardinalité 1..1 ou 1..\*)
par le standard (HL7 FHIR ou DICOM) ou par cette spécification
technique ne peuvent être rendus optionnels ;
>
▶ Les éléments qui ne sont pas répétables dans cette spécification
(cardinalité maximum finie) ne peuvent pas être définis répétables ;
>
▶ Les jeux de valeur dont le contenu est une liste stricte de valeurs
codées (required indiqué entre parenthèses dans les tableaux suivants)
ne peuvent pas être modifiés.
>
En revanche, en fonction des besoins du cas d’usage, il est possible
de :
>
▶ Rendre obligatoire certains éléments actuellement optionnel dans ces
spécifications techniques ;
>
▶ Définir des jeux de valeur pour les champs codés du moment que le
jeu de valeur n’est pas défini
>
(binding = example) ni limité à un ensemble fini de valeurs (binding =
extensible);
>
▶ Limiter le nombre de répétitions des champs dont la cardinalité
maximum est infinie (\*).
>
Lors de la concrétisation de cette spécification, il est conseillé de
recopier les tableaux des sections suivantes et de compléter la
colonne « contrainte » pour indiquer quelles sont les contraintes
spécifiques au cas d’usage.

### Ressource HL7 FHIR « AuditEvent »

Le tableau ci-dessous reprend la ressource FHIR AuditEvent, identifiée
pour représenter le concept métier « Trace ». Les éléments retenus
lors de la mise en correspondance sont repris et complétés par
d’autres éléments qui sont obligatoires selon les spécifications FHIR
et sont listés dans l’ordre requis par ces dernières. Les cardinalités
retenues sont les cardinalités métier lorsque celle-ci sont plus
strictes que les cardinalités du standard.
>
Les éléments qui constituent des extensions ou des éléments de
ressources contenues seront précisés dans la colonne « Contraintes »
des tableaux concernés.
>
En annexe, des exemples permettent de mieux comprendre la composition
des ressources. Le concept métier « Trace » correspond à la ressource
HL7 FHIR « AuditEvent ».

<table>
<colgroup>
<col style="width: 15%" />
<col style="width: 12%" />
<col style="width: 18%" />
<col style="width: 17%" />
<col style="width: 35%" />
</colgroup>
<thead>
<tr>
<th><blockquote>
<p>Elément parent</p>
</blockquote></th>
<th><blockquote>
<p>Eléments</p>
</blockquote></th>
<th><blockquote>
<p>Type et Cardinalité</p>
</blockquote></th>
<th><blockquote>
<p>Contraintes</p>
</blockquote></th>
<th><blockquote>
<p>Commentaires</p>
</blockquote></th>
</tr>
</thead>
<tbody>
<tr>
<td rowspan="2"><blockquote>
<p>AuditEvent</p>
</blockquote></td>
<td><blockquote>
<p>id</p>
</blockquote></td>
<td><blockquote>
<p>id [0..1]</p>
</blockquote></td>
<td></td>
<td><blockquote>
<p>Identifiant unique de la trance</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>type</p>
</blockquote></td>
<td><blockquote>
<p>Coding [1..1]</p>
</blockquote></td>
<td></td>
<td><blockquote>
<p>Identifiant de l’événement</p>
<p>Jeu de valeurs : <a
href="https://www.hl7.org/fhir/valueset-audit-event-type.html"><u>Audit
Event ID</u></a(extensible)</p>
</blockquote></td>
</tr>
</tbody>
</table>

<table>
<colgroup>
<col style="width: 15%" />
<col style="width: 12%" />
<col style="width: 18%" />
<col style="width: 17%" />
<col style="width: 35%" />
</colgroup>
<thead>
<tr>
<th rowspan="11"></th>
<th><blockquote>
<p>subtype</p>
</blockquote></th>
<th><blockquote>
<p>Coding [0..*]</p>
</blockquote></th>
<th><blockquote>
<p>Cardinalité contrainte à [0..1]</p>
</blockquote></th>
<th><blockquote>
<p>Type d’événement</p>
<p>Jeu de valeurs : <a
href="https://www.hl7.org/fhir/valueset-audit-event-sub-type.html"><u>Audit
Event Sub-Type</u></a(extensible)</p>
</blockquote></th>
</tr>
<tr>
<th><blockquote>
<p>action</p>
</blockquote></th>
<th><blockquote>
<p>code [0..1]</p>
</blockquote></th>
<th></th>
<th><blockquote>
<p>Type d’action réalisée pendant l’évènement</p>
</blockquote></th>
</tr>
<tr>
<th><blockquote>
<p>period.start</p>
</blockquote></th>
<th><blockquote>
<p>dateTime [0..1]</p>
</blockquote></th>
<th><blockquote>
<p>Cardinalité contrainte à [1..1]</p>
</blockquote></th>
<th><blockquote>
<p>Date d’occurrence (début de l’évènement)</p>
</blockquote></th>
</tr>
<tr>
<th><blockquote>
<p>period.end</p>
</blockquote></th>
<th><blockquote>
<p>dateTime [0..1]</p>
</blockquote></th>
<th></th>
<th><blockquote>
<p>Date de fin de l’évènement</p>
</blockquote></th>
</tr>
<tr>
<th><blockquote>
<p>recorded</p>
</blockquote></th>
<th><blockquote>
<p>instant [1..1]</p>
</blockquote></th>
<th></th>
<th><blockquote>
<p>Date / Heure de la déclaration de l’événement</p>
</blockquote></th>
</tr>
<tr>
<th><blockquote>
<p>outcome</p>
</blockquote></th>
<th><blockquote>
<p>code [0..1]</p>
</blockquote></th>
<th></th>
<th><blockquote>
<p>Indicateur de succès ou d’échec de l’évènement</p>
<p>Jeu de valeurs: <a
href="https://www.hl7.org/fhir/valueset-audit-event-outcome.html"><u>AuditEventOutcome</u></a>
(required)</p>
</blockquote></th>
</tr>
<tr>
<th><blockquote>
<p>outcomeDes c</p>
</blockquote></th>
<th><blockquote>
<p>string [0..1]</p>
</blockquote></th>
<th></th>
<th><blockquote>
<p>Description de l’issue de l’évènement</p>
</blockquote></th>
</tr>
<tr>
<th><blockquote>
<p>purposeOfEv ent</p>
</blockquote></th>
<th></th>
<th></th>
<th><blockquote>
<p>La ou les raisons de l’évènement</p>
</blockquote></th>
</tr>
<tr>
<th><blockquote>
<p>agent</p>
</blockquote></th>
<th><blockquote>
<p>BackboneElement [1..*]</p>
</blockquote></th>
<th style="text-align: left;"><blockquote>
<p>Contraint à [1..2] pour représenter l’origine et le</p>
<p>destinataire de l’évènement.</p>
</blockquote></th>
<th><blockquote>
<p>Décrit les acteurs (système, personnes) à l’origine et à destination
de l’évènement.</p>
</blockquote></th>
</tr>
<tr>
<th><blockquote>
<p>source</p>
</blockquote></th>
<th><blockquote>
<p>BackboneElement [1..1]</p>
</blockquote></th>
<th></th>
<th><blockquote>
<p>Décrit le système émetteur de la trace</p>
</blockquote></th>
</tr>
<tr>
<th><blockquote>
<p>entity</p>
</blockquote></th>
<th><blockquote>
<p>BackboneElement [0..*]</p>
</blockquote></th>
<th></th>
<th><blockquote>
<p>Décrit le ou les objets de l’évènement</p>
</blockquote></th>
</tr>
</thead>
<tbody>
<tr>
<td rowspan="5"><blockquote>
<p>agent</p>
</blockquote></td>
<td><blockquote>
<p>type</p>
</blockquote></td>
<td><blockquote>
<p>CodeableConcept [0..1]</p>
</blockquote></td>
<td></td>
<td><blockquote>
<p>Type d’acteur</p>
<p>Jeu de valeur : <a
href="https://www.hl7.org/fhir/valueset-participation-role-type.html"><u>ParticipationRoleType</u></a>
(Extensible)</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>role</p>
</blockquote></td>
<td><blockquote>
<p>CodeableConcept [0..1]</p>
</blockquote></td>
<td></td>
<td><blockquote>
<p>Rôle de l’acteur dans l’évenement</p>
<p>Jeu de valeur : <a
href="https://www.hl7.org/fhir/valueset-security-role-type.html"><u>SecurityRoleType</u></a>
(example)</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>who</p>
</blockquote></td>
<td><blockquote>
<p>Reference(Practitione rRole | Practitioner | Organization |
Device</p>
<p>| Patient | RelatedPerson) [0..1]</p>
</blockquote></td>
<td style="text-align: left;"><blockquote>
<p>Cardinalité contrainte à [1..1]</p>
<p>A noter que l’attribut identifier de la ressource référencée est
contrainte à la cardinalité [1..*]</p>
</blockquote></td>
<td><blockquote>
<p>Si l’acteur est représenté par une ressource dans le système
d’information, cette dernière doit être référencée ici</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>altId</p>
</blockquote></td>
<td><blockquote>
<p>string [0..1]</p>
</blockquote></td>
<td></td>
<td><blockquote>
<p>Identification alternative de l’acteur</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>name</p>
</blockquote></td>
<td><blockquote>
<p>string [0..1]</p>
</blockquote></td>
<td></td>
<td><blockquote>
<p>Nom de l’acteur (compréhensible par un utilisateur)</p>
</blockquote></td>
</tr>
</tbody>
</table>

<table>
<colgroup>
<col style="width: 15%" />
<col style="width: 12%" />
<col style="width: 18%" />
<col style="width: 17%" />
<col style="width: 35%" />
</colgroup>
<thead>
<tr>
<th rowspan="7"></th>
<th><blockquote>
<p>requestor</p>
</blockquote></th>
<th><blockquote>
<p>boolean [1..1]</p>
</blockquote></th>
<th></th>
<th><blockquote>
<p>Indique si l’acteur est à l’originie ou à destination de
l’évènement.</p>
</blockquote>
<ul>
<li><p>True si l’acteur a initié l’évènement</p></li>
<li><p>False si l’acteur est destinataire de l’évènement.</p></li>
</ul></th>
</tr>
<tr>
<th><blockquote>
<p>location</p>
</blockquote></th>
<th><blockquote>
<p>Reference(Location) [0..1]</p>
</blockquote></th>
<th></th>
<th><blockquote>
<p>Indique où se trouve l’acteur de l’évènement</p>
</blockquote></th>
</tr>
<tr>
<th><blockquote>
<p>policy</p>
</blockquote></th>
<th><blockquote>
<p>uri [0..*]</p>
</blockquote></th>
<th></th>
<th><blockquote>
<p>Règles qui autorisent l’évènement</p>
</blockquote></th>
</tr>
<tr>
<th><blockquote>
<p>media</p>
</blockquote></th>
<th><blockquote>
<p>Coding [0..1]</p>
</blockquote></th>
<th></th>
<th style="text-align: left;"><blockquote>
<p>Si l’évènement concerne l’import ou l’exportation de données, le type
de support impliqué.</p>
<p>Jeu de valeurs : <a
href="https://www.hl7.org/fhir/valueset-dicm-405-mediatype.html"><u>Media
Code Type</u></a(extensible)</p>
</blockquote></th>
</tr>
<tr>
<th><blockquote>
<p>network.addr ess</p>
</blockquote></th>
<th><blockquote>
<p>string [0..1]</p>
</blockquote></th>
<th></th>
<th><blockquote>
<p>Identifiant de l’équipement utilisé par l’acteur</p>
</blockquote></th>
</tr>
<tr>
<th><blockquote>
<p>network.type</p>
</blockquote></th>
<th><blockquote>
<p>code [0..1]</p>
</blockquote></th>
<th></th>
<th><blockquote>
<p>Type de point d’accès de l’équipement utilisé par l’acteur</p>
<p>Jeu de valeurs : <a
href="https://www.hl7.org/fhir/valueset-network-type.html"><u>AuditEventAgentNetworkType</u></a>
(required)</p>
</blockquote></th>
</tr>
<tr>
<th><blockquote>
<p>purposeOfUs e</p>
</blockquote></th>
<th><blockquote>
<p>CodableConcept [0..*]</p>
</blockquote></th>
<th></th>
<th><blockquote>
<p>Les raisons que l’utilisateur a de participer à cet évènement</p>
</blockquote></th>
</tr>
</thead>
<tbody>
<tr>
<td rowspan="3"><blockquote>
<p>source</p>
</blockquote></td>
<td><blockquote>
<p>site</p>
</blockquote></td>
<td><blockquote>
<p>string [0..1]</p>
</blockquote></td>
<td></td>
<td><blockquote>
<p>Emplacement de la source de la trace au sein du système
d’information</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>observer</p>
</blockquote></td>
<td style="text-align: left;"><blockquote>
<p>Reference(Practitione rRole | Practitioner | Organization | Device |
Patient |</p>
<p>RelatedPerson) [1..1]</p>
</blockquote></td>
<td></td>
<td><blockquote>
<p>Identifie la source de la trace</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>type</p>
</blockquote></td>
<td><blockquote>
<p>Coding [0..*]</p>
</blockquote></td>
<td></td>
<td><blockquote>
<p>Identifie le type de source</p>
<p>Jeu de valeurs: <a
href="https://www.hl7.org/fhir/valueset-audit-source-type.html"><u>Audit
Event Source Type</u></a(Extensible)</p>
</blockquote></td>
</tr>
<tr>
<td rowspan="4"><blockquote>
<p>entity</p>
</blockquote></td>
<td><blockquote>
<p>what</p>
</blockquote></td>
<td><blockquote>
<p>Reference(Any) [0..1]</p>
</blockquote></td>
<td></td>
<td><blockquote>
<p>Référence la ressource objet de l’évènement (ex : ressource Patient,
Device)</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>type</p>
</blockquote></td>
<td><blockquote>
<p>Coding [0..1]</p>
</blockquote></td>
<td></td>
<td><blockquote>
<p>Type d’objet</p>
<p>Jeu de valeurs: <a
href="https://www.hl7.org/fhir/valueset-audit-entity-type.html"><u>Audit
event entity type</u></a(Extensible)</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>role</p>
</blockquote></td>
<td><blockquote>
<p>Coding [0..1]</p>
</blockquote></td>
<td></td>
<td><blockquote>
<p>Rôle de cet objet dans l’évènement</p>
<p>Jeu de valeurs : <a
href="https://www.hl7.org/fhir/valueset-object-role.html"><u>AuditEventEntityRole</u></a>
(Extensible)</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>lifecycle</p>
</blockquote></td>
<td><blockquote>
<p>Coding [0..1]</p>
</blockquote></td>
<td></td>
<td><blockquote>
<p>Etat de l’objet dans son cycle de vie</p>
</blockquote></td>
</tr>
</tbody>
</table>

<table>
<colgroup>
<col style="width: 15%" />
<col style="width: 12%" />
<col style="width: 18%" />
<col style="width: 17%" />
<col style="width: 35%" />
</colgroup>
<thead>
<tr>
<th rowspan="6"></th>
<th></th>
<th></th>
<th></th>
<th><blockquote>
<p>Jeu de valeurs : <a
href="https://www.hl7.org/fhir/valueset-object-lifecycle-events.html"><u>ObjectLifecycleEvents</u></a>
(Extensible)</p>
</blockquote></th>
</tr>
<tr>
<th><blockquote>
<p>securityLabel</p>
</blockquote></th>
<th><blockquote>
<p>Coding [0..*]</p>
</blockquote></th>
<th></th>
<th><blockquote>
<p>Etiquettes de sécurité liées à l’objet</p>
<p>Jeu de valeurs : <a
href="https://www.hl7.org/fhir/valueset-security-labels.html"><u>SecurityLabels</u></a>
(Extensible)</p>
</blockquote></th>
</tr>
<tr>
<th><blockquote>
<p>name</p>
</blockquote></th>
<th><blockquote>
<p>string [0..1]</p>
</blockquote></th>
<th></th>
<th><blockquote>
<p>Nom de l’objet</p>
</blockquote></th>
</tr>
<tr>
<th><blockquote>
<p>description</p>
</blockquote></th>
<th><blockquote>
<p>string [0..1]</p>
</blockquote></th>
<th></th>
<th><blockquote>
<p>Description textuelle de l’objet</p>
</blockquote></th>
</tr>
<tr>
<th><blockquote>
<p>query</p>
</blockquote></th>
<th><blockquote>
<p>base64Binary [0..1]</p>
</blockquote></th>
<th></th>
<th><blockquote>
<p>Paramètres de recherche</p>
</blockquote></th>
</tr>
<tr>
<th><blockquote>
<p>detail</p>
</blockquote></th>
<th><blockquote>
<p>BackboneElement [0..*]</p>
</blockquote></th>
<th></th>
<th style="text-align: left;"><blockquote>
<p>Contenu de la trace quand celui-ci ne peut pas être véhiculé par les
champs what, name ou query.</p>
</blockquote></th>
</tr>
</thead>
<tbody>
<tr>
<td rowspan="2"><blockquote>
<p>detail</p>
</blockquote></td>
<td><blockquote>
<p>type</p>
</blockquote></td>
<td><blockquote>
<p>string [1..1]</p>
</blockquote></td>
<td></td>
<td><blockquote>
<p>Nom de la propriété</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>value[]</p>
</blockquote></td>
<td><blockquote>
<p>string ou</p>
<p>base64Binary [1..1]</p>
</blockquote></td>
<td></td>
<td><blockquote>
<p>contenu de la trace</p>
</blockquote></td>
</tr>
</tbody>
</table>

### DICOM Audit message

Le tableau ci-dessous reprend la structure du message DICOM
AuditMessage, identifié pour représenter le concept métier « Trace ».
Les éléments retenus lors de la mise en correspondance sont repris et
complétés par d’autres éléments qui sont obligatoires selon les
spécifications DICOM et sont listés dans l’ordre requis par ces
dernières. Les cardinalités retenues sont les cardinalités métier
lorsque celle-ci sont plus strictes que les cardinalités du standard.
>
En annexe, des exemples permettent de mieux comprendre la composition
du message d’audit DICOM.

<table>
<colgroup>
<col style="width: 15%" />
<col style="width: 19%" />
<col style="width: 15%" />
<col style="width: 23%" />
<col style="width: 10%" />
<col style="width: 10%" />
<col style="width: 3%" />
</colgroup>
<thead>
<tr>
<th><blockquote>
<p>Eléments parents</p>
</blockquote></th>
<th><blockquote>
<p>Eléments</p>
</blockquote></th>
<th><blockquote>
<p>Type et Cardinalité</p>
</blockquote></th>
<th><blockquote>
<p>Contraintes</p>
</blockquote></th>
<th colspan="3" style="text-align: left;"><blockquote>
<p>Commentaires</p>
</blockquote></th>
</tr>
</thead>
<tbody>
<tr>
<td rowspan="6"><blockquote>
<p>AuditMessage</p>
</blockquote></td>
<td><blockquote>
<p>EventActionCode</p>
</blockquote></td>
<td><blockquote>
<p>token [0..1]</p>
</blockquote></td>
<td></td>
<td colspan="3" style="text-align: left;"><blockquote>
<p>Identifie le type d’action entreprise pendant l’évènement</p>
<p>Jeu de valeurs (required)</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>EventDateTime</p>
</blockquote></td>
<td><blockquote>
<p>dateTime [1..1]</p>
</blockquote></td>
<td></td>
<td colspan="3" style="text-align: left;"><blockquote>
<p>Date à laquelle l’évènement a eu lieu</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>EventOutcomeIndicator</p>
</blockquote></td>
<td><blockquote>
<p>token [1..1]</p>
</blockquote></td>
<td></td>
<td colspan="3" style="text-align: left;"><blockquote>
<p>Indique si l’évènement a été ou non un succès</p>
<p>Jeu de valeurs (required)</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>EventID</p>
</blockquote></td>
<td><blockquote>
<p>CodedValueType [1..1]</p>
</blockquote></td>
<td></td>
<td colspan="3" style="text-align: left;"><blockquote>
<p>Identifie le type d’évènement</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>EventTypeCode</p>
</blockquote></td>
<td><blockquote>
<p>CodedValueType [0..*]</p>
</blockquote></td>
<td></td>
<td style="text-align: left;"><blockquote>
<p>Précise la l’évènement</p>
</blockquote></td>
<td style="text-align: center;"><blockquote>
<p>catégorie</p>
</blockquote></td>
<td style="text-align: center;"><blockquote>
<p>de</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>EventOutcomeDescripti on</p>
</blockquote></td>
<td><blockquote>
<p>string [0..1]</p>
</blockquote></td>
<td></td>
<td style="text-align: left;"><blockquote>
<p>Description l’évènement</p>
</blockquote></td>
<td style="text-align: center;">de l’issue</td>
<td style="text-align: center;"><blockquote>
<p>de</p>
</blockquote></td>
</tr>
</tbody>
</table>

<table style="width:100%;">
<colgroup>
<col style="width: 15%" />
<col style="width: 19%" />
<col style="width: 15%" />
<col style="width: 23%" />
<col style="width: 13%" />
<col style="width: 7%" />
<col style="width: 4%" />
</colgroup>
<thead>
<tr>
<th rowspan="4"></th>
<th><blockquote>
<p>PurposeOfUse</p>
</blockquote></th>
<th><blockquote>
<p>CodedValueType [0..*]</p>
</blockquote></th>
<th></th>
<th style="text-align: left;"><blockquote>
<p>La ou les l’évènement</p>
</blockquote></th>
<th style="text-align: left;"><blockquote>
<p>raisons</p>
</blockquote></th>
<th style="text-align: left;"><blockquote>
<p>de</p>
</blockquote></th>
</tr>
<tr>
<th><blockquote>
<p>ActiveParticipant</p>
</blockquote></th>
<th><blockquote>
<p>[1..*]</p>
</blockquote></th>
<th style="text-align: left;"><blockquote>
<p>Cardinalité contrainte à [1..2] pour représenter l’origine et le
destinataire de l’évènement.</p>
</blockquote></th>
<th colspan="3" style="text-align: left;"><blockquote>
<p>Identifie le ou les acteurs qui ont pris part à l’évènement</p>
</blockquote></th>
</tr>
<tr>
<th><blockquote>
<p>AuditSourceIdentificatio n</p>
</blockquote></th>
<th><blockquote>
<p>[1..1]</p>
</blockquote></th>
<th></th>
<th colspan="3" style="text-align: left;"><blockquote>
<p>Identifie le système à l’origine de la trace</p>
</blockquote></th>
</tr>
<tr>
<th><blockquote>
<p>ParticipantObjectIdentifi cation</p>
</blockquote></th>
<th><blockquote>
<p>[0..*]</p>
</blockquote></th>
<th></th>
<th colspan="3" style="text-align: left;"><blockquote>
<p>Identifie le ou les objets de l’évènement.</p>
</blockquote></th>
</tr>
</thead>
<tbody>
<tr>
<td></td>
<td><blockquote>
<p>userID</p>
</blockquote></td>
<td><blockquote>
<p>string [1..1]</p>
</blockquote></td>
<td></td>
<td colspan="3" style="text-align: left;"><blockquote>
<p>Identifie de manière unique l’utilisateur qui participe activement à
l’évènement</p>
</blockquote></td>
</tr>
<tr>
<td></td>
<td><blockquote>
<p>AlternativeUserID</p>
</blockquote></td>
<td><blockquote>
<p>string [0..1]</p>
</blockquote></td>
<td></td>
<td colspan="3" style="text-align: left;"><blockquote>
<p>Identifiant unique alternatif</p>
</blockquote></td>
</tr>
<tr>
<td></td>
<td><blockquote>
<p>UserName</p>
</blockquote></td>
<td><blockquote>
<p>string [0..1]</p>
</blockquote></td>
<td></td>
<td colspan="3" style="text-align: left;"><blockquote>
<p>Name de l’utilisateur (exploitable par un humain)</p>
</blockquote></td>
</tr>
<tr>
<td></td>
<td></td>
<td></td>
<td rowspan="3"></td>
<td colspan="3" style="text-align: left;"><blockquote>
<p>Indique si l’acteur est à l’originie ou à destination de
l’évènement.</p>
</blockquote></td>
</tr>
<tr>
<td></td>
<td><blockquote>
<p>UserIsRequestor</p>
</blockquote></td>
<td><blockquote>
<p>boolean [1..1]</p>
</blockquote></td>
<td colspan="3" style="text-align: left;"><ul>
<li><p>True si l’acteur a initié l’évènement</p></li>
</ul></td>
</tr>
<tr>
<td></td>
<td></td>
<td></td>
<td colspan="3" style="text-align: left;"><blockquote>
<p>False si l’acteur est destinataire de l’évènement.</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>ActiveParticipant</p>
</blockquote></td>
<td><blockquote>
<p>NetworkAccessPointID</p>
</blockquote></td>
<td><blockquote>
<p>token [0..1]</p>
</blockquote></td>
<td></td>
<td colspan="3" style="text-align: left;"><blockquote>
<p>Identifie l’acteur d’un point de vue réseau (nom de la machine ou
adresse IP, ou numéro de téléphone ou email adresse ou URI)</p>
</blockquote></td>
</tr>
<tr>
<td></td>
<td><blockquote>
<p>NetworkAccessPointTy peCode</p>
</blockquote></td>
<td><blockquote>
<p>token [0..1]</p>
</blockquote></td>
<td rowspan="2"></td>
<td colspan="3" style="text-align: left;"><blockquote>
<p>Indique le type d’équipement identifié par</p>
<p>NetworkAccessPointID</p>
</blockquote></td>
</tr>
<tr>
<td></td>
<td></td>
<td></td>
<td colspan="3" style="text-align: left;"><blockquote>
<p>Jeu de valeur (required)</p>
</blockquote></td>
</tr>
<tr>
<td></td>
<td><blockquote>
<p>RoleIDCode</p>
</blockquote></td>
<td><blockquote>
<p>CodedValueType [0..*]</p>
</blockquote></td>
<td></td>
<td colspan="3" style="text-align: left;"><blockquote>
<p>Liste les rôles de l’utilisateur</p>
<p>Jeu de valeurs (extensible)</p>
</blockquote></td>
</tr>
<tr>
<td></td>
<td><blockquote>
<p>MediaIdentifier</p>
</blockquote></td>
<td><blockquote>
<p>string [0..1]</p>
</blockquote></td>
<td></td>
<td colspan="3" style="text-align: left;"><blockquote>
<p>Identifiant du media (ID du Volume, URI, ou tout autre élément
permettant d’identifier le média) quand celui émet ou reçoit de
l’information.</p>
</blockquote></td>
</tr>
<tr>
<td></td>
<td><blockquote>
<p>MediaType</p>
</blockquote></td>
<td><blockquote>
<p>CodedValueType [0..1]</p>
</blockquote></td>
<td></td>
<td colspan="3" style="text-align: left;"><blockquote>
<p>Type de média</p>
<p>Jeu de valeurs (extensible)</p>
</blockquote></td>
</tr>
</tbody>
</table>

<table>
<colgroup>
<col style="width: 15%" />
<col style="width: 19%" />
<col style="width: 15%" />
<col style="width: 23%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr>
<th rowspan="3"><blockquote>
<p>AuditSourceIdentif ication</p>
</blockquote></th>
<th><blockquote>
<p>AuditEnterpriseSiteID</p>
</blockquote></th>
<th><blockquote>
<p>token [0..1]</p>
</blockquote></th>
<th></th>
<th style="text-align: left;"><blockquote>
<p>Localisation de la source au sein du système d’information</p>
</blockquote></th>
</tr>
<tr>
<th><blockquote>
<p>AuditSourceID</p>
</blockquote></th>
<th><blockquote>
<p>token [1..1]</p>
</blockquote></th>
<th></th>
<th style="text-align: left;"><blockquote>
<p>Identifiant de la source</p>
</blockquote></th>
</tr>
<tr>
<th><blockquote>
<p>AuditSourceTypeCode</p>
</blockquote></th>
<th><blockquote>
<p>AuditSourceType CodeContent [0..*]</p>
</blockquote></th>
<th></th>
<th style="text-align: left;"><blockquote>
<p>Type de source</p>
<p>Jeu de valeurs (extensible)</p>
</blockquote></th>
</tr>
</thead>
<tbody>
<tr>
<td rowspan="10"><blockquote>
<p>ParticipantObjectI dentification</p>
</blockquote></td>
<td><blockquote>
<p>ParticipantObjectID</p>
</blockquote></td>
<td><blockquote>
<p>token [0..1]</p>
</blockquote></td>
<td></td>
<td style="text-align: left;"><blockquote>
<p>Identifie une instance spécifique de l'objet de l'évènement</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>ParticipantObjectTypeC ode</p>
</blockquote></td>
<td><blockquote>
<p>token [0..1]</p>
</blockquote></td>
<td></td>
<td style="text-align: left;"><blockquote>
<p>décrit le type d'identifiant qui est contenu dans ParticipantObjectID
Jeu de valeurs (extensible)</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>ParticipantObjectTypeC odeRole</p>
</blockquote></td>
<td><blockquote>
<p>token [0..1]</p>
</blockquote></td>
<td></td>
<td style="text-align: left;"><blockquote>
<p>Rôle de l’objet de l’évènement</p>
<p>Jeu de valeurs (required)</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>ParticipantObjectDataLi feCycle</p>
</blockquote></td>
<td><blockquote>
<p>token [0..1]</p>
</blockquote></td>
<td></td>
<td style="text-align: left;"><blockquote>
<p>Etat de l’objet dans son cycle de vie</p>
<p>Jeu de valeurs (required)</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>ParticipantObjectSensiti vity</p>
</blockquote></td>
<td><blockquote>
<p>token [0..1]</p>
</blockquote></td>
<td></td>
<td style="text-align: left;"><blockquote>
<p>Règles qui autorisent l’évènement</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>ParticipantObjectIDTyp eCode</p>
</blockquote></td>
<td><blockquote>
<p>CodedValueType [1..1]</p>
</blockquote></td>
<td></td>
<td style="text-align: left;"><blockquote>
<p>Décrit l’identifiant qui est donné dans le champ
ParticipantObjectID</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>ParticipantObjectName</p>
</blockquote></td>
<td><blockquote>
<p>token [0..1]</p>
</blockquote></td>
<td></td>
<td style="text-align: left;"><blockquote>
<p>Description de l’objet de l’évènement, par exemple, nom de la
personne.</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>ParticipantObjectQuery</p>
</blockquote></td>
<td><blockquote>
<p>base64Binary [0..1]</p>
</blockquote></td>
<td></td>
<td style="text-align: left;"><blockquote>
<p>Le contenu de la requête qui a été exécutée dans le cas où
l’évènement est une recherche.</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>ParticipantObjectDetail</p>
</blockquote></td>
<td><blockquote>
<p>ValuePair [0..*]</p>
</blockquote></td>
<td></td>
<td style="text-align: left;"><blockquote>
<p>Contenu de la trace quand celui-ci ne peut pas être véhiculé par les
champs ParticipantObjectName ou ParticipantObjectQuery</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>ParticipantObjectDescri ption</p>
</blockquote></td>
<td><blockquote>
<p>DICOMObjectDes criptionContents [0..*]</p>
</blockquote></td>
<td></td>
<td style="text-align: left;"><blockquote>
<p>Permet de décrire plus finement les objets DICOM impliqués dans
l’évènement.</p>
</blockquote></td>
</tr>
<tr>
<td rowspan="3"><blockquote>
<p>DICOMObjectDes criptionContents</p>
</blockquote></td>
<td><blockquote>
<p>MPPS</p>
</blockquote></td>
<td><blockquote>
<p>UID [0..*]</p>
</blockquote></td>
<td></td>
<td style="text-align: left;"><blockquote>
<p>UID des MPPS associée à l’objet de l’évènement</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>Accession</p>
</blockquote></td>
<td><blockquote>
<p>Number [0..*]</p>
</blockquote></td>
<td></td>
<td style="text-align: left;"><blockquote>
<p>Accession number</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>SOPClass</p>
</blockquote></td>
<td><blockquote>
<p>[0..*]</p>
</blockquote></td>
<td></td>
<td style="text-align: left;"><blockquote>
<p>Les UIDs des SOP Class DICOM de l’objet</p>
</blockquote></td>
</tr>
</tbody>
</table>

<table>
<colgroup>
<col style="width: 15%" />
<col style="width: 19%" />
<col style="width: 15%" />
<col style="width: 23%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr>
<th rowspan="3"></th>
<th><blockquote>
<p>ParticipantObjectContai nsStudy</p>
</blockquote></th>
<th><blockquote>
<p>[0..1]</p>
</blockquote></th>
<th></th>
<th style="text-align: left;"><blockquote>
<p>Permet de renseigner la valeur de Study Instance UID dans un cas
précis.</p>
</blockquote></th>
</tr>
<tr>
<th><blockquote>
<p>Encrypted</p>
</blockquote></th>
<th><blockquote>
<p>[0..1]</p>
</blockquote></th>
<th></th>
<th style="text-align: left;"><blockquote>
<p>Positionné à True si les données ont été encryptées, False sinon.</p>
</blockquote></th>
</tr>
<tr>
<th><blockquote>
<p>Anonymyzed</p>
</blockquote></th>
<th><blockquote>
<p>[0..1]</p>
</blockquote></th>
<th></th>
<th style="text-align: left;"><blockquote>
<p>Positionné à True si toutes les données relatives à l’identité du
patient ont été anonymisées, False sinon.</p>
</blockquote></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

# Construction des flux

Dans ces spécifications techniques, deux solutions sont retenues pour
supporter les échanges définis au cours de l’étude métier pour le
volet générique de traçabilité d’évènements :
>
▶ Solution 1 basée sur l’API REST de HL7 FHIR avec pour contenu la
ressource AuditEvent ;
>
▶ Solution 2 basée sur le protocole Syslog pour la transmission et une
API HTTP REST pour la
>
recherche et la consultation. Cette seconde solution préconise
l’utilisation des messages DICOM AuditMessage pour véhiculer
l’information mais ne limite pas l’implémentation à ce seul format.
>
Bien que ces deux solutions puissent coexister pour répondre à un cas
d’usage, il est important de noter que au moins deux structures de
traces vont alors coexister au sein du gestionnaire de traces (HL7
FHIR AuditEvent et DICOM Audit Message) et que les possibilités de
recherche offertes par les transactions ITI-81 et ITI-82 du cadre
technique IHE portent sur deux ensembles de données distincts :
>
▶ Le contenu des ressources AuditEvent dans le cas de la transaction
ITI-81 ;
>
▶ Les méta données Syslog dans le cas de la transaction ITI-82.
>
Il conviendra certainement que chaque cas d’usage implémentant ce
volet générique choisisse l’une ou l’autre des solutions pour éviter
toute incohérence au sein du système d’information.
>
Des tables de mises en correspondance entre DICOM Audit Message et HL7
FHIR AuditEvent sont mises à disposition dans le standard HL7 FHIR et
dans le supplément RESTful ATNA publié par IHE.

## Synthèse des flux

### Solution 1 : Ressource AuditEvent et API FHIR REST

La construction des flux consiste en la construction des requêtes ou
des réponses HTTP de l’API REST pour FHIR. Cette section présente les
flux permettant d’échanger les informations identifiées dans les
chapitres précédents.

<img src="st_image4.jpeg"
style="width:6.25617in;height:3.0625in" />

### Solution 2 : Audit message DICOM, protocole Syslog et opération HTTP

La construction des flux consiste en la construction des requêtes ou
des réponses syslog (pour la transmission de trace) et HTTP (pour la
consultation et la recherche de trace).

<img src="st_image5.jpeg"
style="width:6.21508in;height:2.5575in" />

Contrairement à la solution basée sur HL7 FHIR, il n’est pas prévu de
pouvoir consulter une trace en particulier, le protocol Syslog ne
permettant pas d’identifier de manière unique les messages échangés.
En revanche, le message « Syslog Event Response message » est défini
de telle sorte que l’entièreté des données des traces soit retournée
au Consommateur de traces.

## Flux 1 : TransmissionTrace

Ce flux permet de transmettre une trace « générique » de la « source
des traces » vers le « gestionnaire des traces ».

### Construction du flux HL7 FHIR

Ce flux est construit selon les exigences de la transaction IHE
ITI-205 « Record Audit Event » dans sa version HL7 FHIR où une seule
trace est transmise à la fois : « Send Audit Resource Request Message
>
\- FHIR Feed Interaction » .
>
La première étape de construction de ce flux consiste à créer la
ressource AuditEvent conformément aux exigences du contexte métier.
>
La ressource AuditEvent ainsi constituée sera envoyée dans le corps de
la requête HTTP POST suivante :
>
POST \[base\]/AuditEvent
>
Où \[base\] est le point de contact FHIR défini par le Gestionnaire de
trace. Un exemple de flux est joint (cf [<u>annexe 3</u>
:](#annexe-3-exemples-de-flux) ).

### Construction du flux Syslog

Ce flux est construit selon les exigences de la transaction IHE
ITI-206 « Record Audit Event » dans sa version Syslog : « Send Audit
Event Message - Syslog Interaction ». Certaines contraintes de cette
transaction doivent être adaptées à chaque contexte métier, en
particulier les éléments suivants de l’en- tête Syslog :
>
▶ PRI : défini la priorité. Le profil ATNA est destiné à tracer tous
les évènements liées à la sécurité des données de santé ; les codes
choisis par IHE peuvent ne pas être pertinent pour certains cas
d’usage concrétisant cette spécification.
>
▶ MSGID : identifie le type de message. Devrait être propre à chaque
cas d’usage pour permettre une identification rapide du contexte
d’émission de la trace.
>
La première étape de construction de ce flux consiste à créer le
message qui constituera le corps du message Syslog, le message d’audit
au format DICOM si la concrétion de se volet ne définit pas un autre
format pour le contenu de la trace.
>
Ce contenu est ensuite encapsulé dans un message syslog qui sera
transmis via UDP ou TLS au gestionnaire de traces.
>
5
[<u>https://www.ihe.net/uploadedFiles/Documents/ITI/IHE_ITI_Suppl_RESTful-ATNA.pdf</u>](https://www.ihe.net/uploadedFiles/Documents/ITI/IHE_ITI_Suppl_RESTful-ATNA.pdf)
section 3.20
>
6
[<u>https://www.ihe.net/uploadedFiles/Documents/ITI/IHE_ITI_TF_Vol2a.pdf</u>](https://www.ihe.net/uploadedFiles/Documents/ITI/IHE_ITI_TF_Vol2a.pdf)
Section 3.20
>
Un exemple de flux est joint (cf [<u>annexe
3</u>](#annexe-3-exemples-de-flux)).

## Flux 2 : ConsultationTrace

Ce flux n’est pas défini dans le contexte du protocole Syslog.
>
Le Flux 2 « ConsultationTrace » permet au consommateur de traces de
demander la consultation d’une trace dont l’identifiant est connu au
gestionnaire de traces. Ce flux utilise l’interaction « read » de
l’API REST de HL7 FHIR.
>
La première étape de construction de ce flux consiste à récupérer
l’identifiant de la ressource AuditEvent représentant la trace à
consulter.
>
Cet identifiant est utilisé dans la requête GET suivante :
>
GET \[base\]/AuditEvent/\[id\]
>
Où \[base\] est le point de contact défini par le gestionnaire de
trace et \[id\] l’identifiant système de la ressource AuditEvent à
consulter.

## Flux 3 : ReponseConsultationTrace

Ce flux n’est pas défini dans le contexte du protocole Syslog.
>
Le Flux 3 « ReponseConsultationTrace » correspond à la réponse du
Gestionnaire de trace à la demande du Consommateur de traces de
consulter une trace dont il connaît l’identifiant système (Flux 2).
>
Le flux 3 se compose d’un code HTTP 200 ok et d’un contenu. Le corps
de la réponse HTTP est consituée de la ressource AuditEvent identifiée
dans la demande.
>
Pour des informations sur les autres codes HTTP (HTTP status code)
retournés en cas d’échec, consultez la documentation relative à
l’interaction « read » de l’API REST FHIR.

## Flux 4 : RechercheTraces

Ce flux est utilisé par le consommateur de traces pour faire une
recherche de traces auprès du gestionnaire de traces.

### Construction du flux HL7 FHIR

Dans le contexte d’une implémentation en HL7 FHIR, le flux 4 est
construit selon les exigences de l’interaction « search » de l’API
REST de FHIR et, plus particulièrement, les exigences de la
transaction IHE ITI-817 « Retrieve ATNA Audit Event ».
>
Les paramètres de recherche possibles sont ceux définis par HL7 FHIR
pour la ressource AuditEvent. L’URL suivante est utilisée :
>
7
[<u>https://www.ihe.net/uploadedFiles/Documents/ITI/IHE_ITI_Suppl_RESTful-ATNA.pdf</u>](https://www.ihe.net/uploadedFiles/Documents/ITI/IHE_ITI_Suppl_RESTful-ATNA.pdf)
Section 3.81
>
GET
\[base\]/AuditEvent?date=ge\[start-time\]&date=le\[stop-time\]&\<query\>
>
Où \[base\] est le point de contact FHIR du gestionnaire de traces,
\[start-time\] et \[stop-time\] indique l’intervalle de temps dans
lequel les traces sont recherchées (date se réfère à la date
d’enregistrement de l’évènement). \<query\représente les autres
paramètres, sous la forme param=valeur, permettant d’affiner la
recherche.

#### Paramètres de recherche

La transaction \[ITI-81\] Retrieve ATNA Audit Event exige que la
recherche de traces soit bornée dans le temps. C’est-à-dire que le
paramètre de recherche « date » qui correspond à la date
d’enregistrement de l’évènement doit être présent pour préciser une
limite de temps (avant, après ou un intervalle). Le tableau ci-dessous
précise la mise en correspondance des paramètres de recherche
identifiés dans l’étude métier avec les paramètres de recherche HL7
FHIR de la ressource AuditEvent.
>
L’élément apparaissant *en italique et en rouge* correspond à un
critère de recherche défini dans le cadre de cette spécification
technique.

<table style="width:99%;">
<colgroup>
<col style="width: 19%" />
<col style="width: 23%" />
<col style="width: 18%" />
<col style="width: 37%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;"><blockquote>
<p>Critère de recherche</p>
<p>« métier »</p>
</blockquote></th>
<th style="text-align: center;"><blockquote>
<p>Nom du paramètre</p>
</blockquote></th>
<th style="text-align: center;"><blockquote>
<p>Type de donnée</p>
</blockquote></th>
<th style="text-align: center;"><blockquote>
<p>Description</p>
</blockquote></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: center;"><blockquote>
<p>typeEvenement</p>
</blockquote></td>
<td style="text-align: center;"><blockquote>
<p>type</p>
</blockquote></td>
<td style="text-align: center;"><blockquote>
<p>token</p>
</blockquote></td>
<td style="text-align: center;"><blockquote>
<p>Type de l’évènement qui a été tracé</p>
</blockquote></td>
</tr>
<tr>
<td style="text-align: center;"><blockquote>
<p>sousTypeEvement</p>
</blockquote></td>
<td style="text-align: center;"><blockquote>
<p>subtype</p>
</blockquote></td>
<td style="text-align: center;"><blockquote>
<p>token</p>
</blockquote></td>
<td style="text-align: center;"><blockquote>
<p>Sous-type de l’évènement qui a été tracé</p>
</blockquote></td>
</tr>
<tr>
<td style="text-align: center;"><blockquote>
<p>dateOccurence</p>
</blockquote></td>
<td style="text-align: center;"><blockquote>
<p><em>TDE_AuditEvent_period- start</em></p>
</blockquote></td>
<td style="text-align: center;"><blockquote>
<p>dateTime</p>
</blockquote></td>
<td style="text-align: center;"><blockquote>
<p>Date d’occurrence de l’évènement</p>
</blockquote></td>
</tr>
<tr>
<td style="text-align: center;"><blockquote>
<p>dateDeclaration</p>
</blockquote></td>
<td style="text-align: center;"><blockquote>
<p>recorded</p>
</blockquote></td>
<td style="text-align: center;"><blockquote>
<p>dateTime</p>
</blockquote></td>
<td style="text-align: center;"><blockquote>
<p>Date à laquelle l’évènement a été enregistré</p>
</blockquote></td>
</tr>
<tr>
<td rowspan="2" style="text-align: center;"><blockquote>
<p>origine</p>
</blockquote></td>
<td style="text-align: center;"><blockquote>
<p>agent agent-name</p>
<p>altId</p>
</blockquote></td>
<td style="text-align: center;"><blockquote>
<p>reference string</p>
<p>token</p>
</blockquote></td>
<td style="text-align: center;"><blockquote>
<p>Les paramètres agent, agent-name et/ou altId peuvent être utilisés
pour identifier l’origine de la trace</p>
</blockquote></td>
</tr>
<tr>
<td style="text-align: center;"><blockquote>
<p>agent-role</p>
</blockquote></td>
<td style="text-align: center;"><blockquote>
<p>token</p>
</blockquote></td>
<td style="text-align: center;"><blockquote>
<p>agent-role aura pour valeur le code utilisé pour indiquer que l’agent
est l’origine de la trace</p>
</blockquote></td>
</tr>
<tr>
<td rowspan="2" style="text-align: center;"><blockquote>
<p>destinataire</p>
</blockquote></td>
<td style="text-align: center;"><blockquote>
<p>agent agent-name</p>
<p>altId</p>
</blockquote></td>
<td style="text-align: center;"><blockquote>
<p>reference string</p>
<p>token</p>
</blockquote></td>
<td style="text-align: center;"><blockquote>
<p>Les paramètres agent, agent-name et/ou altId peuvent être utilisés
pour identifier l’origine de la l’évènement</p>
</blockquote></td>
</tr>
<tr>
<td style="text-align: center;"><blockquote>
<p>agent-role</p>
</blockquote></td>
<td style="text-align: center;"><blockquote>
<p>token</p>
</blockquote></td>
<td style="text-align: center;"><blockquote>
<p>agent-role aura pour valeur le code utilisé pour indiquer que l’agent
est le destinataire de l’évènement</p>
</blockquote></td>
</tr>
<tr>
<td style="text-align: center;"><blockquote>
<p>autreParametre</p>
</blockquote></td>
<td colspan="3" style="text-align: center;"><blockquote>
<p>Chaque concrétisation de ses spécifications génériques peut ajouter
des paramètres de recherche. HL7 FHIR en définit8, d’autres paramètres
peuvent être définis par profilage.</p>
</blockquote></td>
</tr>
</tbody>
</table>

### Construction du flux HTTP

Dans le contexte d’une implémentation reposant sur le protocole Syslog
pour le flux de transmission des traces, le flux 4 « RechercheTraces »
est construit selon les exigences de la transaction IHE ITI-82
>
« Retrieve Syslog Event ». Cette transaction est une requête HTTP GET.
>
8
[<u>https://www.hl7.org/fhir/auditevent.html#search</u>](https://www.hl7.org/fhir/auditevent.html#search)
>
Les paramètres de recherche possibles sont ceux définis dans le cadre
technique IHE ; ils font référence aux champs de l’en-tête syslog.
>
L’URL suivante est utilisée :
>
GET
\[base\]/syslogsearch?date=le\[start-time\]&date=ge\[stoptime\]&\<query\>
>
Où \[base\] est le point de contact FHIR du gestionnaire de traces,
\[start-time\] et \[stop-time\] indique l’intervalle de temps dans
lequel les traces sont recherchées (date se réfère à la date
d’enregistrement de l’évènement). \<query\représente les autres
paramètres, sous la forme param=valeur, permettant d’affiner la
recherche.

#### Paramètres de recherche

La transaction \[ITI-82\] Retrieve Syslog Event exige que la recherche
de traces soit bornée dans le temps. C’est-à-dire que le paramètre de
recherche « date » qui correspond à la date d’enregistrement de
l’évènement doit être présent pour préciser une limite de temps
(avant, après ou un intervalle). Le tableau ci-dessous précise la mise
en correspondance des paramètres de recherche identifiés dans l’étude
métier avec les paramètres de recherche défini par IHE.
>
Le tableau ci-dessous propose des critères de recherche
supplémentaires dans le cas où la trace est véhiculé au format DICOM
AuditMessage. Dans le cas où la concrétisation de ce volet utilise un
autre format de trace, ce tableau devra être revu.

<table style="width:99%;">
<colgroup>
<col style="width: 19%" />
<col style="width: 19%" />
<col style="width: 19%" />
<col style="width: 40%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;"><blockquote>
<p>Critère de recherche</p>
<p>« métier »</p>
</blockquote></th>
<th style="text-align: center;"><blockquote>
<p>Nom du paramètre</p>
</blockquote></th>
<th style="text-align: center;"><blockquote>
<p>Type de donnée</p>
</blockquote></th>
<th><blockquote>
<p>Description</p>
</blockquote></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: center;"><blockquote>
<p>typeEvenement</p>
</blockquote></td>
<td style="text-align: center;"><blockquote>
<p>eventID</p>
</blockquote></td>
<td style="text-align: center;"><blockquote>
<p>texte</p>
</blockquote></td>
<td><blockquote>
<p>Type de l’évènement. Permet de filtrer sur le champ EventID</p>
</blockquote></td>
</tr>
<tr>
<td style="text-align: center;"><blockquote>
<p>sousTypeEvement</p>
</blockquote></td>
<td style="text-align: center;"><blockquote>
<p>EventTypeCode</p>
</blockquote></td>
<td style="text-align: center;"><blockquote>
<p>texte</p>
</blockquote></td>
<td><blockquote>
<p>Sous-type de l’évènement. Permet de filtrer sur le champ
EventTypeCode</p>
</blockquote></td>
</tr>
<tr>
<td style="text-align: center;"><blockquote>
<p>dateOccurence</p>
</blockquote></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td></td>
</tr>
<tr>
<td style="text-align: center;"><blockquote>
<p>dateDeclaration</p>
</blockquote></td>
<td style="text-align: center;"><blockquote>
<p>recorded</p>
</blockquote></td>
<td style="text-align: center;"><blockquote>
<p>dateTime</p>
</blockquote></td>
<td style="text-align: center;"><blockquote>
<p>Date à laquelle l’évènement a été enregistré</p>
</blockquote></td>
</tr>
<tr>
<td style="text-align: center;"><blockquote>
<p>origine</p>
</blockquote></td>
<td style="text-align: center;"><blockquote>
<p>Requestor</p>
</blockquote></td>
<td style="text-align: center;"><blockquote>
<p>texte</p>
</blockquote></td>
<td style="text-align: center;"><blockquote>
<p>Requestor identifie l’élément ActiveParticipant dont
UserIsRequestor=true et userID correspond à la valeur du paramètre.</p>
</blockquote></td>
</tr>
<tr>
<td style="text-align: center;"><blockquote>
<p>destinataire</p>
</blockquote></td>
<td style="text-align: center;"><blockquote>
<p>Receiver</p>
</blockquote></td>
<td style="text-align: center;"><blockquote>
<p>texte</p>
</blockquote></td>
<td style="text-align: center;"><blockquote>
<p>Requestor identifie l’élément ActiveParticipant dont
UserIsRequestor=false et userID correspond à la valeur du paramètre.</p>
</blockquote></td>
</tr>
<tr>
<td style="text-align: center;"><blockquote>
<p>autreParametre</p>
</blockquote></td>
<td colspan="3" style="text-align: center;"><blockquote>
<p>Chaque concrétisation de ses spécifications génériques peut ajouter
des paramètres de recherche.</p>
</blockquote></td>
</tr>
</tbody>
</table>

## Flux 5 : ReponseRechercheTraces

Ce flux véhicule le résultat de la recherche de traces.

### Construction du flux HL7 FHIR

Dans le contexte d’un échange basé sur le standard HL7 FHIR, ce flux
est basé sur les ressources FHIR Bundle, AuditEvent et
OperationOutcome (en cas d’erreur) telles qu’utilisées dans la
transaction IHE ITI-81 « Retrieve ATNA Audit Event ».
>
Conformément au supplément RESTful ATNA du profil IHE ATNA, la réponse
retournée par le Gestionnaire de trace au Consommateur de traces est
composée d’un Bundle (profil TDE_BundleResultatReponseRechercheTraces)
de type « searchset » encapsulant 0, 1 à plusieurs ressources
AuditEvent (profil TDE_AuditEvent).
>
La ressource Bundle constituera alors le corps de la réponse HTTP 200
ok. Un exemple de flux est joint (cf [<u>annexe
3</u>](#annexe-3-exemples-de-flux)).
>
Pour des informations sur les autres codes HTTP (HTTP status code)
retournés en cas d’échec, consultez la documentation relative à
l’interaction « read » de l’API REST FHIR.

### Construction du flux HTTP

Dans le contexte d’un échange basé sur la transaction IHE ITI-82, ce
flux est composé d’un code HTTP 200 ok et le corps de la réponse HTTP
est un tableau de messages Syslog au format demandé par le
consommateur de traces (JSON ou XML).
>
Pour des informations sur les autres codes HTTP (HTTP status code)
retournés en cas d’échec, consulter le cadre technique IHE, section
3.82.4.2.2.

# Disposition de sécurité

Les données véhiculées à travers les flux de ce volet générique
peuvent être des données à caractère personnel contenant notamment les
noms des patients et des professionnels.
>
Cette section présente les éventuelles recommandations de sécurité qui
s’appliquent au volet générique
>
« Traçabilité d’évènements ». Il s’agit d’un sous-ensemble lié à la
dimension interopérabilité de dispositions de sécurité plus globales
visant à couvrir les exigences de sécurité d’un système cible.
>
Il est du ressort du responsable de traitement du système cible de
mettre en œuvre des dispositions de sécurité adaptées à son analyse de
risques pour le service. En fonction de sa politique de sécurité, il
peut choisir ou pas de mettre en œuvre les dispositions spécifiques
décrites dans cette section. Les référentiels de sécurité édités par
l’ANS fournissent des recommandations sur ce sujet.

## Authentification et droit d’accès

Pas de disposition spécifique à ce volet.

## Confidentialité

Pas de disposition spécifique à ce volet.

## Intégrité

Pas de disposition spécifique à ce volet.

## Traçabilité

Pas de disposition spécifique à ce volet.

## Imputabilité

Pas de disposition spécifique à ce volet.

## Disponibilité

Pas de disposition spécifique à ce volet.

# Annexe 1 : Bilan de profilage des ressources FHIR

Cette section résume les modifications apportées aux spécifications de
base des ressources FHIR.
>
Le tableau ci-après liste l’ensemble des ressources FHIR utilisées
dans ce document et indique les modifications qui y ont été apportées.

<table style="width:97%;">
<colgroup>
<col style="width: 20%" />
<col style="width: 43%" />
<col style="width: 32%" />
</colgroup>
<thead>
<tr>
<th><blockquote>
<p>Nom de la ressource</p>
</blockquote></th>
<th><blockquote>
<p>Modifications apportées</p>
</blockquote></th>
<th><blockquote>
<p>Commentaires</p>
</blockquote></th>
</tr>
</thead>
<tbody>
<tr>
<td><blockquote>
<p>AuditEvent</p>
</blockquote></td>
<td><ul>
<li><p>Modifications de certaines cardinalités</p></li>
</ul></td>
<td></td>
</tr>
</tbody>
</table>

**Tableau 4 : Bilan de profilage des ressources FHIR**

# Annexe 2 : Ressource de conformité

Les ressources de conformité suivantes ont été créées et sont à
disposition des éditeurs sur l’espace de publication du CI-SIS sur
esante.gouv.fr :

- StructureDefinition pour le profil spécifique au volet « Traçabilité
  d’évènements »

<table style="width:100%;">
<colgroup>
<col style="width: 13%" />
<col style="width: 22%" />
<col style="width: 48%" />
<col style="width: 14%" />
</colgroup>
<thead>
<tr>
<th><blockquote>
<p><strong>Profil parent</strong></p>
</blockquote></th>
<th><blockquote>
<p><strong>Profil GDT</strong></p>
</blockquote></th>
<th><blockquote>
<p><strong>URL</strong></p>
</blockquote></th>
<th style="text-align: right;"><strong>Version</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td><blockquote>
<p>AuditEvent</p>
</blockquote></td>
<td><blockquote>
<p>TDE_AuditEvent</p>
</blockquote></td>
<td><blockquote>
<p><a href="http://esante.gouv.fr/ci-">http://esante.gouv.fr/ci-</a>
sis/fhir/StructureDefinition/TDE_AuditEvent</p>
</blockquote></td>
<td style="text-align: right;">1.0</td>
</tr>
<tr>
<td><blockquote>
<p>Bundle</p>
</blockquote></td>
<td style="text-align: left;"><blockquote>
<p>TDE_BundleResultatR eponseRechercheTrac es</p>
</blockquote></td>
<td><blockquote>
<p><a href="http://esante.gouv.fr/ci-">http://esante.gouv.fr/ci-</a>
sis/fhir/StructureDefinition/TDE_BundleResultatRepon seRechercheTraces
1.0</p>
</blockquote></td>
<td style="text-align: right;">1.0</td>
</tr>
</tbody>
</table>

##### Tableau 5 Profils FHIR créés dans le volet traçabilité d’évènements

- SearchParameter pour identifier les paramètres de recherche.

<table>
<colgroup>
<col style="width: 31%" />
<col style="width: 56%" />
<col style="width: 12%" />
</colgroup>
<thead>
<tr>
<th><blockquote>
<p><strong>Paramètre de recherche</strong></p>
</blockquote></th>
<th><blockquote>
<p><strong>URL</strong></p>
</blockquote></th>
<th><blockquote>
<p><strong>Version</strong></p>
</blockquote></th>
</tr>
</thead>
<tbody>
<tr>
<td><blockquote>
<p>TDE_AuditEvent_period-start</p>
</blockquote></td>
<td><blockquote>
<p><a href="http://esante.gouv.fr/ci-">http://esante.gouv.fr/ci-</a>
sis/fhir/SearchParameter/TDE_AuditEvent_period-start</p>
</blockquote></td>
<td><blockquote>
<p>1.0</p>
</blockquote></td>
</tr>
</tbody>
</table>

##### Tableau 6 : SearchParameter pour les paramètres de recherche créés dans le cadre de ce volet

- CapabilityStatement pour les acteurs identifiés dans l’étude métier du
  présent volet.

<table>
<colgroup>
<col style="width: 25%" />
<col style="width: 62%" />
<col style="width: 12%" />
</colgroup>
<thead>
<tr>
<th><blockquote>
<p><strong>Acteur</strong></p>
</blockquote></th>
<th><blockquote>
<p><strong>URL</strong></p>
</blockquote></th>
<th><blockquote>
<p><strong>Version</strong></p>
</blockquote></th>
</tr>
</thead>
<tbody>
<tr>
<td><blockquote>
<p>SourceDesTraces</p>
</blockquote></td>
<td><blockquote>
<p><a href="http://esante.gouv.fr/ci-">http://esante.gouv.fr/ci-</a>
sis/fhir/CapabilityStatements/TDE.SourceDesTraces</p>
</blockquote></td>
<td><blockquote>
<p>1.0</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>ConsommateurDesTraces</p>
</blockquote></td>
<td><blockquote>
<p><a href="http://esante.gouv.fr/ci-">http://esante.gouv.fr/ci-</a>
sis/fhir/CapabilityStatements/TDE.ConsommateurDesTraces</p>
</blockquote></td>
<td><blockquote>
<p>1.0</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>GestionnaireDeTrace</p>
</blockquote></td>
<td><blockquote>
<p><a
href="http://esante.gouv.fr/ci-sis/fhir/CapabilityStatements/TDE">http://esante.gouv.fr/ci-sis/fhir/CapabilityStatements/TDE.</a>
GestionnaireDeTrace</p>
</blockquote></td>
<td><blockquote>
<p>1.0</p>
</blockquote></td>
</tr>
</tbody>
</table>

##### Tableau 7 : CapabiltyStatements pour les acteurs définis dans ce volet

- ImplementationGuide

<table>
<colgroup>
<col style="width: 25%" />
<col style="width: 62%" />
<col style="width: 12%" />
</colgroup>
<thead>
<tr>
<th><blockquote>
<p><strong>Nom</strong></p>
</blockquote></th>
<th><blockquote>
<p><strong>URL</strong></p>
</blockquote></th>
<th><blockquote>
<p><strong>Version</strong></p>
</blockquote></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

<table>
<colgroup>
<col style="width: 25%" />
<col style="width: 62%" />
<col style="width: 12%" />
</colgroup>
<thead>
<tr>
<th><blockquote>
<p>TDE_Tracabilite-D- Evenements</p>
</blockquote></th>
<th><blockquote>
<p><a
href="http://esante.gouv.fr/ci-sis/fhir/ImplementationGuides/CI-">http://esante.gouv.fr/ci-sis/fhir/ImplementationGuides/CI-</a>
SIS.TracabiliteDEvenements</p>
</blockquote></th>
<th><blockquote>
<p>1.0</p>
</blockquote></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

***Tableau 8 : ImplementationGuide***

# Annexe 3 : Exemples de flux

Les exemples HL7 FHIR sont donnés en utilisant la syntaxe JSON et ne
présagent en rien de la syntaxe utilisée par les systèmes mettant en
œuvre ce volet.
>
Ci-joint des fichiers d’exemple :
>
POST http://base_url_server_gestionnaire_trace/AuditEvent

- **Flux 01 – Version Syslog** : TDE_Flux01-VersionSyslog.xml

GET
<http://hapi.fhir.org/baseR4/AuditEvent?type=rest&subtype=operation>

- **Flux 05 – Version HTTP** : TDE_Flux05-VersionHTT

# Annexe 4 : Glossaire

<table style="width:97%;">
<colgroup>
<col style="width: 21%" />
<col style="width: 75%" />
</colgroup>
<thead>
<tr>
<th><blockquote>
<p>Sigle / Acronyme</p>
</blockquote></th>
<th style="text-align: center;"><blockquote>
<p>Signification</p>
</blockquote></th>
</tr>
</thead>
<tbody>
<tr>
<td><blockquote>
<p>API</p>
</blockquote></td>
<td><blockquote>
<p>Application Programming Interface</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>ANS</p>
</blockquote></td>
<td><blockquote>
<p>Agence du Numérique en Santé</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>CI-SIS</p>
</blockquote></td>
<td><blockquote>
<p>Cadre d’Interopérabilité des Systèmes d’Information de Santé</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>FHIR</p>
</blockquote></td>
<td><blockquote>
<p>Fast Healthcare Interoperability Resources</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>HL7</p>
</blockquote></td>
<td><blockquote>
<p>Health Level 7</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>HTTP</p>
</blockquote></td>
<td><blockquote>
<p>HyperText Transfer Protocol</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>JDV</p>
</blockquote></td>
<td><blockquote>
<p>Jeu De valeurs</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>MOS</p>
</blockquote></td>
<td><blockquote>
<p>Modèle des Objets de Santé</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>NOS</p>
</blockquote></td>
<td><blockquote>
<p>Nomenclatures des Objets de Santé</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>JSON</p>
</blockquote></td>
<td><blockquote>
<p>JavaScript Object Notation</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>REST</p>
</blockquote></td>
<td><blockquote>
<p>Representational State Transfer</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>TRE</p>
</blockquote></td>
<td><blockquote>
<p>Terminologie de Référence</p>
</blockquote></td>
</tr>
</tbody>
</table>

# Annexe 5 : Documents de référence

1.  CI-SIS Etude Métier – Traçabilité d’évènements

2.  CI-SIS Etude normes et standards – Traçabilité d’évènements

# Annexe 6 : Historique du document

<table style="width:98%;">
<colgroup>
<col style="width: 9%" />
<col style="width: 14%" />
<col style="width: 3%" />
<col style="width: 11%" />
<col style="width: 4%" />
<col style="width: 10%" />
<col style="width: 3%" />
<col style="width: 11%" />
<col style="width: 2%" />
<col style="width: 12%" />
<col style="width: 1%" />
<col style="width: 13%" />
</colgroup>
<thead>
<tr>
<th><blockquote>
<p><strong>Version</strong></p>
</blockquote></th>
<th colspan="4" style="text-align: center;"><blockquote>
<p><strong>Rédigé par</strong></p>
</blockquote></th>
<th colspan="4"><blockquote>
<p><strong>Vérifié par</strong></p>
</blockquote></th>
<th colspan="3"><blockquote>
<p><strong>Validé par</strong></p>
</blockquote></th>
</tr>
</thead>
<tbody>
<tr>
<td rowspan="2"><blockquote>
<p>1.0.C</p>
</blockquote></td>
<td colspan="2"><blockquote>
<p>ANS</p>
</blockquote></td>
<td colspan="2"><blockquote>
<p>15/03/2021</p>
</blockquote></td>
<td colspan="2"></td>
<td colspan="2"></td>
<td colspan="2"></td>
<td></td>
</tr>
<tr>
<td colspan="11"><blockquote>
<p>Motif et nature de la modification : <strong>Première version pour
concertation publique</strong></p>
</blockquote></td>
</tr>
<tr>
<td rowspan="2"><blockquote>
<p>1.0</p>
</blockquote></td>
<td colspan="2"><blockquote>
<p>ANS</p>
</blockquote></td>
<td colspan="2"><blockquote>
<p>14/06/2021</p>
</blockquote></td>
<td colspan="2"></td>
<td colspan="2"></td>
<td colspan="2"></td>
<td></td>
</tr>
<tr>
<td colspan="11"><blockquote>
<p>Motif et nature de la modification : <strong>Finalisation de la
première version du document</strong></p>
</blockquote></td>
</tr>
<tr>
<td rowspan="2"><blockquote>
<p>1.1</p>
</blockquote></td>
<td colspan="2"></td>
<td colspan="2"></td>
<td colspan="2"></td>
<td colspan="2"></td>
<td colspan="2"><blockquote>
<p><strong>ANS</strong></p>
</blockquote></td>
<td><blockquote>
<p>Le 01/04/2022</p>
</blockquote></td>
</tr>
<tr>
<td colspan="11"><blockquote>
<p>Motif et nature de la modification : <strong>Intégration CP
CP-2022_01-MAJ_Volets_FHIR-V1.0</strong></p>
</blockquote>
<ul>
<li><p>Création du profil TDE_AuditEvent</p></li>
<li><p>Création du paramètre de recherche
TDE_AuditEvent_period-start</p></li>
<li><p>Renommage du volet en « Traçabilité d’évènements »</p></li>
</ul></td>
</tr>
<tr>
<td rowspan="2"><blockquote>
<p>1.2</p>
</blockquote></td>
<td><blockquote>
<p>ANS</p>
</blockquote></td>
<td colspan="2"><blockquote>
<p>28/11/2022</p>
</blockquote></td>
<td colspan="2"><blockquote>
<p>ANS</p>
</blockquote></td>
<td colspan="2"><blockquote>
<p>28/11/2022</p>
</blockquote></td>
<td colspan="2"><blockquote>
<p>ANS</p>
</blockquote></td>
<td colspan="2"><blockquote>
<p>28/11/2022</p>
</blockquote></td>
</tr>
<tr>
<td colspan="11"><blockquote>
<p>Motif et nature de la modification :</p>
</blockquote>
<ul>
<li><p>Changement du le profil « TDE_AuditEvent » : modification de la
cardinalité de l’élément « subtype</p></li>
</ul>
<blockquote>
<p>» à [0..1].</p>
</blockquote>
<ul>
<li><p>Pour le critère de recherche « dateDeclaration », changement du
nom du paramètre en « recorded</p></li>
</ul>
<blockquote>
<p>».</p>
</blockquote>
<ul>
<li><p>Changement du type de données en « dateTime » pour les critères
de recherche sur les dates.</p></li>
<li><p>Ajout à la liste des ressources profilée :
TDE_BundleResultatReponseRechercheTraces</p></li>
<li><p>Précision sur le type du bundle et la cardinalité des entrées
dans le flux de réponse à la recherche de trace</p></li>
<li><p>ObjectEvenement</p>
<ul>
<li><p>Suppression des identifiants : L’objet Trace possède un
identifiant et c’est suffisant. Une trace est composée de plusieurs
object qu’il n’est pas nécessaire d’identifier unitairement.</p></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>
