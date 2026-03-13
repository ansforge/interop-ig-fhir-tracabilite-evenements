# Volume 2 - Détail des transactions - ANS - Traçabilité des événements v2.0.0-ballot

* [**Table of Contents**](toc.md)
* **Volume 2 - Détail des transactions**

## Volume 2 - Détail des transactions

# Spécification Technique

## Standards utilisés

Ces spécifications techniques se basent sur le standard HL7 FHIR (R4) et sur le profil IHE ATNA et, plus particulièrement, le supplément RESTful ATNA. La version actuelle du profil ATNA se base sur les standards DICOM et syslog. Le supplément RESTful ATNA vise à ajouter des interfaces HL7 FHIR R4 aux acteurs impliqués dans ce profil.

Ces spécifications font référence :

* D'une part, à la ressource AuditEvent ainsi qu'aux spécifications de l'API REST FHIR ;
* D'autre part, au protocole et à la structure de messages syslog, éventuellement couplée à la structure de message d'audit définie par [DICOM](http://dicom.nema.org/dicom/2013/output/chtml/part15/sect_A.5.html).

La syntaxe utilisée pour les exemples HL7 FHIR de ces spécifications est la syntaxe JSON.

### Profil IHE utilisé

Le profil utilisé est le profil IHE ATNA qui offre les fonctionnalités suivantes :

* Enregistrement de traces dans un dépôt via la transaction ITI-20 
* Soit à l'aide du protocole Syslog (c'est-à-dire conforme à la RFC5424)
* Soit à l'aide de l'opération « Create » de l'API REST de FHIR ou au format HL7 FHIR (ressource FHIR AuditEvent) ;
 
* Recherche de traces basée sur le contenu des traces via la transaction ITI-81 (opération « Search » de l'API REST FHIR);
* Recherche de traces basées sur les métadonnées syslog via la transaction ITI-82 (Opération HTTP GET avec une URL paramétrique).

### Ressources FHIR utilisées

La principale ressource HL7 FHIR utilisée est la suivante :

* AuditEvent

Les ressources Practitioner et PractitionerRole peuvent aussi être utilisées, référencées par la ressource AuditEvent.

Le tableau ci-après spécifie les profils utilisés pour les ressources et types de données mentionnés dans ce document. Les présentes spécifications définissent également un profil propre au présent volet (préfixe TDE). Pour les ressources et types de données non mentionnés dans ce tableau, le profil à utiliser est celui défini par HL7 FHIR.

Les ressources profilées dans le cadre de ce guide d'implémentation sont les suivantes :

| | | |
| :--- | :--- | :--- |
| Profil parent | Profil | Description |
| [AuditEvent](http://hl7.org/fhir/StructureDefinition/AuditEvent) | [TDEAuditEvent](StructureDefinition-tde-auditevent.md) | Profil représentant la trace d'un évènement |
| [Bundle](http://hl7.org/fhir/StructureDefinition/Bundle) | [TDEBundleResultatReponseRechercheTraces](StructureDefinition-TDEBundleResultatReponseRechercheTraces.md) | Bundle de réponse à la recherche de traces |

## Utilisation

Les spécifications d'interopérabilité présentées dans ce volet ne présagent pas des conditions de leur mise en œuvre dans le cadre d'un système d'information partagé. Il appartient à tout responsable de traitement de s'assurer que les services utilisant ces spécifications respectent les cadres et bonnes pratiques applicables à ce genre de service (ex : cadre juridique, bonnes pratiques de sécurité, ergonomie, accessibilité …). Il est à noter que les contraintes de sécurité concernant les flux échangés ne sont pas traitées dans ce document. Celles-ci sont du ressort de chaque responsable de l'implémentation du mécanisme qui est dans l'obligation de se conformer au cadre juridique en la matière. L'ANS propose des référentiels dédiés à la politique de sécurité ([la PGSSI-S](https://esante.gouv.fr/securite/politique-generale-de-securite-des-systemes-d-information-de-sante)) et des mécanismes de sécurisation sont définis dans les volets de la [couche Transport](http://esante.gouv.fr/services/referentiels/ci-sis/espace-publication/couche-transport) du Cadre d'Interopérabilité des systèmes d'information de santé (CI-SIS).

