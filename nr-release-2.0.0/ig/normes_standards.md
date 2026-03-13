# Etude norme et standards - ANS - Traçabilité des événements v2.0.0-ballot

* [**Table of Contents**](toc.md)
* **Etude norme et standards**

## Etude norme et standards

### Introduction

Étude du 10/2016, avec dernière mise à jour en 02/2021; les conclusions de cette étude reflètent l'état de l'art disponible à cette date.

Ce document regroupe l'analyse des standards identifiés comme potentiellement adaptés pour la mise en œuvre, d'un point de vue « générique » de la tracabilité des événements [Étude métier – Gestion de traces](specifications_fonctionnelles.md):

* Le standard HL7 FHIR R4 (**Fast Healthcare Interoperability Resources**). Pour le besoin d'interopérabilité « tracabilité des événements », les ressources FHIR suivantes sont notamment analysées :
* Le profil IHE ATNA et son option RESTful ATNA ;
* Le profil IHE mACM / ACM ;
* Le profil IHE PLT ;
* Le profil IHE SOLE ;
* Le standard DICOM ;
* Le standard GS1 ;
* Le standard Syslog.

Après un rappel synthétique du contexte en section 2, pour chaque standard analysé sont présentés :

* Une description ;
* Sa maturité et adoption ;
* Des scénarios de mise en œuvre.

Un tableau de synthèse qui reprend ces éléments afin d'en faciliter la comparaison ainsi qu'une analyse métier et technique sont fournis en section 4 et 5.

A noter que cette étude se base sur le document [« Organismes et Standards »](http://esante.gouv.fr/services/referentiels/ci-sis/espace-publication/annexes-transverses) qui présente une description des organismes producteurs de standards ainsi que la manière dont ces standards sont gérés.

### Présentation synthétique

Cette étude s'insère dans le cadre du besoin « générique » d'interopérabilité « tracabilité des événements » pouvant être appliqué à différents contextes métier (gestion de la traçabilité de médicaments, de dispositifs médicaux, etc.). L'aspect « générique » est lié au fait que la fonctionnalité de « tracabilité des événements » peut être instanciée dans différents contextes, prenant en compte différents besoins fonctionnels métier.

Ce besoin d'interopérabilité concerne la mise en œuvre d'un mécanisme qui permet de gérer la traçabilité « d'objets métier » (médicaments, dispositifs médicaux, etc.) tout au long de leur cycle de vie. Par exemple, il s'agit de fournir un mécanisme de création et de consultation des traces associées à un dispositif médical implantable de sa dispensation à son implantation, en passant par sa commande, la réception dans la pharmacie d'un établissement de soin et son transfert dans l'unité de soin implantant ce dispositif. Les cas d'utilisation métier sont donc (cf. [l'étude métier](specifications_fonctionnelles.md)) :

* Créer des traces
* Consulter une trace
* Rechercher des traces

[l'étude métier](specifications_fonctionnelles.md) a été menée concernant la modélisation des flux entre acteurs/composants d'un système d'information ou entre systèmes d'information pour la mise en œuvre de la gestion de traces.

Les standards présentés dans ce document doivent gérer l'ensemble des flux métiers structurés et identifiés dans [l'étude métier](specifications_fonctionnelles.md) aussi bien dans un contexte de client lourd que dans un contexte de mobilité.

### Les standards

#### Le standard FHIR

##### Description

