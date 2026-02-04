### Organisation du contexte métier

Le domaine « Traçabilité » regroupe les groupes de processus qui décrivent la gestion des informations de traçabilité, informations qu'un système enregistre à chaque action qui lui est associée. Dans le cadre de la présente étude, ce domaine est constitué d'un unique groupe de processus « Gestion des traces ».

<div style="text-align: center; display: block; clear: both;">
<img src="sfe_image4.png"
style="width:5.42708in;height:3.42708in" />
</div>
<div style="text-align: center; display: block; clear: both;">
Figure : Organisation du contexte métier de l'étude "Gestion des traces"
</div>

Le périmètre de l'étude englobe les processus en couleur sur le diagramme de paquetage.

#### Gestion des traces

Le groupe de processus « Gestion des traces » regroupe les processus qui permettent de gérer les traces produites lors de la vie d'un produit :
- Créer des traces ;
- Consulter une trace ;
- Recherches des traces.

A noter que la gestion consiste en la création des traces et leur consultation. La suppression des traces ne fait pas partie du périmètre de l'étude.

<span id="_Toc77062398" class="anchor"></span>

### Définition des processus collaboratifs

#### Cas d'utilisations

##### Processus collaboratif "Créer des traces"
<div style="text-align: center; display: block; clear: both;">
<img src="sfe_image5.png" style="width:6.25in;height:1.04167in" />

</div>
<div style="text-align: center; display: block; clear: both;">
Figure : Processus collaboratif "Créer des traces"
</div>

<table>
<colgroup>
<col style="width: 20%" />
<col style="width: 79%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;">Service attendu</th>
<th style="text-align: left;">Ce processus permet de créer des traces. Cette traçabilité se déclenche à chaque fois qu'une étape significative dans un processus métier est réalisée. Les catégories d'évènements qui peuvent déclencher le processus de traçabilité sont par exemple :<br />
- Un changement de statut,<br />
- Un changement de lieu,<br />
- Une action réalisée.<br />
Les informations à tracer sont fonction du processus métier dont on souhaite faire le suivi.<br />
La finalité de la traçabilité est de pouvoir proposer des pistes d'audit en cas d'enquête.</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: center;">Pré-conditions</td>
<td style="text-align: left;">La source des traces est habilitée à enregistrer des traces auprès du gestionnaire des traces.</td>
</tr>
<tr>
<td style="text-align: center;">Post-conditions</td>
<td style="text-align: left;">N/A</td>
</tr>
<tr>
<td style="text-align: center;">Contraintes fonctionnelles</td>
<td style="text-align: left;">N/A</td>
</tr>
<tr>
<td style="text-align: center;">Scénario nominal</td>
<td style="text-align: left;">1 - La source des traces transmet les informations au gestionnaire de traces.<br />
2 - Le gestionnaire des traces confirme ou non l'enregistrement des traces.</td>
</tr>
</tbody>
</table>
<div style="text-align: center; display: block; clear: both;">
Table : Caractéristiques du processus collaboratif
</div>

<span id="_Toc77062401" class="anchor"></span>

##### Processus collaboratif "Consulter une trace"
<div style="text-align: center; display: block; clear: both;">
<img src="sfe_image6.png" style="width:6.25in;height:0.96875in" />

</div>
<div style="text-align: center; display: block; clear: both;">
Figure : Processus collaboratif "Consulter une trace"
</div>

<table>
<colgroup>
<col style="width: 24%" />
<col style="width: 75%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;">Service attendu</th>
<th style="text-align: left;">Ce processus permet de consulter le détail d'une trace.</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: center;">Pré-conditions</td>
<td style="text-align: left;">Le consommateur des traces est habilité à consulter des traces auprès du gestionnaire des traces.</td>
</tr>
<tr>
<td style="text-align: center;">Post-conditions</td>
<td style="text-align: left;">N/A</td>
</tr>
<tr>
<td style="text-align: center;">Contraintes fonctionnelles</td>
<td style="text-align: left;">N/A</td>
</tr>
<tr>
<td style="text-align: center;">Scénario nominal</td>
<td style="text-align: left;">1 - Le consommateur des traces effectue une demande de consultation d'une trace auprès du gestionnaire des traces.<br />
2 - Le gestionnaire des traces renvoie le détail de la trace au consommateur des traces.</td>
</tr>
</tbody>
</table>
<div style="text-align: center; display: block; clear: both;">

