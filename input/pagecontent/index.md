<p style="padding: 5px; border-radius: 5px; border: 2px solid maroon; background: #ffffe6; width: 65%">
<b>Brief description of this Implementation Guide</b><br>
[Add a brief description of this IG in English]
</p>

{% if site.data.info.releaselabel == 'ci-build' %}
<div style="width: 65%">
    <blockquote class="stu-note">
    <p>Cet Implementation Guide n'est pas la version courante, il s'agit de la version en intégration continue soumise à des changements fréquents uniquement destinée à suivre les travaux en cours. La version courante sera accessible via l'URL canonique suite à la première release : http://interop.esante.gouv.fr/ig/fhir/[code - ig]</p>
    </blockquote>
</div>
{% endif %}


{% if site.data.info.releaselabel == 'public-comment' %}
<div style="width: 65%">
<blockquote class="stu-note">
<p>
  <b>Attention !</b>
  <br>
 Cet Implementation Guide est actuellement en concertation. La version courante est accessible à l'adresse : http://interop.esante.gouv.fr/ig/fhir/[code - ig]
</p>
</blockquote>
</div>
{% endif %}


<div class="figure">
    <img src="ci-sis-logo.png" alt="CI-SIS" title="Logo du CI-SIS" style="width:100%;">
</div>

### Introduction
Ce guide d'implémentation présente une spécification générique des
échanges pour la gestion des traces.

Les traces sont l’ensemble des informations enregistrées relatant les
actions entreprises par un système en conséquence d’un événement. Les
informations peuvent aussi bien porter sur des dispositifs physiques,
comme par exemple un dispositif médical implantable (changement de lieu,
mise à jour du statut), que sur des actions utilisateurs (connexion à un
système, création d'un utilisateur). Dans le cadre de cette étude, les
processus qui sont à l'origine des traces sont hors périmètre.

### Périmètre du projet

Définir en quelques lignes en anglais quel est le périmètre du projet

Toujours laisser l'onglet "Ressources de conformité" pour s'assurer d'une cohérence globales entre tous les IGs

#### Lectorat cible

Les lecteurs cibles sont principalement des chefs de projets ainsi que
toute personne concernée par la maitrise d’ouvrage et qui spécifie des
projets avec des interfaces interopérables.

### Standards utilisés

Les données véhiculées dans ce volet ainsi que les interactions entre les systèmes reposent sur le standard HL7 FHIR Release 4.

Les interactions font référence à un certain nombre de ressources du standard ainsi qu’aux spécifications de l’API REST FHIR, basées sur le protocole HTTP dans sa version sécurisée HTTPS. Les syntaxes retenues sont la syntaxe XML et JSON.

#### Ressources FHIR profilées

Les ressources profilées dans le cadre de ce guide d'implémentation sont les suivantes : 

{% sql { 
  "query" : " 
    SELECT json_extract(Json, '$.baseDefinition') as Parent, Name, Description, Web 
    FROM Resources 
    WHERE Type = 'StructureDefinition' 
      AND Id LIKE 'TDE%' 
      AND json_extract(Json, '$.kind') = 'resource' 
    ORDER BY Name 
  ", 
  "class" : "lines", 
  "columns" : [ 
    { "title" : "Profil parent", "source" : "Parent" }, 
    { "title" : "Profil", "type" : "link", "source" : "Name", "target" : "Web" }, 
    { "title" : "Description", "type" : "markdown", "source" : "Description" } 
  ] 
} %}


### Dépendances

{% include dependency-table.xhtml %}

### Propriété intellectuelle

{% include ip-statements.xhtml %}