[FHIR](https://www.hl7.org/fhir/) (**Fast Healthcare Interoperability Resources**) est un standard élaboré par HL7 qui décrit un ensemble de formats de données et d'éléments (appelés ressources) ainsi qu'une API (**Application Programming Interface**) pour l'échange des informations de santé. Pour plus d'information, se référer au document [« Organismes et Standards »](http://esante.gouv.fr/services/referentiels/ci-sis/espace-publication/annexes-transverses).

##### Maturité et adoption

FHIR a défini et mis en œuvre un [modèle de maturité de ressources](http://wiki.hl7.org/index.php?title=FHIR_Maturity_Model) basé sur le [CMM (**Capability Maturity Model**)](http://www.selectbs.com/process-maturity/what-is-the-capability-maturity-model) afin de fournir aux développeurs une idée de la maturité d'une ressource avant son utilisation et son [implémentation](http://esante.gouv.fr/services/referentiels/ci-sis/espace-publication/annexes-transverses). D'une façon générale, le standard FHIR dans sa version R4 offre des ressources qui sont considérées comme stables (spécifiquement les ressources de niveau de maturité 4 et 5) et qui commencent actuellement à être utilisées dans des implémentations réelles. Les ressources suivantes ont atteint le niveau de maturité « normative », c'est-à-dire qu'elles sont stables :

* Niveau 1
* Niveau 2
* Niveau 3

##### Les ressources FHIR concernées

Une analyse des ressources FHIR «métier» pouvant être appliquées au contexte de la « gestion générique des traces » (voir section 6.1) montre que ce standard couvre la majorité des concepts identifiés dans l'étude « générique » métier. De nouveaux concepts seront sans doute ajoutés lors du deuxième niveau de « profilage » lié à l'instanciation d'une étude métier relative à un besoin métier spécifique. Dans ce cas, si FHIR est retenu comme le standard à utiliser, les informations non couvertes feront l'objet soit d'ajout de ressources existantes FHIR, soit d'extensions des ressources FHIR dans le cas où celles-ci sont adaptées pour mettre en œuvre les spécifications d'interopérabilité pour ce besoin pris en compte.

Ci-dessous une description succincte des ressources FHIR pouvant être utilisées pour la mise en œuvre des flux d'échanges entre un système d'information (SI) initiateur (« source des traces », « consommateur des traces ») et un serveur de gestion de traces (« gestionnaire des traces »). Un mapping de ces ressources avec les besoins métier est fourni dans la [synthèse](#synthèse).

* [**AdverseEvent (NM 0)** ](http://hl7.org/fhir/R4/adverseevent.html): (événement indésirable) cette ressource est utilisée pour décrire les données liées à un événement indésirable qui a ou pourrait avoir lieu lors d'un traitement d'un patient.

> Cette ressource permet de véhiculer les données de description de l'événement indésirable ainsi que ses données de traçabilités : identifiant métier, catégorie (comme par exemple « product-problem » ou « product-use-error »), le type de l'événement, la date effective de l'événement, la date de détection de l'événement, la date d'enregistrement de l'événement, le lieu, l'acteur enregistreur de l'événement, le contributeur, la référence du document relatif, etc. Cette ressource, bien qu'intéressante à prendre en compte pour spécifier de façon générique une trace d'audit, semble trop spécialisée.

* [**AuditEvent (NM 3)**](https://www.hl7.org/fhir/R4/auditevent.html) : (rapport d'évènement) cette ressource est principalement utilisée pour décrire les données liées à un événement de sécurité, en vue de maintenir un référentiel de traces de sécurité. Ce rapport d'évènement est basé sur la définition des enregistrements de sécurité décrit dans le profil IHE ATNA.

> Cette ressource permet de véhiculer les données de description d'un événement de sécurité ainsi que ses données de traçabilités : type et sous-type de l'événement, action réalisée pendant l'événement, date effective de l'événement, date d'enregistrement de l'événement, acteur impliqué dans l'événement, source de l'événement, etc. Cette ressource est intéressante à prendre en compte pour spécifier de façon générique une trace d'audit.

* [**Bundle (NM N)**](https://www.hl7.org/fhir/R4/bundle.html) : Dans le cas d'une interaction SEARCH, l'API RESTful de FHIR impose de retourner les résultats dans une ressource bundle. Cette ressource est ainsi utilisée pour regrouper des informations provenant de différentes ressources. Cette ressource permet l'existence indépendante de ces ressources qui peuvent être consultées directement en utilisant l'API RESTful de FHIR.
* [**Communication (NM 2)**](https://www.hl7.org/fhir/R4/communication.html) : cette ressource est utilisée pour décrire les informations échangées entre un émetteur et des récepteurs. Ces acteurs peuvent être des « patients », des « practitioners », des « organizations », des « devices » et des « related persons ».

> La ressource « Communication » est utilisée comme une des ressources « event » dans un workflow FHIR. Cette ressource pourrait donc être utilisée pour gérer les traces générées dans un workflow métier. Elle est à comparer aux ressources « AdverseEvent » et « AuditEvent ».

* [**CommunicationRequest (NM 2)**](https://www.hl7.org/fhir/communicationrequest.html) : cette ressource est utilisée pour demander une action de communication entre un émetteur et des récepteurs. Ces acteurs peuvent être des « patients », des « practitioners », des « organizations », des « devices » et des « related persons ». A la différence de la ressource « communication », cette ressource ne représente pas un flot de communication.

> Cette ressource pourrait être utilisée pour déclencher la génération d'une trace, qui sera ensuite concrétisée par l'utilisation de la ressource « communication ».

* [**EventDefinition (NM 0)**](https://www.hl7.org/fhir/R4/eventdefinition.html) : cette ressource est utilisée pour décrire la structure et les données « réutilisables » d'un événement. Cette ressource permet de décrire différents types d'événements. Elle permet de décrire aussi quand un événement particulier peut apparaître.

> Cette ressource permet de véhiculer les données de description d'un événement, ainsi que ses données de traçabilité : définition de l'événement (et le lien vers cette définition) et toutes les informations liées à la description de cet événement. Cette ressource pourrait être utilisée pour structurer la description d'un événement.

* [**SearchParameter (NM 3)**](http://hl7.org/fhir/R4/searchparameter.html) : Cette ressource est définie pour décrire les attributs d'un item de recherche qui peut ensuite être utilisé dans une recherche ou un filtre associé à une ressource.

> Cette ressource permet de décrire les paramètres d'une recherche : description du paramètre de recherche, URL de description du paramètre, les attributs associés au paramètre de recherche, les attributs de description de la recherche (type, expression, xpath, opérande), etc.

En conclusion, ces différentes ressources peuvent permettre de choisir les ressources « génériques » qui pourraient être utilisées pour spécifier techniquement et de façon « générique » la « gestion des traces ».

##### Les interactions FHIR

Le standard FHIR ne se limite pas à la description de ressources ; les interactions possibles entre les systèmes pour échanger et agir sur les ressources sont également décrites en termes d'API REST.

Différents niveaux d'interactions sont possibles :

* **Instance** (s'applique à une ressource en particulier)
* **Type** (s'applique à un ensemble de ressources de même type)
* **Système** (s'applique à l'ensemble du système)

Les interactions qui pourront s'appliquer dans le cas « générique » de la « tracabilité des événements » sont les suivantes :

* **Read** pour « consulter une trace ». Utilise la méthode HTTP GET.
* **Create** pour « créer une trace ». Utilise la méthode HTTP POST.
* **Search** pour « rechercher des traces ». Utilise la méthode HTTP GET.

Enfin, le corps des requêtes HTTP peut être formaté en XML, JSON ou RDF (seul le format TURTLE est supporté).

##### Synthèse

Plusieurs ressources FHIR ont été identifiées comme pouvant être utilisées pour aider à représenter les classes de [l'étude métier](specifications_fonctionnelles.md) : AdverseEvent, AuditEvent, Communication, CommunicationRequest, eventDefinition, SearchParameter.

Le tableau ci-dessous reprend les classes identifiées dans [l'étude métier](specifications_fonctionnelles.md) (en lignes) ainsi que chacune des ressources pertinentes étudiées dans ce document (en colonnes) de façon à vérifier l'adéquation des ressources FHIR avec le besoin métier. [L'annexe](annexe_audit_dicom.md) détaille la mise en correspondance entre les attributs de la classe « Evénement » et celles des ressources FHIR étudiées.

| | | | | | |
| :--- | :--- | :--- | :--- | :--- | :--- |
| Trace | identifiant | id | id | id | id |
| SourceTrace | identifiant | Identifier | source | Identifier | Identifier |
| Evénement | typeEvenement | Category | type | Category | Category |
| sousTypeEvement | Event | Subtype | topic |  | |
| occurence | Date | period.start |  | Occurrence.occurenceDateTime | |
| declaration | RecordedDate | recorded | Sent | authoredOn | |
| description | suspectEntity.causality | outcomeDesc | note | note | |
| ActeurEvenement | identifiant | contributor / recorder | agent.who.identifier | sender/ recipient | sender / recipient |
| role | Agent.role | | | | |
| ObjectEvenement | identifiant |  | entity.what.identifier |  |  |
| type |  | entity.type | reasonCode | reasonCode | |
| contenu | referenceDocument | entity.what ou entity.query ou entity.detail | Payload | Payload | |

Résumé des ressources FHIR

D'après ce tableau, nous pouvons voir :

* Que les ressources « AdverseEvent », « AuditEvent », « Communication » et « CommunicationRequest » pourraient être utilisées pour spécifier la ressource « générique trace »,

> A noter que la ressource « AdverseEvent » contient une référence obligatoire **subject** qui ne trouve pas son équivalent dans l'étude métier et que les ressources « Communication » et « CommunicationRequest » sont plutôt dédiées à l'échange d'information et non pas à la gestion d'événements.

Ce deuxième tableau présente le mapping entre les paramètres de recherche identifiés dans la spécification fonctionnelle et les critères de recherche relatifs à une ressource.

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| typeEvenement | Category | subtype | Category | Category |
| sousTypeEvenement | Event | subtype |   |   |
| occurence | Date |   |   | authored |
| declaration | RecordedDate | date | Sent | occurrence |
| acteurEvenement | Contributor / recorder | agent | Sender / Recipient | Sender / Recipient |
| Autres paramètres | **A prendre en compte en fonction du besoin métier** | **A prendre en compte en fonction du besoin métier** | **A prendre en compte en fonction du besoin métier** | **A prendre en compte en fonction du besoin métier** |

Mapping des critères de recherche

FHIR décrit également une API REST réutilisant les méthodes HTTP, celle-ci sera utilisée dans les scénarios ci-après pour permettre l'interaction entre les différents acteurs impliqués dans le cas d'usage « générique » de la « tracabilité des événements ».

##### Exemple de spécification du workflow générique

###### Créer des traces

Ce scénario décrit la demande de création d'une trace en utilisant la ressource « générique » « event » (qui peut être « AdverseEvent », « AuditEvent » ou « Communication » ; le choix n'est pas encore fait à cette étape d'analyse).

La figure ci-dessous illustre le scénario.

Ce scénario se décompose en deux flux :

* **Flux 01 « TransmissionTrace »** : L'acteur « source de traces » envoie par la méthode POST la demande de traitement de création d'une trace constituée d'une ressource générique (transaction) qui contient :
* **Le Flux 01bis « RetourTransmissionTrace »** : ce flux n'est pas considéré dans cette étude. Il n'est donc pas décrit.

###### Consulter une trace

Ce scénario décrit la demande de consultation d'une trace en utilisant la ressource « générique » « event » (qui peut être « AdverseEvent », « AuditEvent » ou « Communication » ; le choix n'est pas encore fait à cette étape d'analyse).

La figure ci-dessous illustre le scénario.

Ce scénario se décompose en deux flux :

* **Flux 02 « ConsultationTrace »** : L'acteur « consommateur de traces » envoie par la méthode GET une demande de consultation d'une trace, en passant l'identifiant de la trace en paramètre. Le paramètre d'interrogation est l'identifiant de la ressource « event » pour laquelle l'utilisateur recherche la « trace ».
* **Flux 03 « ReponseConsultationTrace »** : L'acteur « gestionnaire des traces » envoie une réponse HTTP OK (code 200) avec un corps de message présentant une ressource « event » qui contient le contenu de la trace correspondant à l'identifiant passé en paramètre.

###### Rechercher des traces

Ce scénario décrit la demande de recherche de traces en utilisant la ressource « générique » « event » (qui peut être « AdverseEvent », « AuditEvent » ou « Communication » ; le choix n'est pas encore fait à cette étape d'analyse).

La figure ci-dessous illustre le scénario.

Le scénario de recherche de traces est décomposé en deux flux :

* **Flux 04 « RechercheTraces »** : L'acteur « consommateur de traces » envoie par la méthode GET une demande de recherche de traces, en passant en paramètre les critères de recherche.
* **Flux 05 « ReponseRechercheTraces »** : L'acteur « gestionnaire de traces » envoie une réponse HTTP OK (code 200) avec un corps de message présentant, dans la ressource « bundle », la liste des traces répondant aux critères de recherche.

##### Conclusion

Le standard FHIR peut permettre de spécifier une gestion « générique » de traces. Néanmoins une analyse de profiles IHE et autres standards existants est nécessaire avant de prendre une décision définitive d'utiliser FHIR.

#### Les profils IHE ATNA et son option RESTful ATNA

Cette section décrit succinctement les profils IHE ATNA et son option RESTful ATNA.

##### Profil IHE ATNA

###### Description

Le profil [ATNA](https://www.ihe.net/uploadedFiles/Documents/ITI/IHE_ITI_TF_Vol1.pdf) « Audit Trail and Node Authentication » spécifie les caractéristiques d'un nœud sécurisé (« Secure Node ») déployé dans un système d'information de santé. Ce profil a été spécifié avec la possibilité de l'étendre avec des spécificités de domaines métier sous forme d'option. C'est par exemple le cas avec l'option « Radiology Audit Trail Option » et le profil IHE SOLE (« Standardized Operational Logs and Events », cf. chapitre 3.5). Le profil ATNA définit quatre acteurs « Audit Record Repository », « Audit Record Forwarder », « Secure Node », « Secure Application » et deux transactions « Authenticate Node [ITI-19] » et « Record Audit Event [ITI-20] ». ATNA spécifie des composants, briques de base d'un système de sécurité et de protection de la vie privée :

* « Node Authentication »
* « Access Control »
* « Event Logging 'Audit) »
* « Secure Communications »

La transaction « Authenticate Node [ITI-19] » décrit l'authentification mutuelle de nœuds sécurisés ; ce n'est pas le sujet principal de cette analyse de normes et standards.

La transaction « Record Audit Event [ITI-20] » décrit comment un nœud sécurisé crée un rapport d'évènement et le transmet à l'acteur « Audit Record Repository ». Cette transaction est basée sur un certain nombre de standards sous-jacents comme TLS, DICOM, XML et surtout syslog (avec des extensions pour la couche transport comme « Transmission of Syslog Messages over UDP »).

Le standard « syslog » (RFC 5242) ne spécifie pas la structure du message (« enregistrement d'audit »), c'est pourquoi le profil ATNA contraint l'utilisation du schéma DICOM et de HL7 pour spécifier le contenu du message. DICOM a défini un schéma de base pour le rapport d'événement et des descriptions de base pour les événements, notamment partie 15, [annexe A.5 « Audit Trail Message Format Profile »](http://dicom.nema.org/dicom/2013/output/chtml/part15/sect_A.5.html). IHE a étendu ces spécifications pour définir des événements spécifiques pour la sécurité et la protection de la vie privée.

###### Maturité et adoption

Le profil IHE ATNA, dans la version 16.0 du framework ITI, datant du 12 juillet 2019, est en « Final Text ». A la date de la rédaction de ce document, ce profil est largement implémenté dans plus de [200 produits](https://product-registry.ihe.net/). Ce profil est testé dans tous les connectathons européens et américains [depuis 2005](https://connectathon-results.ihe.net/).

###### Synthèse

Le profil ATNA se base sur les standards syslog et DICOM pour spécifier les messages de sécurité échangées lors de la transaction « Record Audit Event [ITI-20] ». Cette démarche pourrait être utilisée pour spécifier les messages échangés dans le volet « générique » « gestion des traces ». Ce pourrait notamment permettre de mutualiser les infrastructures de gestion de traces comme « l'Audit Record Repository ».

##### Option RESTful ATNA

###### Description

Resful [ATNA](https://www.ihe.net/resources/technical_frameworks/#IT) (Query and Feed) est un supplément de « l'IT Infrastructure Framework ». Il étend les fonctionnalités du profil ATNA en ajoutant des opérations RESTful, basées sur FHIR, pour soumettre et retrouver des enregistrements d'audit. Le profil IHE RESTful ATNA ajoute au profil IHE ATNA l'acteur « Audit Consummer » et deux transactions « Retreive ATNA Audit Event [ITI-81] » et « Retrieve Syslog Event [ITI-82] ». Ce profil étend aussi la transaction « Record Audit Event [ITI-20] » de la façon suivante :

* « Send Audit Event Message – Syslog Interaction » : audit utilisant le protocole syslog
* « Send Audit Resource Request Message – FHIR Feed Interaction » : audit basé sur le protocole RESTful avec envoi d'une seule ressource FHIR « AuditEvent »
* « Send Audit Bundle Request Message – FHIR Feed Interaction » : audit basé sur le protocole RESTful avec l'envoi d'un bundle de ressource FHIR « AuditEvent ».

La transaction « Retrieve ATNA Audit Event [ITI-81] » est conforme à l'opération « search » FHIR, i.e. une requête « http GET » avec le type de ressource « AuditEvent » et les paramètres de recherche FHIR associés à la ressource, envoyée par l'acteur « Audit Consumer ». Cela confirme l'utilisation de FHIR décrit dans le chapitre 3.1.6.3 de ce document. La réponse à la requête « http GET » retourne un bundle de ressources « AuditEvent ».

La transaction « Retrieve Syslog Event [ITI-82] » est une requête « http GET », avec les paramètres de recherche mappés sur les metadata syslog, envoyée par l'acteur « Audit Consumer ». La réponse à la requête est un message « Syslog Event Response » dont la structure est spécifiée dans l'option RESTful ATNA (comme la structure de l'événement qui est spécifié en DICOM – AuditMessage).

Un mapping est fourni pour montrer la relation entre les champs de la ressource FHIR « AuditEvent » et la structure DICOM « AuditMessage ».

###### Maturité et adoption

L'option IHE RESTful ATNA, dans sa version 3.1, datant du 15 août 2019, est en « Trial Implementation ». A la date de la rédaction de ce document, aucun produit n'a été déclaré comme [implémentant l'option RESTful ATNA](https://product-registry.ihe.net/). Ce profil n'a pas été testé lors de [connectathons](https://connectathon-results.ihe.net/). Néanmoins, le Ministère de la Santé Suisse a spécifié le profil ATC, basé sur RESTful ATNA (transaction ITI-81 uniquement). Ce profil est testé lors de projectathons en Suisse.

Quelques « open issues », comme l'alignement complet entre la ressource FHIR « AuditEvent » et tous les champs nécessaires dans les messages syslog ne sont pas encore traitées et seront prises en compte dans la « Release 5 » de FHIR. Néanmoins, il semble intéressant de s'inspirer de ce profil pour spécifier techniquement le volet « générique gestion des traces ».

###### Synthèse

L'option RESTful ATNA complète le profil ATNA avec les transactions « Retrieve ATNA Audit Event [ITI-81] » (basée sur FHIR) et « Retrieve Syslog Event [ITI-82] » (basée sur syslog). Cette extension et donc ce profil correspond exactement aux attentes du volet « générique gestion des traces ».

#### Les profils IHE mACM / ACM

Cette section décrit succinctement les profils IHE mACM / ACM.

##### Profil IHE mACM

###### Description

Le [profil mACM](https://www.ihe.net/resources/technical_frameworks/#IT) – « mobile Alert Communication Management » définit des composants d'infrastructure pour envoyer des alertes, sous forme de texte non structuré et fournit un mécanisme de feedback pour connaitre le statut d'une alerte. mACM se base sur les deux ressources FHIR « Communication (NM 2) et CommunicationRequest (NM 2). Ce profil supporte les extensions permettant d'adresser différents workflows métier. mACM définit deux acteurs « Alert reporter » et « Alert Aggregator » et deux transactions « Mobile Report Alert [ITI-84]), « Query for Alert Status [ITI-85] ». mACM utilise la méthode CREATE de l'API RESTful FHIR pour créer une alerte et utilise la méthode SEARCH de l'API RESTful pour consulter le statut des alertes.

L'acteur « Alert reporter » peut être à l'origine d'une alerte ou relayer des alertes provenant de différentes sources. Dans ce dernier cas, l'acteur assure l'interopérabilité avec l'acteur « Alert Aggregator ». L'alerte contient les informations concernant le destinataire de l'alerte.

Les réponses aux requêtes « Mobile Report Alert » et « Query for Alert Status » peuvent référencer des ressources FHIR comme Practitionner, Patient, Group, Organization and Location.

Le profil mACM peut être utilisé dans un environnement qui utilise aussi le profil IHE ACM « Alert Communication Management ». Cette information est intéressante car c'est aussi le besoin du volet générique « gestion des traces » de pouvoir adresser un contexte général englobant des implémentations mobiles ou non.

Les composants d'infrastructure décrits dans le profil mACM peuvent être utilisés dans différents cas d'utilisation métier comme par exemple la gestion des alertes dans un réseau contrôlé de prestations de soins. Des idées peuvent être repris de ce profil pour spécifier techniquement le volet générique « tracabilité des événements », notamment l'utilisation des ressources « Communication » et « CommunicationRequest » et les méthodes « CREATE » et « SEARCH » de l'API FHIR.

La spécification du profil mACM montre aussi comment ce profil peut être utilisé groupé au profil mCSD, qui agit comme registre des professionnels de santé. Cela permet d'indiquer les sources et destinataires des alertes, en requêtant le registre des professionnels de santé. Il en est de même pour les interactions entre le profil mACM et les profils PDQ/PDQm, qui agissent comme registre de patients pour indiquer et consulter les détails sur les patients concernés (comme les coordonnées postales, téléphoniques, etc.).

###### Maturité et adoption

Le profil IHE mACM, dans sa version 3.1, datant du 5 décembre 2019, est en « Trial Implementation ». Il est basé sur FHIR R4, utilisant des ressources de maturité 2. A la date de la rédaction de ce document, un seul produit a été déclaré comme [implémentant le profil mACM](https://product-registry.ihe.net/). Ce profil a été testé lors de [trois connectathons américains (2016, 2017 et 2018)](https://connectathon-results.ihe.net/).

###### Synthèse

Le profil mACM spécifie comment gérer (transmettre, consulter l'état) des traces qui peuvent être générées lors d'un workflow métier. Ce profil peut donc apporter des idées pour spécifier le volet générique « tracabilité des événements ». Le point intéressant aussi de ce profil est qu'il peut être utilisé dans un environnement dans lequel le profil IHE ACM est aussi implémenté, assurant ainsi une interopérabilité globale de gestion des alertes.

###### Description détaillée

Ces informations détaillées, présentes dans le profil mACM, peuvent aider à spécifier le profil générique « tracabilité des événements ».

La transaction « Mobile Report Alert » envoyée par l'acteur « Alert Report » est spécifiée en FHIR par l'utilisation de la commande CREATE pour la ressource CommunicationRequest.

FHIR CREATE CommunicationRequest REQUEST

FHIR CREATE CommunicationRequest RESPONSE

La transaction est générée conformément à des règles métier (qui sont hors scope du profil mACM).

La transaction « Query for Alert Status » est spécifiée en FHIR par l'utilisation de l'opération SEARCH via un http GET, en indiquant les critères de recherche spécifiés dans les ressources Communication et CommunicationRequest.

##### Profil IHE ACM

Le [profil « Alert Communication Management »](https://www.ihe.net/uploadedFiles/Documents/PCD/IHE_PCD_TF_Vol1.pdf) définit la communication d'alarmes entre sous-systèmes. ACM définit trois acteurs « Alarm Reporter », « Alarm Manager » et « Alarm Communicator ».et 4 transactions « Report Alarm (PCD-04) », « Report Alarm Status (PCD-05) », « Disseminate Alarm (PCD-06) », « Report Dissemination Alarm Status (PCD-07).

L'acteur « Alert Reporter » est à l'origine des alertes. Il envoie les alertes vers les acteurs « Alert Manager » et « Alert Consumer ». La façon de représenter les alertes est décrite dans le document ICE 60601-1-8[^17]. Il peut recevoir optionnellement une transaction « Report Alert Status » de la part de l'acteur « Alert Manager ».

L'acteur « Alert Manager » reçoit les alertes, les gère et les transmet à l'acteur « Alert Communicator ». Il peut envoyer optionnellement une transaction « Report Alert Status » à l'acteur « Alert Reporter ».

L'acteur « Alert Consumer » reçoit une alerte depuis l'acteur « Alert Reporter ».

L'acteur « Alert Communicator » reçoit des alertes provenant de l'acteur « Alert Manager ».

Les transactions échangées sont au format HL7v2.

##### Maturité et adoption

Le profil IHE ACM, dans sa version 1.3, datant du 16 août 2012, est en « Trial Implementation ». A la date de la rédaction de ce document, douze produits ont été déclaré comme [implémentant le profil ACM](https://product-registry.ihe.net/). Ce profil a été testé à 17 reprises lors d'un [connectathon (Europe 2014, Japon 2014-2016, 2018, Nord-Amérique 2007-2020)](https://connectathon-results.ihe.net/).

##### Synthèse

Le profil ACM spécifie comment gérer (transmettre, consulter l'état) des traces qui peuvent être générées lors d'un workflow métier. Ce profil peut donc apporter des idées pour spécifier le volet générique « Gestion des traces ». Le point intéressant aussi de ce profil est qu'il peut être utilisé dans un environnement dans lequel le profil IHE mACM est aussi implémenté, assurant ainsi une interopérabilité globale de gestion des alertes.

#### Le profil IHE PLT

##### Description

Le [profil PLT « Patient Location Tracking »](https://www.ihe.net/resources/technical_frameworks/#IT) définit les spécifications d'interopérabilité pour retrouver la localisation de patients. Ce profil définit trois acteurs : « Patient Location Tracking Manager », « Patient Location Tracking Supplier » et « Patient Location Tracking Consumer » et deux transactions « Patient Location Tracking Feed » et « Patient Location Tracking Query ».

L'acteur « Patient Location Tracking Manager » stocke les traces de localisation de patients et offre un service de consultation.

L'acteur « Patient Location Tracking Supplier » notifie la localisation de patients à l'acteur « Patient Location Tracking Manager ».

L'acteur « Patient Location Tracking Consumer » requête la localisation d'un patient auprès de l'acteur « Patient Location Tracking Manager », qui fournit la localisation et la date de l'événement.

La transaction « Patient Location Tracking Feed [ITI-76] » est spécifiée en HL7v2 avec deux messages ADT :

* A09 – Patient departing from temporary location
* A10 – Patient arriving to temporary location

La transaction "Patient Location Tracking Consumer [ITI-77] » est spécifiée en HL7v2 avec le trigger d'événement :

* ZV3 – Patient Location Tracking Query Request

Les informations suivantes sont véhiculées dans le message de trace :

* Event
* Source (Patient Location Tracking Supplier)
* Destination (Patient Location Tracking Manager)
* Audit Source (Patient Location Tracking Supplier)
* Patient

##### Maturité et adoption

Le profil IHE PLT, dans sa version 1.2, datant du 31 août 2015, est en « Trial Implementation ». A la date de la rédaction de ce document, aucun produit n'a été déclaré comme [implémentant le profil PLT](https://product-registry.ihe.net/). Ce profil n'a jamais été testé lors [d'un connectathon](https://connectathon-results.ihe.net/).

##### Synthèse

Ce profil IHE montre comment gérer un type de trace (« localisation des patients ») via des transactions HL7. Néanmoins, ce profil n'a jamais été implémenté ni testé.

#### Le profil IHE SOLE

##### Description

Le [profil SOLE « Standardized Operational Log of Events »](https://www.ihe.net/uploadedFiles/Documents/Radiology/IHE_RAD_Suppl_SOLE.pdf) définit les spécifications d'interopérabilité pour enregistrer et collecter des événements opérationnels. Il définit un moyen d'échanger de l'information concernant des workflows métier, qui peut être collectée, analysée et affichée en utilisant des méthodes standards. C'est un supplément du « Radiology technical framework». Ce profil définit trois acteurs « Event Reporter », « Event Consumer » et « Event Repository » et quatre transactions « Record Audit Event [ITI-20] », « Transfer multiple events [RAD-124] », « Retrieve syslog event [ITI-82] » et « Retrieve ATNA audit event [ITI-81] ».

L'acteur « Event reporter » doit aussi implémenter les transactions de l'acteur « Consistent Time / Time Client ».

Le profil IHE SOLE reprend les transactions d'accès aux traces définies par le supplément RESTful ATNA, avec comme complément la requête « Transfer Multiple Events [RAD-124] », celle-ci permettant de transmettre plusieurs événements, si par exemple, la communication s'est interrompue entre les acteurs « Event Reporter » et « Event Repository ».

Les événements SOLE et les événements ATNA peuvent être gérés par le même « Event Repository ». Dans ce cas, cet acteur devra offrir des fonctionnalités de filtrage. Pour les transactions au format syslog (« Retrieve syslog event [ITI-82] »), le champ syslog APP-NAME est spécifié à la valeur « IHE+SOLE ». Le champ MSG-ID est aussi spécifique avec des codes d'événements SOLE.

##### Maturité et adoption

Le profil IHE SOLE, dans sa version 1.2, datant du 27 Juillet 2018, est en « Trial Implementation ». A la date de la rédaction de ce document, aucun produit n'a été déclaré comme [implémentant le profil SOLE](https://product-registry.ihe.net/). Ce profil n'a jamais été testé lors d'[un connectathon](https://connectathon-results.ihe.net/).

##### Synthèse

Le profil IHE SOLE n'a jamais été implémenté. Néanmoins, son approche est intéressante car c'est une extension des profils ATNA / RESTful ATNA (ajout de la transaction RAD-124 et profilage des attributs des événements d'audit pour les adapter au contexte métier de la radiologie). Cette démarche peut donc être utilisée pour rendre « générique » le volet « tracabilité des événements » et le profilage se fera lors de la prise en compte des besoins d'interopérabilité métier.

#### Le standard DICOM

Le but de cette étude « Normes & Standards » n'est pas d'analyser en détail le standard DICOM, mais de se focaliser sur la partie « DICOM PS3.15 – Security and System Management Profiles », [annexe « A.5 – Audit Trail Message Format Profile »](http://dicom.nema.org/dicom/2013/output/chtml/part15/sect_A.5.html). En effet, cette annexe spécifie la structure d'un message d'audit qui est reprise dans les profils IHE ATNA, l'option RESTful ATNA et SOLE. Cette structure est aussi adéquate pour les besoins du volet « générique tracabilité des événements ». Il est ainsi possible de faire un mapping entre les concepts et les attributs des classes de l'étude métier « générique tracabilité des événements » et les attributs d'un message d'audit DICOM.

| | | | |
| :--- | :--- | :--- | :--- |
| **Elément du schéma AuditMessage** | **Sous-Elément** | | |
| Trace | identifiant |  |  |
| SourceTrace | identifiant | SourceAuditIdentification | AuditEnterpriseSiteId |
| Evénement | typeEvenement | EventIdentification | EventID |
| sousTypeEvement | EventTypeCode | | |
| occurence | EventDateTime | | |
| declaration | Possibilité utiliser le champ « TIMESTAMP » du protocole syslog | | |
| description | EventOutcomeDescription | | |
| ActeurEvenement | identifiant | ActiveParticipant |  |
| role | RoleIdCode | | |
| ObjectEvenement | identifiant | ParticipantObjectIdentification |  |
| type | ParticipantObjectTypeCode | | |
| contenu | ParticipantObjectDetail.valueou ParticipantObjectQueryou ParticipantObjectID | | |

Mapping DICOM avec les concepts de l'étude métier

Cela confirme l'idée de s'inspirer du profil IHE ATNA, de son option RESTful ATNA et du profil SOLE pour spécifier techniquement la volet « générique tracabilité des événements ».

#### Le standard GS1

##### Description

[GS1](https://www.gs1.org/standards) : GS1 – Global Standards 1 est un organisme mondial qui normalise des méthodes de codage utilisées dans les chaines logistiques, indépendamment du domaine métier. Le but est d'assister les organisations et les industries dans la spécification, la conception et l'implémentation de systèmes de traçabilité basés le système et les standards GS1. GS1 se base sur la définition normative de la « traçabilité » : « **Traceability is the ability to trace the history, application use and location of an item or its characteristics through recorded identification data [ISO 9001 :2015]** ». GS1 a publié un certain nombre de standards pour spécifier les échanges en logistique, en mettant en avant l'importance de l'interopérabilité. Des spécifications sont dédiées au monde de la santé ([https://www.gs1.org/industries/healthcare](https://www.gs1.org/industries/healthcare)). Deux standards GS1 sont dédiés à la tracabilité des événements :

* GTS2 : GS1 Global Traceability Standard - GS1's framework for the design of interoperable traceability systems for supply chains, notamment avec l'introduction du concept « Critical Tracking Events (CTEs) »
* EPCIS : Electronic Product Code Information Services

GTS2 a pour but d'aider les industriels à spécifier et implémenter des systèmes basés sur les standards GS1. Tout se base sur les aspects de gestion de données de traçabilité suivant les cinq dimensions : « who, what, when, where, why ». Ce concept est repris dans FHIR avec le pattern « fivews », pour aider les groupes de travail à définir les ressources de façon consistante. Le standard GTS2 est générique et indépendant du secteur d'activité et du produit ; il est aussi indépendant des technologies sous-jacentes. Il est basé sur les principes fondamentaux : Identifier – Capturer – Partager.

Le point important mis en avant par GS1 est que la fonctionnalité centrale d'un système de traçabilité est l'identification des objets tracés.

Le standard EPCIS spécifie les fonctionnalités et les structures de données pour créer et partager la visibilité sur les événements intra et inter-entreprises. Le standard EPCIS repose sur deux types de données : « Event data » et « Master data », codées en XML. « Event Data » sont gérées au cours d'un processus métier ; « Master data » sont des données pour compléter le contexte et supporter l'interprétation des données « Event data ».

« Event data » et « Master data » (source[La doctrine du CI-SIS](http://esante.gouv.fr/services/referentiels/ci-sis/demarche-elaboration), § 6.1)

Les données « Event data » sont transmises via les interfaces « Capture and Query » d'EPCIS. Quatre mécanismes sont fournis pour transmettre les données « Master data » :

* Master Data Query : requête de données via l'interface EPCIS Query
* ILMD : « Master data » intégrées directement dans un événement
* Header of EPCIS document : document contenant un ensemble d'événements avec l'inclusion de « Master data »
* EPCIS master data document : document contenant des « Master data »

GS1 dispose de méthodes pour étendre les spécifications EPCIS (ajout d'un type d'événement, ajout d'un nouveau champ dans un événement, ajout d'un nouveau type de vocabulaire, ajout d'un nouvel attribut « master data » ou ILMD, ajout d'un nouvel élément de vocabulaire).

EPCIS définit 6 types d'événements :

* EPCISEvent : événement générique
* ObjectEvent : événement en lien avec un ou plusieurs objets digitaux
* AggregationEvent : événement en lien avec l'agrégation physique de plusieurs objets
* QuantityEvent : événement en lien avec un certain nombre d'objets partageant la même classe EPC (Electronic Product Code)
* TransactionEvent : événement dans lequel un ou plusieurs objets sont associés avec une ou plusieurs transactions métier
* TransformationEvent : événement dans lequel des objets « entrants » sont transformés en objets « sortants »

Le « TransactionEvent » semble le plus se rapprocher du besoin métier « générique tracabilité des événements ».

| | | |
| :--- | :--- | :--- |
| Trace | identifiant |  |
| SourceTrace | TransactionEvent.Source.source | TransactionEvent.Source.source |
| Evénement | typeEvenement | eventID |
| sousTypeEvement | TransactionEvent.action | |
| occurence | eventTime | |
| declaration | recordTime | |
| description |  | |
| ActeurEvenement | identifiant | TransactionEvent.Source.source / TransactionEvent.Desitnation.dest |
| role | | |
| ObjectEvenement | identifiant |  |
| type |  | |
| contenu | Master data | |

Mise en correspondance avec l'événement « TransactionEvent »

EPCIS définit trois interfaces pour la tracabilité des événements :

* EPCIS Capture Interface : collecte des événements
* EPCIS Query Control Interface : consultation synchrone/asynchrone d'événements
* EPCIS Query Callback Interface : consultation d'événements (dans le cas d'une requête asynchrone)

EPCIS spécifie aussi l'utilisation optionnelle de fonctionnalités d'authentification et d'autorisation de gestion des événements.

L'interface « Capture » est implémentée soit via une queue de messages (point à point, publish/subscribe) soit en XML over http (POST).

L'interface « Query Control Interface » est implémentée soit en SOAP over http, soit en XML over AS2 (Application Statement 2 – RFC4130).

L'interface « Query Callback Interface » est implémentée soit en XML over http, soit en XML over HTTPS, soit en XML over AS2.

Il existe différents standards GS1 dans le domaine de la santé dont « Automatic Identification and Data Capture Healthcare Implementation Guideline » et « GS1 Global Traceability Standard for Healthcare ». Ce dernier standard spécifie la tracabilité des événements dans le domaine de la santé, à partir de processus et exigences métier puis sous forme de cas d'utilisation, reprenant l'enregistrement et la consultation de traces.

##### Maturité et adoption

GS1 a été fondé en 1974. GS1 est international avec des initiatives nationales dans différents pays ; GS1 est présent dans plus de 100 pays.

GS1 est l'organisme central pour la création de codes-barres.

GS1 est présent dans la revente, la santé, le transport et la logistique, le service alimentaire et les industries techniques.

GS1 dispose aussi d'un processus de gestion des standards GSMP (Global Standards Management Process).

Avant de commencer à échanger des données via GS1, il faut suivre quelques contraintes techniques, comme la formalisation technique des données échangées (qui peut se faire sous la forme d'un « interchange Agreement » et la réalisation d'une phase de tests.

Il existe aussi un programme de conformité : GTC (Global Traceability Conformance Programme) et des publications de livres de références (par exemple GS1 Healthcare Reference Book 2016-2017).

GS1 est donc mature et semble être adopté dans différents pays.

##### Synthèse

GS1 est un ensemble de standards utilisés pour tracer la gestion d'objets dans différents domaines métier. GS1 spécifie de façon générique la gestion de ces traces et l'instancie ensuite dans différents domaines métier, comme dans la santé.

GS1 est largement utilisé au niveau international, notamment via son service de gestion des codes d'identification.

Ce standard peut être analysé lors de la spécification technique « tracabilité des événements » pour s'assurer que certaines informations véhiculées par ce standard le seront bien aussi dans les spécifications techniques.

#### Le standard Syslog

##### Description

[Syslog](https://tools.ietf.org/html/rfc5424) est un standard ([RFC 5424](https://tools.ietf.org/html/rfc5424)) qui spécifie la structure et l'enregistrement de messages de traces. Les implémentations de syslog sont basées sur une architecture « client – serveur ».

Syslog est basé sur une architecture en trois couches :

* « Syslog content » : gestion des informations contenues dans un message syslog
* « Syslog application » : génération, interprétation, routage et stockage des messages syslog
* « Syslog transport » : transport des messages

On peut considérer 5 acteurs différents :

* « originator », « collector » et « relay » qui se positionnent au niveau « Syslog application »
* « transport sender » et « transport receiver » qui se positionnent au niveau « Syslog transport »

Le standard syslog (RFC 5424) ne spécifie aucune couche pour le protocole de transport. D'autres standards (comme RFC 5426 – Transmission of syslog messages over UDP, RFC 6587 – transmission of syslog messages over TCP) le font. Néanmoins, le standard syslog (RFC 5424) impose que les implémentations supportent une couche de transport basée sur TLS (RFC 5425).

Le standard syslog (RFC 5424) spécifie la structure de l'entête d'un message qui est échangé entre le client et le serveur, sous forme de grammaire (cf. ci-dessous). Par contre, la structure du message de trace (« paylog ») n'est pas spécifiée. C'est pourquoi les profils IHE ATNA et son option RESTful ATNA (feed & query syslog) et SOLE se basent sur DICOM pour spécifier la structure de la trace à enregistrer.

```
SYSLOG-MSG = HEADER SP STRUCTURED-DATA [SP MSG]

HEADER = PRI VERSION SP TIMESTAMP SP HOSTNAME SP APP-NAME SP PROCID SP MSGID

PRI = "<" PRIVAL ">"

PRIVAL = 1*3DIGIT ; range 0 .. 191

VERSION = NONZERO-DIGIT 0*2DIGIT

HOSTNAME = NILVALUE / 1*255PRINTUSASCII

APP-NAME = NILVALUE / 1*48PRINTUSASCII

PROCID = NILVALUE / 1*128PRINTUSASCII

MSGID = NILVALUE / 1*32PRINTUSASCII

TIMESTAMP = NILVALUE / FULL-DATE "T" FULL-TIME

FULL-DATE = DATE-FULLYEAR "-" DATE-MONTH "-" DATE-MDAY

DATE-FULLYEAR = 4DIGIT

DATE-MONTH = 2DIGIT ; 01-12

DATE-MDAY = 2DIGIT ; 01-28, 01-29, 01-30, 01-31 based on ; month/year

FULL-TIME = PARTIAL-TIME TIME-OFFSET

PARTIAL-TIME = TIME-HOUR ":" TIME-MINUTE ":" TIME-SECOND [TIME-SECFRAC]

TIME-HOUR = 2DIGIT ; 00-23

TIME-MINUTE = 2DIGIT ; 00-59

TIME-SECOND = 2DIGIT ; 00-59

TIME-SECFRAC = "." 1*6DIGIT

TIME-OFFSET = "Z" / TIME-NUMOFFSET

TIME-NUMOFFSET = ("+" / "-") TIME-HOUR ":" TIME-MINUTE

STRUCTURED-DATA = NILVALUE / 1*SD-ELEMENT

SD-ELEMENT = "[" SD-ID *(SP SD-PARAM) "]"

SD-PARAM = PARAM-NAME "=" %d34 PARAM-VALUE %d34

SD-ID = SD-NAME

PARAM-NAME = SD-NAME

PARAM-VALUE = UTF-8-STRING ; characters '"', '\ and ; ']' MUST be escaped.

SD-NAME = 1*32PRINTUSASCII ; except '=', SP, ']', %d34 (")

MSG = MSG-ANY / MSG-UTF8

MSG-ANY = *OCTET ; not starting with BOM

MSG-UTF8 = BOM UTF-8-STRING

BOM = %xEF.BB.BF

UTF-8-STRING = *OCTET ; UTF-8 string as specified ; in [RFC 3629](https://tools.ietf.org/html/rfc3629)

OCTET = %d00-255

SP = %d32

PRINTUSASCII = %d33-126

NONZERO-DIGIT = %d49-57

DIGIT = %d48 / NONZERO-DIGIT

NILVALUE = "-"

```

L'option RESTful-ATNA et le profil SOLE utilisent les champs :

* APP-NAME : pour différencier les profils (par exemple : « IHE+SOLE » ou « ATNA+2881 »
* MSG-ID : dans certains cas pour différencier les types de message. Par exemple, le profil SOLE utilise ce champ pour véhiculer les codes des événements

Cette approche semble appropriée pour spécifier techniquement le volet « générique tracabilité des événements ».

##### Maturité et adoption

Le standard syslog (RFC 5424) a été spécifié en 2009 avec une première version en 2001. Ces standards ont été largement implémentés et sont devenus des références pour la tracabilité des événements, notamment dans le monde Unix/Linux.

##### Synthèse

Le standard syslog est largement diffusé depuis des décennies dans les systèmes d'information pour gérer les traces, notamment dans le monde Unix / Linux. Ce standard a été adopté par IHE lors de la spécification du profil ATNA (pour la transmission d'événements entre un nœud sécurisé / une application sécurisée et un système d'enregistrement d'événements, couplé à l'utilisation du standard DICOM, pour la structuration des messages. Cette formalisation n'est pas contrainte par syslog qui laisse libre le contenu de messages. L'idéal, pour le volet « générique gestion des traces » est donc de pouvoir couvrir le protocole syslog, laissant ainsi la possibilité de pouvoir être interopérable avec des systèmes existants supportant syslog.

### Synthèse comparative des standards présentés

Cette section présente une synthèse comparative des standards et profils analysés dans les sections précédentes. Les items de cette synthèse sont inspirés des documents suivants :

* [La doctrine du CI-SIS](https://interop.esante.gouv.fr/ig/doctrine/) .
* Le document [« Organismes et Standards » ](http://esante.gouv.fr/services/referentiels/ci-sis/espace-publication/annexes-transverses) qui décrit les organismes producteurs de standards ainsi que la manière dont ces standards sont gérés.
* [« **Evaluating HIT Standards** »](http://www.himss.org/evaluating-hit-standards?ItemNumber=22775) document sur la comparaison des standards publiés par l'organisation [HIMSS](http://www.himss.org/).
* La méthode [CAMSS](http://ec.europa.eu/isa/ready-to-use-solutions/camss_en.htm), soutenue par le programme de la commission européenne concernant les solutions d'interopérabilité pour les administrations publiques. Cette initiative vise à promouvoir la collaboration entre les états membres de l'union européenne dans la définition d'une méthode d'évaluation commune de standards pour le développement des services administratifs en ligne.

| | | | | | | | | | | | | | |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| Nom de la ressource FHIR | **AdverseEvent** | **AuditEvent** | **Communication** | **CommunicationRequest** |  |  |  |  |  |  |  |  |  |
| Outillage**Des outils de tests sont mis en œuvre pour valider l'adhérence au standard.** | ✔ | ✔ | ✔ | ✔ | ✔ | ✔ | Partiel | **Partiel** |  | Partiel | ✔ | ✔ |  |
| Tests**Des tests sont effectués pour les guides d'implémentation normatifs.** | ✔ | ✔ | ✔ | ✔ | ✔ | ✔ | Partiel | Partiel | ✔ | Partiel | ✔ | ✔ |  |
| Processus de prise en compte des améliorations | ✔ | ✔ | ✔ | ✔ | ✔ | ✔ | ✔ | ✔ | ✔ | ✔ | ✔ | ✔ | ✔ |
| Existence de guides d'implémentation[1](#fn1)**Les guides référencent les standards de base**[2](#fn2) **avec au moins un cas d'usage et une optionalité sur les paramètres pour permettre les extensions.** | ✔ | ✔ | ✔ | ✔ | ✔ | ✔ | ✔ | ✔ | ✔ | ✔ | ✔ | ✔ | ✔ |
| Adapté aux dispositifs mobiles | ✔ | ✔ | ✔ | ✔ | ✔ |  |  | ✔ |  | ✔ |  | ✔ | ✔ |
| Stabilité de la documentation | ✔ | ✔ | ✔ | ✔ | ✔ | ✔ | ✔ | ✔ | ✔ | ✔ | ✔ | ✔ | ✔ |
| Adoption par le marché[3](#fn3)et utilisation | ✔ | ✔ | ✔ | ✔ |  |  | ✔ |  |  |  | ✔ | ✔ | ✔ |
| Neutralité**les spécifications ne limitent pas la concurrence et l'innovation;****les spécifications sont basées sur des développements scientifiques et technologiques de pointe.** | ✔ | ✔ | ✔ | ✔ | ✔ | ✔ | ✔ | ✔ | ✔ | ✔ | ✔ |  | ✔ |
| Qualité**la qualité est suffisante pour permettre le développement de produits et de services interopérables concurrents.** | ✔ | ✔ | ✔ | ✔ | ✔ | ✔ | ✔ | ✔ | ✔ | ✔ | ✔ | ✔ | ✔ |
| Accessibilité**Les spécifications sont disponibles au public à des conditions raisonnables (y compris pour un prix raisonnable ou gratuitement).** | ✔ | ✔ | ✔ | ✔ | ✔ | ✔ | ✔ | ✔ | ✔ | ✔ | ✔ | ✔ | ✔ |
| Couverture métier (tracabilité des événements) | Partiel | Partiel |  |  | Partiel | Partiel | Partiel | ✔ |  | ✔ | Partiel | ✔ | Partiel |
| Mises en œuvre existantes du cas d'usage (tracabilité des événements) |  |  |  |  |  |  |  | Partiel |  |  |  | ✔ |  |

-------

1. Un guide d'implémentation combine un ou plusieurs standards afin de traiter des cas d'usage particuliers[↩︎](#fnref1)
1. Un standard de base traite des cas d'usage relativement génériques et diversifiés et qui restent à un niveau abstrait (et donc ne traitent pas des cas pointus dans un domaine spécifique)[↩︎](#fnref2)
1. L'adoption par le marché peut être démontrée par des exemples opérationnels d'implémentations conformes provenant de différents fournisseurs[↩︎](#fnref3)

Tableau récapitulatif de l'évaluation des standards

### Analyse et Conclusion

Cette étude a pour objectif de comparer les standards ****HL7 FHIR R4, DICOM, GS1, syslog**** et les profils **IHE mACM / ACM / ATNA et son option RESTful ATNA / PLT et SOLE** en vue de l'élaboration des spécifications d'interopérabilité du besoin « générique gestion des traces ». Ci-dessous une analyse métier et technique des standards et profils présentés dans ce document.

#### Analyse métier

L'analyse métier reste « générique » avec le besoin principal de gestion des traces (création, recherche, consultation). L'argumentaire ci-dessous reste à ce niveau générique. Cette analyse métier sera instanciée lors de la prise en compte d'un besoin métier « spécifique » de gestion de traces.

##### HL7 FHIR

Les informations identifiées dans [l'étude métier](specifications_fonctionnelles.md) sont couvertes par les attributs proposés par les ressources FHIR identifiées et détaillées dans ce document (AdverseEvent et AuditEvent). De plus, les critères de recherche proposés sont adaptés aux critères identifiés dans [l'étude métier](specifications_fonctionnelles.md).

La ressource FHIR AuditEvent semble correspondre au besoin métier « générique tracabilité des événements » ; elle couvre la classe « événement » et ses paramètres de recherche couvrent les critères de recherche de l'étude métier. Enfin les opérations FHIR CREATE, READ et SEARCH permettent aussi de spécifier les différents flux de l'étude métier.

##### Les profils mACM/ACM

Les profils mACM et ACM pourraient être utilisés pour répondre aux besoins métier « générique tracabilité des événements » mais ces deux profils sont plus orientés « gestion des alertes » que « tracabilité des événements ». Par contre, ces deux profils couvrent aussi bien les besoins IHE HL7 que IHE FHIR ; ce point est intéressant d'un point de vue générique pour adresser le maximum de besoins métier de gestion de traces.

##### Les profils ATNA et son option RESTful ATNA / SOLE

Les profils ATNA / l'option RESTful ATNA et SOLE ont été spécifiés pour gérer des traces (sécurité dans le cadre de ATNA et RESTful ATNA, événements de workflows radiologie pour SOLE) : création de traces, recherche de traces, consultation de traces. Ces profils peuvent être utilisés pour élaborer la spécification technique « générique gestion des traces ». Dans la spécification fonctionnelle « générique gestion des traces », il y a trois transactions : « créer des traces », « consulter une trace » et « rechercher des traces ». Dans l'option RESTful ATNA et le profil SOLE, il y a uniquement deux types de transactions : « record audit event » et « retrieve audit event » mais cette dernière transaction couvre finalement les transactions « consulter une trace » et « rechercher des traces ».

##### Le profil PLT

Le profil PLT est un cas spécifique de tracabilité des événements concernant la traçabilité des mouvements d'un patient. La tracabilité des événements est spécifiée en HL7. Ce profil peut être utilisé pour réfléchir à sa généricité et comment il pourrait être adressé par le volet « générique tracabilité des événements ».

##### DICOM

DICOM est un standard qui est largement utilisé dans le domaine de la radiologie. La partie « DICOM PS3.15 – Security and System Management Profiles » [annexe « A.5 – Audit Trail Message Format Profile »](http://dicom.nema.org/dicom/2013/output/chtml/part15/sect_A.5.html) spécifie la structure des messages d'audit DICOM gérés dans les workflows radiologie. Cette spécification est reprise dans les profils ATNA et son option RESTful ATNA et SOLE pour spécifier la structure interne des messages d'audit. Il serait intéressant de réutiliser cette spécification pour couvrir le besoin métier générique décrivant la classe « Evénement ».

##### GS1

GS1 est un standard international, qui spécifie la gestion de la traçabilité d'objets produits et échangés entre différents acteurs, et ceci dans différents contextes métier comme la santé. GS1 couvre le besoin métier « générique tracabilité des événements » en spécifiant trois interfaces « EPCIS Capture Interface », « EPCIS Query Control Interface » et « EPCIS Query Callback Interface ».

##### Syslog

Syslog est un standard déjà largement utilisé pour la gestion des traces. Il présente néanmoins une faiblesse : il ne spécifie pas la structure interne des traces, ce qui rend plus difficile l'analyse future des traces. Les profils IHE ATNA et son option RESTful ATNA et SOLE se basent sur le standard syslog pour l'échange des traces et la spécification de « l'enveloppe » des traces.

#### Analyse technique

Comme argumenté dans l'analyse métier, FHIR peut répondre au besoin métier « générique ». Néanmoins, pour adresser le plus grand nombre de besoins métier spécifiques, il est intéressant de considérer aussi syslog, qui est très répandu dans les systèmes d'information pour la tracabilité des événements.

##### HL7 FHIR

Le standard FHIR permet la mise en œuvre native de l'ensemble des flux structurés et identifiés dans [l'étude métier](specifications_fonctionnelles.md) « générique gestion des traces ».

Les ressources FHIR permettent une implémentation en utilisant les standards XML ou JSON. Ces deux standards pourront être utilisés en fonction du contexte spécifique métier, sachant que JSON est bien adapté dans un contexte mobile.

##### Les profils mACM/ACM

Le profil mACM utilise des ressources FHIR « Communication et « CommunicationRequest » pour spécifier les informations échangées dans le cadre de la gestion des alertes et se basent sur les opérations FHIR pour la gestion de ces alertes.

Le profil ACM spécifie la gestion des alertes en HL7v2 (spécification et gestion des événements).

Il est intéressant de s'inspirer de ces deux profils pour la spécification technique « générique tracabilité des événements », notamment comment ces deux profils collaborent pour adresser aussi bien le monde du système d'information de santé que le monde du mobile.

##### Les profils ATNA et son option RESTful ATNA / SOLE

Les profils ATNA et son option RESTful ATNA et SOLE se positionnement de la façon suivante :

Positionnement des profils ATNA et son option RESTful ATNA / SOLE

L'option RESTful ATNA, avec la possibilité de l'étendre si nécessaire en fonction du besoin métier spécifique semble donc approprié pour la spécification technique « générique tracabilité des événements ». Il faut juste identifier les attributs de la spécification technique qui seront génériques à concrétiser lors de la prise en compte d'un besoin métier spécifique.

##### Le profil PLT

Le profil PLT – Patient Location Tracking est basé sur le standard HL7 pour la gestion et la description des événements (événements A09, A10 et ZV3). Ce profil est en trial implementation et n'a jamais été testé. Les informations véhiculés dans les messages d'événements couvrent le besoin métier mais ils sont très orientés « patient ». A voir comment s'en inspirer pour les aspects génériques de tracabilité des événements.

##### DICOM

DICOM est le standard utilisé pour échanger des informations dans le domaine de la radiologie. [L'annexe 5 – Audit Trail Message Format Profile](http://dicom.nema.org/dicom/2013/output/chtml/part15/sect_A.5.html), de la partie – DICOM PS3.15 spécifie le format des événements qui sont gérés lors d'un workflow de radiologie. Les profils ATNA et son option RESTful ATNA / SOLE se basent sur ce standard pour spécifier la structure des événements qui sont échangés (événements de sécurité et événements spécifiques de radiologie). La même structure de messages pourra être utilisée pour tous les futurs événements pour faciliter la mutualisation des fonctionnalités de tracabilité des événements.

##### GS1

GS1 spécifie techniquement les interfaces « EPCIS Capture Interface », « EPCIS Query Control Interface » et « EPCIS Query Callback Interface » soit via l'utilisation du protocole http en mode GET ou POST, soit via le protocole AS2 en échangeant des données au format XML.

##### Syslog

Le protocole Syslog propose un premier niveau de formalisation pour tracer des événements, ainsi qu'une architecture de communication associée pour l'échange et la centralisation d'événements. Le protocole syslog se base sur d'autres standards pour la couche transport et la couche sécurité. Ces différents standards sont utilisés par les profils IHE ATNA et son option RESTful ATNA / SOLE pour échanger des événements au format syslog.

#### Conclusion

Ce document présente une étude comparative des standards FHIR, DICOM, GS1 et syslog ainsi que des profils IHE mACM / ACM / ATNA et son option RESTful ATNA / SOLE / PLT en vue de l'élaboration des spécifications techniques pour supporter le besoin d'interopérabilité « générique tracabilité des événements ».

Les critères à prendre en compte dans le choix de la solution sont les suivants :

* Le standard adopté doit offrir une couverture maximale des informations identifiées dans [l'étude métier](specifications_fonctionnelles.md);
* Le standard adopté qui permet de spécifier techniquement le besoin spécifique « générique » doit pouvoir être instancié à partir d'un besoin spécifique, le plus « simplement possible »,
* Les efforts en matière de développements nécessaires pour la mise en œuvre de la tracabilité des événements ne doivent pas constituer une charge importante aux développeurs ;
* Le standard adopté doit être adapté aux environnements mobiles ;
* La solution choisie doit faire appel à un minimum de standards différents.

En se basant sur la synthèse des standards et profils IHE présentée dans les sections 5.1 et 5.1.5, l'option RESTful ATNA semble le plus adapté au besoin « générique tracabilité des événements », en s'inspirant aussi des spécifications GS1.