Table : Caractéristiques du processus collaboratif
</div>
<span id="_Toc77062402" class="anchor"></span>

##### Processus collaboratif "Rechercher des traces"

<div style="text-align: center; display: block; clear: both;">
<img src="sfe_image7.png" style="width:6.25in;height:0.9375in" />

</div>
<div style="text-align: center; display: block; clear: both;">

Figure  : Processus collaboratif "Rechercher des traces"
</div>
<table>
<colgroup>
<col style="width: 25%" />
<col style="width: 74%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;">Service attendu</th>
<th style="text-align: left;">Ce processus permet de rechercher une liste de traces répondant aux critères de recherche.</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: center;">Pré-conditions</td>
<td style="text-align: left;">Le consommateur des traces est habilité à rechercher des traces auprès du gestionnaire des traces.</td>
</tr>
<tr>
<td style="text-align: center;">Post-conditions</td>
<td style="text-align: left;">N/A</td>
</tr>
<tr>
<td style="text-align: center;">Contraintes fonctionnelles</td>
<td style="text-align: left;">N/A</td>
</tr>
<tr>
<td style="text-align: center;">Scénario nominal</td>
<td style="text-align: left;">1 - Le consommateur des traces effectue une recherche de traces auprès du gestionnaire des traces.<br />
2 - Le gestionnaire des traces renvoie la liste des traces répondant aux critères de recherche.</td>
</tr>
</tbody>
</table>

<div style="text-align: center; display: block; clear: both;">
Table : Caractéristiques du processus collaboratif
</div>

#### Liste des acteurs pour l'ensemble des processus

<table>
<colgroup>
<col style="width: 20%" />
<col style="width: 79%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;">Acteur</th>
<th style="text-align: center;">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">Consommateur des traces</td>
<td style="text-align: left;">Il s'agit d'un acteur système interne ou externe habilité à accéder aux traces. Les personnes utilisant ce système peuvent être rattachées par exemple à la pharmacie hospitalière (traçabilité des médicaments), au bloc opératoire (traçabilité des actes chirurgicaux), à la sécurité (traçabilité de sécurité).</td>
</tr>
<tr>
<td style="text-align: left;">Gestionnaire des traces</td>
<td style="text-align: left;">Il s'agit d'un acteur système qui enregistre les informations de traçabilité et fournit les traces en cas de consultation ou de recherches. Le gestionnaire des traces peut être, par exemple, un logiciel de traçabilité ou le module de traçabilité d'un logiciel métier.</td>
</tr>
<tr>
<td style="text-align: left;">Source des traces</td>
<td style="text-align: left;">Il s'agit d'un acteur système qui transmet les informations de traçabilité relatives à une étape significative d'un processus métier suite à un événement au gestionnaire.</td>
</tr>
</tbody>
</table>

<div style="text-align: center; display: block; clear: both;">
Table : Table des acteurs
</div>

### Description des processus collaboratifs et identification des flux

#### Créer des traces
<div style="text-align: center; display: block; clear: both;">
<img src="sfe_image8.png" style="width:6.77222in;height:2.725in" />

</div>

<div style="text-align: center; display: block; clear: both;">
Figure : Processus collaboratif "Créer des traces"
</div>

##### Description des actions

| Action | Description |
|:---|:---|
| Créer des traces | Envoyer les informations de traçabilité de la source au gestionnaire des traces. |
| Recevoir et enregistrer les traces | Recevoir et enregistrer les informations de traçabilité. |

<div style="text-align: center; display: block; clear: both;">
Table : Tableau des actions
</div>

##### Identification des flux

| Flux | Processus | Emetteur | Récepteur | Périmètre |
|:---|:---|:---|:---|:---|
| Flux 1 : TransmissionTrace | Créer des traces | Source des traces | Gestionnaire des traces | Oui |
| Flux 1bis : RetourTransmissionTrace | Créer des traces | Gestionnaire des traces | Source des traces | Flux technique hors étude |

