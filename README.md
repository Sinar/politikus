# Politikus

Is a customized CMS based on Plone with add-ons and customizations for
investigative journalists and anti-corruption researchers to store and extract
bits of pieces of information on persons of interests, organizations and
contracts, using open data standards. It helps make this structured data
available in environments where such data is limited.

The base CMS platform functions as a flexible and user friendly way to
start an investigation, and then providing a way to store supporting
resources and sources, while extracting key metadata.

The metadata then provides additional insights into a story, such as
information on persons, their relations with each other, posts in
organizations, contratracts, related issues or red flags.

As the data and metadata is stored using open data standards of Popolo-spec,
OCDS, COST IDS and others, it can be exported, and also use other tools
developed by others using these standards.

![Overview](https://raw.githubusercontent.com/Sinar/politikus/master/docs/diagrams/overview.png)

Open Data Standards Content Types

 * Popolo-spec Content types https://github.com/Sinar/popolo.contenttypes
 * OCDS Content types https://github.com/Sinar/ocds.contenttypes
 * Open Ownership Content Types https://github.com/Sinar/politikus.bods

Issue Tracking and Relations

* https://github.com/Sinar/politikus.contenttypes

# Installation and Configuration

## System requirements

Requirements for ubuntu can be installed 
`sudo xargs -a ubuntu-pkg.list apt install`

This buildout script will automatically build the application server and
database.

### Virtualenv environment

Recommended to install virtualenv python environment for some custom
packages

```
virtualenv python-plone
source python-plone/bin/activate 
pip install zc.buildout plonecli

```

### Buildout

In directory of this checked out repository with virtualenv activated

`buildout -vv`

### Starting up application server and database

After a successful buildout:

To start database:

`bin/zeoserver start`

To start application server in debug mode:
`bin/instance fg` 

The application server will be accessible at http://localhost:8080

With an option to Create a new Plone site.

## Configuring Add-ons

In Plone Add-on configuration screen, install

plone.restapi
politikus.contenttypes
ocds.contenttypes
politikus.bods
popolo.contenttypes
politikus.theme

optional for document previews and text indexing:

Doccument Viewer 

#Contributors

 * Khairil Yusof <khairil.yusof@sinarproject.org>
 * Justine Pepin
 
# Supported by


![Hivos](https://sinarproject.org/media/hivos_logo-1.png/@@images/7485dd1c-7b0c-47a7-a940-d7966445764f.png)
![OD4D](https://sinarproject.org/media/partner-logos/copy_of_od4d.png/@@images/a9c51168-cbba-4ee1-9978-bd7c43136657.png)

This project is supported by Hivos East Africa, Nation Media Group.
Indirectly via IDRC, Alternatives, (Montreal) and the kind individual contributors to Sinar Project.

Also this project would not be possible without all the  great people working
on open data standards of Popolo-spec, Open Contracting Data Standard,
Beneficial Ownership Data Standard and COST IDS