<div style="text-align: center; display: block; clear: both;">
Table : Flux
</div>

<span id="_Toc77062408" class="anchor"></span>

#### Consulter une trace
<div style="text-align: center; display: block; clear: both;">
<img src="sfe_image9.png"
style="width:5.76573in;height:3.79026in" />

</div>

<div style="text-align: center; display: block; clear: both;">
Figure  : Processus collaboratif "Consulter une trace"
</div>

##### Description des actions

| Action | Description |
|:---|:---|
| Demander à consulter une trace | Le consommateur des traces demande à consulter une trace. |
| Consulter la réponse | Le consommateur des traces reçoit et traite le retour du gestionnaire des traces. |
| Réceptionner la demande | Le gestionnaire réceptionne la demande de consultation d'une trace. |
| Fournir la trace | Le gestionnaire des traces fournit la trace demandée. |

<div style="text-align: center; display: block; clear: both;">
Table : Tableau des actions
</div>

##### Identification des flux

| Flux | Processus | Emetteur | Récepteur | Périmètre |
|:---|:---|:---|:---|:---|
| Flux 2 : ConsultationTrace | Consulter une trace | Consommateur des traces | Gestionnaire des traces | Oui |
| Flux 3 : ReponseConsultationTrace | Consulter une trace | Gestionnaire des traces | Consommateur des traces | Oui |

<div style="text-align: center; display: block; clear: both;">
Table : Flux
</div>

#### Rechercher des traces
<div style="text-align: center; display: block; clear: both;">
<img src="sfe_image10.png" style="width:5.253in;height:3.28431in" />

</div>

<div style="text-align: center; display: block; clear: both;">
Figure : Processus collaboratif "Rechercher des traces"
</div>

##### Description des actions

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;">Action</th>
<th style="text-align: center;">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">Rechercher des traces</td>
<td style="text-align: left;">Le consommateur des traces effectue une recherche de traces auprès du gestionnaire des traces en précisant les critères de sa recherche.</td>
</tr>
<tr>
<td style="text-align: left;">Consulter la réponse</td>
<td style="text-align: left;">Le consommateur des traces consulte les traces retournées par le gestionnaire des traces.</td>
</tr>
<tr>
<td style="text-align: left;">Réceptionner la recherche</td>
<td style="text-align: left;">Le gestionnaire des traces reçoit les critères de recherches.</td>
</tr>
<tr>
<td style="text-align: left;">Rechercher et fournir les traces</td>
<td style="text-align: left;">Les traces sont recherchées par le gestionnaire des traces selon les critères définis par le consommateur des traces. Les traces trouvées sont ensuite retournées au consommateur.</td>
</tr>
</tbody>
</table>

<div style="text-align: center; display: block; clear: both;">
Table : Tableau des actions
</div>

##### Identification des flux

| Flux | Processus | Emetteur | Récepteur | Périmètre |
|:---|:---|:---|:---|:---|
| Flux 4 : RechercheTraces | Rechercher des traces | Consommateur des traces | Gestionnaire des traces | Oui |
| Flux 5 : ReponseRechercheTraces | Rechercher des traces | Gestionnaire des traces | Consommateur des traces | Oui |

<div style="text-align: center; display: block; clear: both;">
Table : Flux
</div>

#### Synthèse des flux

| Flux | Processus | Emetteur | Récepteur | Périmètre |
|:---|:---|:---|:---|:---|
| Flux 1 : TransmissionTrace | Créer des traces | Source des traces | Gestionnaire des traces | Oui |
| Flux 1bis : RetourTransmissionTrace | Créer des traces | Gestionnaire des traces | Source des traces | Flux technique hors étude |
| Flux 2 : ConsultationTrace | Consulter une trace | Consommateur des traces | Gestionnaire des traces | Oui |
| Flux 3 : ReponseConsultationTrace | Consulter une trace | Gestionnaire des traces | Consommateur des traces | Oui |
| Flux 4 : RechercheTraces | Rechercher des traces | Consommateur des traces | Gestionnaire des traces | Oui |
| Flux 5 : ReponseRechercheTraces | Rechercher des traces | Gestionnaire des traces | Consommateur des traces | Oui |

<div style="text-align: center; display: block; clear: both;">
Table : Synthèse des flux identifiés
</div>

###  Identification des concepts véhiculés dans les flux d'informations et correspondance avec les classes et attributs du MOS

#### Concepts métier - Factorisation par concept

<table style="width:100%;">
<colgroup>
<col style="width: 16%" />
<col style="width: 52%" />
<col style="width: 30%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;">Nom</th>
<th style="text-align: center;">Description</th>
<th style="text-align: center;">Flux</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">Trace</td>
<td style="text-align: left;">Ensemble des informations enregistrées relatant les actions entreprises par un système en conséquence d'un événement.</td>
<td style="text-align: left;"><p>Flux 1 - TransmissionTrace</p>
<p>Flux 2 - ConsultationTrace</p>
<p>Flux 3 - ReponseConsultationTrace</p></td>
</tr>
<tr>
<td style="text-align: left;">Source</td>
<td style="text-align: left;">Système qui transmet les informations de traçabilité relatives à une étape significative d'un processus métier.</td>
<td style="text-align: left;"><p>Flux 1 - TransmissionTrace</p>
<p>Flux 3 - ReponseConsultationTrace</p></td>
</tr>
<tr>
<td style="text-align: left;">Evènement</td>
<td style="text-align: left;">Fait marquant relatif à un objet, une personne, un processus, etc</td>
<td style="text-align: left;"><p>Flux 1 - TransmissionTrace</p>
<p>Flux 3 - ReponseConsultationTrace</p></td>
</tr>
<tr>
<td style="text-align: left;">Acteurs de l'évènement</td>
<td style="text-align: left;">Acteurs liés à l'évènement. Il peut s'agir d'une personne (physique ou morale) ou d'un système à l'origine de l'évènement (émetteur) ou destinataire de l'évènement (récepteur).</td>
<td style="text-align: left;"><p>Flux 1 - TransmissionTrace</p>
<p>Flux 3 - ReponseConsultationTrace</p></td>
</tr>
<tr>
<td style="text-align: left;">Objet de l'évènement</td>
<td style="text-align: left;">Tout objet impacté par un évènement qui doit être tracé. Le contenu correspond aux informations associées à l'évènement envoyées au gestionnaire de traces et qui doivent être conservées</td>
<td style="text-align: left;"><p>Flux 1 - TransmissionTrace</p>
<p>Flux 3 - ReponseConsultationTrace</p></td>
</tr>
</tbody>
</table>

<div style="text-align: center; display: block; clear: both;">
Table : Concepts métier
</div>

<span id="_Toc77062418" class="anchor"></span>

#### Mise en équivalence MOS

| Concept métier         | Extension | Restriction | Equivalence | Concept MOS |
|:-----------------------|-----------|-------------|-------------|-------------|
| Trace                  |           |             |             |             |
| Source                 |           |             |             |             |
| Evènement              | X         |             |             | Evenement   |
| Acteurs de l'évènement |           |             |             |             |
| Objet de l'évènement   |           |             |             |             |

<div style="text-align: center; display: block; clear: both;">
Table : Mise en équivalence MOS
</div>

### Modélisation des flux d'informations

#### Flux 1 - TransmissionTrace
<div style="text-align: center; display: block; clear: both;">
<img src="sfe_image11.png"
style="width:6.71871in;height:2.00233in" />

</div>

<div style="text-align: center; display: block; clear: both;">
Figure : Flux 1 - TransmissionTrace
</div>

##### Classe "Trace"

Ensemble d'informations qu'un système enregistre à chaque action qui lui est associé.

| Nom                                | Description              |
|:-----------------------------------|--------------------------|
| identifiant : \[0..1\] Identifiant | Identifiant de la trace. |

<div style="text-align: center; display: block; clear: both;">
Table : Attributs de la classe "Trace"
</div>

##### Classe "SourceTrace"

Système ayant émis la trace de l'évènement.

| Nom                                | Description                           |
|:-----------------------------------|---------------------------------------|
| identifiant : \[0..1\] Identifiant | Identifiant de la source de la trace. |

<div style="text-align: center; display: block; clear: both;">
Table : Attributs de la classe "SourceTrace"
</div>

<span id="_Toc77062426" class="anchor"></span>

##### Classe "Evenement"

Fait marquant relatif à un objet, une personne, un processus, etc

| Nom | Description |
|:---|----|
| typeEvenement : \[0..1\] Code | Code spécifiant le type de l'évènement. |
| sousTypeEvenement : \[0..1\] Code | Code spécifiant le sous type de l'évènement |
| occurence : \[0..1\] DateHeure | Date/heure à laquelle l'évènement est arrivé. |
| declaration : \[0..1\] DateHeure | Date/heure à laquelle l'évènement est déclaré. |
| description : \[0..1\] Texte | Description textuelle de l'évènement. |

<div style="text-align: center; display: block; clear: both;">
Table : Attributs de la classe "Evenement"
</div>

##### Classe "ActeurEvenement"

Représente un acteur de l'évènement. De manière générale, il y aura un acteur émetteur, à l'origine de l'évènement et un acteur destinataire de l'évènement.

| Nom | Description |
|:---|----|
| identifiant : \[1..1\] Identifiant | Identifiant de l'acteur de l'évènement. |
| role : \[1..1\] Code | Rôle de l'acteur de l'évènement |

<div style="text-align: center; display: block; clear: both;">
Table : Attributs de la classe "ActeurEvenement"
</div>

##### Classe "ObjetEvenement"

Détaille l'objet de l'évènement : tout objet impacté par un évènement qui doit être tracé.

| Nom | Description |
|:---|----|
| identifiant : \[0..1\] Identifiant | Identifiant de l'objet de l'évènement. |
| type : \[0..1\] Code | Type d'objet de l'évènement. |
| contenu : \[0..1\] ObjetBinaire | Le contenu correspond aux informations associées à l'évènement envoyées au gestionnaire de traces et qui doivent être conservées. Par exemple, l'identifiant du document recherché. |

<div style="text-align: center; display: block; clear: both;">
Table : Attributs de la classe "ObjetEvenement"
</div>

#### Flux 2 - ConsultationTrace
<div style="text-align: center; display: block; clear: both;"><img src="sfe_image12.png"
style="width:4.33333in;height:0.69792in" />

</div>

<div style="text-align: center; display: block; clear: both;">
Figure : Flux 2 - ConsultationTrace
</div>

##### Classe "Trace"

Ensemble d'informations qu'un système enregistre à chaque action qui lui est associé.

| Nom                                | Description              |
|:-----------------------------------|--------------------------|
| identifiant : \[0..1\] Identifiant | Identifiant de la trace. |

<div style="text-align: center; display: block; clear: both;">
Table : Attributs de la classe "Trace"
</div>

#### Flux 3 - ReponseConsultationTrace

Le modèle du flux est identique au flux 1 à la différence que la consultation peut ne retourner aucune trace.

#### Flux 5 - ReponseRechercheTraces

Le modèle du flux est identique au flux 1 à la différence que la consultation peut ne retourner aucune source, une seule ou plusieurs.

#### Flux de recherche : Flux 4 - RechercheTraces

| Nom | Description | Obligatoire |
|:---|----|:---|
| Evenement/typeEvenement | Code spécifiant le type de l'évènement. | Non |
| Evenement/declaration | Date/heure à laquelle l'évènement est déclaré. | Non |
| Evenement/sousTypeEvenement | Code spécifiant le sous type de l'évènement | Non |
| Evenement/occurence | Date/heure à laquelle l'évènement est arrivé. | Non |
| ActeurEvenement/identifiant | Identifiant de l'acteur de l'évènement. | Non |
| ActeurEvenement/role | Rôle de l'acteur de l'évènement | Non |

<div style="text-align: center; display: block; clear: both;">
Table : Flux de recherche
</div>
