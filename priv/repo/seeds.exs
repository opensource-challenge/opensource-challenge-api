# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     OpensourceChallenge.Repo.insert!(%OpensourceChallenge.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Ecto.Date

alias OpensourceChallenge.Repo
alias OpensourceChallenge.Challenge
alias OpensourceChallenge.User
alias OpensourceChallenge.Contribution

Repo.insert! %Challenge{
  name: "Thömus Open Source Advents Challenge 2015",
  shortname: "advent-2015",
  starts_on: %Date{year: 2015, month: 12, day: 1},
  ends_on: %Date{year: 2015, month: 12, day: 24},
  closed: true
}
Repo.insert! %Challenge{
  name: "Damians Open Source Advents Challenge 2016",
  shortname: "advent-2016",
  starts_on: %Date{year: 2016, month: 12, day: 1},
  ends_on: %Date{year: 2016, month: 12, day: 24},
  closed: false
}

Repo.insert! %User{
  id: 1,
  email: "damian.senn@topaxi.codes",
  github_login: "topaxi",
  website: "https://topaxi.codes/",
  picture: "https://www.puzzle.ch/wp-content/uploads/2016/03/Senn_Damian-400x300.jpg",
  name: "Damian Senn",
  company: "Puzzle ITC GmbH",
  admin: true
}

Repo.insert! %User{
  id: 2,
  name: "Daniel Binggeli",
  website: "https://github.com/drnoa",
  picture: "https://www.puzzle.ch/wp-content/uploads/2015/07/Binggeli-Daniel-400x300.jpg",
  company: "Puzzle ITC GmbH",
  github_login: "drnoa"
}

Repo.insert! %User{
  id: 3,
  name: "Philipp Gassmann",
  website: "https://github.com/pgassmann",
  picture: "https://www.puzzle.ch/wp-content/uploads/2015/08/Gassmann-Philipp-400x300.jpg",
  company: "Puzzle ITC GmbH",
  github_login: "pgassmann"
}

Repo.insert! %User{
  id: 4,
  name: "Thomas Philipona",
  website: "https://github.com/phil-pona",
  picture: "https://www.puzzle.ch/wp-content/uploads/2015/07/Philipona-Thomas-400x300.jpg",
  company: "Puzzle ITC GmbH",
  github_login: "phil-pona"
}

Repo.insert! %User{
  id: 5,
  name: "Daniel Tschan",
  website: "https://github.com/dtschan",
  picture: "https://www.puzzle.ch/wp-content/uploads/2015/07/Tschan-Daniel-400x300.jpg",
  company: "Puzzle ITC GmbH",
  github_login: "dtschan"
}

Repo.insert! %User{
  id: 6,
  name: "Pascal Simon",
  website: "https://github.com/psunix",
  picture: "https://www.puzzle.ch/wp-content/uploads/2015/07/Simon-Pascal-400x300.jpg",
  company: "Puzzle ITC GmbH",
  github_login: "psunix"
}

Repo.insert! %User{
  id: 7,
  name: "Max Burri",
  website: "https://github.com/mburri",
  picture: "https://www.puzzle.ch/wp-content/uploads/2015/07/Burri-Max-400x300.jpg",
  company: "Puzzle ITC GmbH",
  github_login: "mburri"
}

Repo.insert! %User{
  id: 8,
  name: "Pascal Zumkehr",
  website: "https://github.com/codez",
  picture: "https://www.puzzle.ch/wp-content/uploads/2015/10/Zumkehr-Pascal-400x300.jpg",
  company: "Puzzle ITC GmbH",
  github_login: "codez"
}

Repo.insert! %User{
  id: 9,
  name: "Anselm Strauss",
  website: "https://github.com/amsibamsi",
  picture: "https://www.puzzle.ch/wp-content/uploads/2015/07/Strauss-Anselm-400x300.jpg",
  company: "Puzzle ITC GmbH",
  github_login: "amsibamsi"
}

Repo.insert! %User{
  id: 10,
  name: "Philipp Grogg",
  website: "https://github.com/gro-gg",
  picture: "https://www.puzzle.ch/wp-content/uploads/2015/08/Grogg-Philipp-400x300.jpg",
  company: "Puzzle ITC GmbH",
  github_login: "gro-gg"
}

Repo.insert! %User{
  id: 11,
  name: "Lorenz Bischof",
  website: "https://github.com/lbischof",
  picture: "https://www.puzzle.ch/wp-content/uploads/2015/07/Bischof-Lorenz-400x300.jpg",
  company: "Puzzle ITC GmbH",
  github_login: "lbischof"
}

Repo.insert! %User{
  id: 12,
  name: "Roland Studer",
  website: "https://github.com/rolandstuder",
  picture: "https://www.puzzle.ch/wp-content/uploads/2015/08/Studer-Roland-400x300.jpg",
  company: "Hitobito AG",
  github_login: "rolandstuder"
}

Repo.insert! %User{
  id: 13,
  name: "Philipp Matti",
  website: "https://github.com/phil-matti/vagrant",
  picture: "https://www.puzzle.ch/wp-content/uploads/2015/07/Matti-Philipp-400x300.jpg",
  company: "Puzzle ITC GmbH",
  github_login: "phil-matti/vagrant"
}

Repo.insert! %User{
  id: 14,
  name: "Mathis Hofer",
  website: "https://github.com/hupf",
  picture: "https://www.puzzle.ch/wp-content/uploads/2015/10/Hofer-Mathis-400x300.jpg",
  company: "Puzzle ITC GmbH",
  github_login: "hupf"
}

Repo.insert! %User{
  id: 15,
  name: "Christoph Raaflaub",
  website: "https://github.com/chrira",
  picture: "https://www.puzzle.ch/wp-content/uploads/2015/07/Raaflaub-400x300.jpg",
  company: "Puzzle ITC GmbH",
  github_login: "chrira"
}

Repo.insert! %User{
  id: 16,
  name: "Janiss Binder",
  website: "https://github.com/janissbinder",
  picture: "https://www.puzzle.ch/wp-content/uploads/2015/07/Binder-Jannis-400x300.jpg",
  company: "Puzzle ITC GmbH",
  github_login: "janissbinder"
}

Repo.insert! %User{
  id: 17,
  name: "Oliver Gugger",
  website: "https://github.com/guggero",
  picture: "https://www.puzzle.ch/wp-content/uploads/2015/10/Gugger_Oliver-400x300.jpg",
  company: "Puzzle ITC GmbH",
  github_login: "guggero"
}

Repo.insert! %User{
  id: 18,
  name: "Martin Gafner",
  website: "https://github.com/mgafner",
  picture: "https://www.puzzle.ch/wp-content/uploads/2015/07/Gafner-Martin-400x300.jpg",
  company: "Puzzle ITC GmbH",
  github_login: "mgafner"
}

Repo.insert! %User{
  id: 19,
  name: "Sandro Beffa",
  website: "https://github.com/sandroBeffa",
  picture: "https://www.puzzle.ch/wp-content/uploads/2015/07/Beffa-Sandro-400x300.jpg",
  company: "Puzzle ITC GmbH",
  github_login: "sandroBeffa"
}

Repo.insert! %User{
  id: 20,
  name: "Peter Mumenthaler",
  website: "https://github.com/pmumenthaler",
  picture: "https://www.puzzle.ch/wp-content/uploads/2015/07/Mumenthaler-Peter-400x300.jpg",
  company: "Puzzle ITC GmbH",
  github_login: "pmumenthaler"
}

Repo.insert! %User{
  id: 21,
  name: "Simon Fankhauser",
  website: "https://github.com/plow",
  picture: "https://www.puzzle.ch/wp-content/uploads/2015/07/Fankhauser-Simon-400x300.jpg",
  company: "Puzzle ITC GmbH",
  github_login: "plow"
}

Repo.insert! %Contribution{
  user_id: 2,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 01},
  link: "https://github.com/drnoa/sqlledger_docker",
  description: "Ich habe gestern folgende Anfrage erhalten. \"danke, dass Du auf meinen Eintrag im Blog eingegangen bist. Das mit dem Port werde ich demnächst mal versuchen. Ich wollte fragen, ob Du eventuell an einer Portierung von SQL Ledger auf Docker interessiert bist und wieviel Du dafür berechnen würdest. Ich nutze SQL Ledger lieber, da die Partnergebühren um als Consultant tätig zu sein nicht so hoch sind wie bei kivitendo. Ich bin Mitglied folgendes Vereins: http://www.sql-ledger-network.com und habe auch auf github.com einige Sachen hinterlegt auf denen man eventuell aufbauen könnte: http://www.github.com/tapwag Herzliche Grüße und nochmals danke\" Dies weil ich mal einen Blog zu kiviendo (OpenSource ERP) geschrieben habe. Das Dockerimage für SQL Ledger habe ich vor längerem schon mal erstellt. Wie sich herausgestellt hat hatte das aber noch ein paar Fehler. Ich habe das gestern Abend und heute Morgen noch korrigiert. Dockerfile hier: https://github.com/drnoa/sqlledger_docker Dockerhub Image hier: https://hub.docker.com/r/drnoa/sqlledger-docker/"
}

Repo.insert! %Contribution{
  user_id: 3,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 01},
  link: "https://github.com/tomas-edwardsson/puppet-push/pull/17",
  description: "Kleiner kosmetischer Bugfix für das puppet-push Projekt"
}

Repo.insert! %Contribution{
  user_id: 4,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 01},
  link: "https://github.com/puzzle/flyway-cdi-integration",
  description: "Ich habe unter https://github.com/puzzle/flyway-cdi-integration das Datenbank-Migrations-Tool “Flyway” in einer ersten Version um eine Java EE CDI Extension erweitert, damit Datenbank-Migrationen beim Starten des Applikationsserver direkt gegen die DB ausgeführt werden. Dies gab es bis heute nur für Liquibase und ist für Konzepte wie Continuous Delivery oder Deployment essentiell."
}

Repo.insert! %Contribution{
  user_id: 5,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 01},
  link: "https://github.com/openshift/openshift-ansible/pull/1004",
  description: "Pull Request für einen Bugfix des offiziellen OpenShift Ansible Playbooks. Das Playbook dient der Installation und Konfiguration von OpenShift 3"
}

Repo.insert! %Contribution{
  user_id: 6,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 01},
  link: "https://github.com/psunix/dot-vim",
  description: "Habe meine VIM Konfiguration auf Github zur Verfügung gestellt."
}

Repo.insert! %Contribution{
  user_id: 7,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 01},
  link: "https://github.com/mburri/break-out",
  description: "Mein Beitrag von heute: https://github.com/mburri/break-out
– Projekt erstellt
– Erste Unit Tests und Implementationen
Das Projekt hat folgende Ziele:
1. Mal ein Game machen
2. Weiterbildung in folgenden Themen
– es6/es2015
– javascript unit testing
– redux (pattern, ev. werde ich die Library gar nicht verwenden)
– javascript tools: npm, babel, webpack"
}

Repo.insert! %Contribution{
  user_id: 8,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 01},
  link: "https://github.com/codez/tarantula/commit/3fe47e6e1adf41670a60844e356b2cc532818c12",
  description: "Tarantula is a big hairy fuzzy spider that crawls your site, wreaking havoc. We change the crawl order to process GET requests before all others in order to avoid stale views."
}

Repo.insert! %Contribution{
  user_id: 9,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 01},
  link: "https://github.com/fatih/vim-go/issues/639",
  description: "Report issue: vim-go plugin does not build when using separate header file in a project with cgo. https://github.com/fatih/vim-go/issues/639 https://github.com/amsibamsi/opengles-examples/commit/bb58db2bbfe0df1d7632857649de5a88948d61e6"
}

Repo.insert! %Contribution{
  user_id: 10,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 01},
  link: "https://github.com/nojhan/liquidprompt/pull/409",
  description: "Ich habe gestern meinen pull request zu liquidprompt erweitert"
}

Repo.insert! %Contribution{
  user_id: 2,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 02},
  link: "https://github.com/drnoa/sqlledger_docker",
  description: "Bugfixing Dockerfile"
}

Repo.insert! %Contribution{
  user_id: 11,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 02},
  link: "https://github.com/lbischof/puzzle-forms",
  description: "Webformulare mit JSON verwalten. Nach langem zögern habe ich mein Projekt nun veröffentlicht."
}

Repo.insert! %Contribution{
  user_id: 8,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 02},
  link: "https://github.com/codez/ImportPhotoFolders/issues/4",
  description: "ImportPhotoFolder ist ein Script, welches eine verschachtelte Orderstruktur als Alben in OS X Fotos importiert. Dazu ein Issue geschlossen, welches aufgrund des mangelhaften APIs von Fotos nicht umgesetzt werden kann."
}

Repo.insert! %Contribution{
  user_id: 3,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 02},
  link: "https://github.com/pgassmann/stream_from_pxw_x70",
  description: "Update vom Readme von meinem kleinen Skript zum Wireless Streaming der Sony PXW-X70 Kamera."
}

Repo.insert! %Contribution{
  user_id: 9,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 02},
  link: "https://github.com/amsibamsi/opengl-examples/commit/6f2dfc6c6b3facf6899083888c239edbf777d2fb",
  description: "Added simple color fill example with OpenGL ES 2.0 written in Go, based on previous example."
}

Repo.insert! %Contribution{
  user_id: 10,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 02},
  link: "https://github.com/puzzle/flyway-cdi-integration",
  description: "Bugfix"
}

Repo.insert! %Contribution{
  user_id: 12,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 02},
  link: "https://github.com/swiss/styleguide/pull/425",
  description: "Habe in der Dokumentation zu Swiss Admin Styleguide einen veralteten Link bezüglich Accessbility gefunden und mit einem Pull Request korrigiert."
}

Repo.insert! %Contribution{
  user_id: 6,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 02},
  link: "https://github.com/psunix/rocketsled",
  description: "Heute stelle ich meine EmberJS Applikation rocketsled der Öffentlichkeit zur Verfügung. Im Dezember sind noch diverse weitere Commits zu diesem Projekt vorgesehen."
}

Repo.insert! %Contribution{
  user_id: 5,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 02},
  link: "https://github.com/puzzle/puppet-openshift3/issues/2",
  description: "Nun habe ich begonnen die Dokumentation unseres OpenShift 3 Puppet Modules an das Puppet Forge README Template anzupassen und zu erweitern: https://github.com/puzzle/puppet-openshift3/blob/doc/README.md. Einerseits um das Modul für eine Veröffentlichung auf Puppet Forge vorzubereiten und andererseits um eine entsprechende Anfrage eines Nutzers zu erfüllen: https://github.com/puzzle/puppet-openshift3/issues/2"
}

Repo.insert! %Contribution{
  user_id: 4,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 02},
  link: "https://github.com/phil-pona/hexboard",
  description: "Ich habe heute für die OpenShift V3 hexboard Demo Applikation so angepasst, dass sie mit dem API für die Version 3.1 funktioniert."
}

Repo.insert! %Contribution{
  user_id: 4,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 02},
  link: "https://github.com/puzzle/flyway-cdi-integration/commit/43cf18082dfa5d6efd2455860f95d6d276d612a4",
  description: "Habe nun auch noch die Flyway CDI Integration von gestern erweitert, dass neu ein CDI Event gefeuert wird, wenn die Datenbankmigration erfolgreich abgeschlossen wurde. Diesen Event kann dazu verwendet werden, bspw. nach der Migration gewisse Validierungen (Hibernate Schema Validierung) auf der Datenbank auszuführen."
}

Repo.insert! %Contribution{
  user_id: 7,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 02},
  link: "https://github.com/mburri/break-out",
  description: "Für mein auf redux-pattern-basierendes-breakout-experiment-weiterbildungsprojekt habe ich heute folgendes gemacht:
- webpack und webpack-dev-server konfiguriert
- redux ins Projekt eingebunden (jetzt doch noch)
- den redux store erstellt und ein Proof of Concept gemacht, dass ich die verschiedenen Scenes des Spieles (also den Startscreen, Gamescreen, Pausescreen u.s.w.) über Eingaben des Benutzers im redux store wechseln und dann entsprechend als einfacher Text rendern kann. Das hat wunderbar geklappt."
}

Repo.insert! %Contribution{
  user_id: 6,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 03},
  link: "https://github.com/puzzle/cryptopus",
  description: "diverse Issue für Cryptopus erfasst. Zusätzlicher Commit."
}

Repo.insert! %Contribution{
  user_id: 4,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 03},
  link: "https://github.com/puzzle/opensource-advent-challenge-2015",
  description: "Die neue Open Source Advents Challenge Diary Seite wurde erstellt und unter: https://github.com/puzzle/opensource-advent-challenge-2015 veröffentlicht. Neu werden unsere Contributions direkt hier dokumentiert."
}

Repo.insert! %Contribution{
  user_id: 5,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 03},
  link: "https://github.com/nijel/weblate/pull/944",
  description: "Ich warte den OpenShift Support der webbasierten Übersetzungsplatform [Weblate](https://weblate.org/). Heute bin ich von [Philipp Grogg](https://github.com/gro-gg) darauf aufmerksam gemacht worden, dass sich die aktuelle Version von Weblate nicht mehr auf OpenShift installieren lässt. Ich habe entsprechend einen Pull Request implementiert der das Problem behebt: https://github.com/nijel/weblate/pull/944. In der Folge dann noch ein fast vergessenes Issue kommentiert: https://github.com/nijel/weblate/issues/920."
}

Repo.insert! %Contribution{
  user_id: 11,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 03},
  link: "https://github.com/lbischof/puzzle-forms/commit/859c452187c1b918de1bb900533155eaaef2c926",
  description: "Damit Puzzle Forms einfach für interessierte zugänglich ist, habe ich ein Dockerfile erstellt. Das Frontend funktioniert noch nicht, da wegen der Restrukturierung Fehler entstanden sind."
}

Repo.insert! %Contribution{
  user_id: 3,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 03},
  link: "https://tickets.puppetlabs.com/browse/MODULES-2874",
  description: "Beim Entwickeln von meinem Puppet-Modul für [Let’s Encrypt, das übrigens heute in die Public Beta Phase eintrat](https://letsencrypt.org/2015/12/03/entering-public-beta.html). Habe ich mich mit der getparam funktion aus dem stdlib modul auseinander gesetzt und deren unerwartetes Verhalten in einem Ticket erfasst. https://tickets.puppetlabs.com/browse/MODULES-2874"
}

Repo.insert! %Contribution{
  user_id: 10,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 03},
  link: "https://github.com/gro-gg/modjprof",
  description: "Dokumentation des Java Profilers [modjprof](https://github.com/gro-gg/modjprof) ergänzt."
}

Repo.insert! %Contribution{
  user_id: 7,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 03},
  link: "http://mburri.github.io/break-out/dist/index.html",
  description: "Heute habe ich den gh-pages branch für mein Projekt erstellt, so dass man jetzt die Weiterentwicklung des [Spiels](http://mburri.github.io/break-out/dist/index.html) mitverfolgen kann. Die verschiedenen Scenes werden jetzt in ein Canvas und nicht mehr als blosser Text gerendert. Spielen kann man noch nicht wirklich, ich habe aber die notwendigen Funktionen und den Reducer geschrieben, damit ich das dann morgen hoffentlich implementieren kann. Mit den Farben möchte ich übrigens alte EGA-Zeiten aufleben lassen - also brauchts dafür keine pull-requests oder issues!"
}

Repo.insert! %Contribution{
  user_id: 12,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 03},
  link: "https://rolandstuder.github.io/jeizinen-meteor/index.html",
  description: "Ich habe schon vor zwei Jahren begonnen für mich ein Framework für Prototyping von Webapplikationen auf Basis von Meteor.js zu entwicklen. Ich habe die Advents Challenge als Anlass genommen, das Projekt endlich unter eine MIT Lizenz gestellt."
}

Repo.insert! %Contribution{
  user_id: 9,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 03},
  link: "https://github.com/amsibamsi/profile",
  description: "Kleine Commits am eigenen Home Profil."
}

Repo.insert! %Contribution{
  user_id: 9,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 03},
  link: "https://github.com/fatih/vim-go/issues/639",
  description: "Antwort auf gemeldetes Problem mit vim-go Plugin."
}

Repo.insert! %Contribution{
  user_id: 13,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 04},
  link: "https://github.com/phil-matti/ipa-latex-template",
  description: "Latex-Template für die IPA nach Hermes."
}

Repo.insert! %Contribution{
  user_id: 14,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 04},
  link: "https://github.com/swiss/styleguide/pull/416",
  description: "Pull Request mit Fonts-Path-Fix für den admin.ch Styleguide wurde heute gemerged."
}

Repo.insert! %Contribution{
  user_id: 15,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 04},
  link: "https://github.com/palian/BlueFuturistic/pull/2",
  description: "Meine [Pebble Smartwatch](https://www.pebble.com/) hat ein Watchface, wo die Farben konfiguriert werden können. Die aktuelle Konfiguration wurde jedoch nicht auf meinem Smartphone angezeigt. Das habe ich verbessert und einen Pull Request gemacht: https://github.com/palian/BlueFuturistic/pull/2"
}

Repo.insert! %Contribution{
  user_id: 3,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 04},
  link: "https://github.com/pgassmann/puppet-letsencrypt",
  description: "Mein [Puppet-Modul für Let’s Encrypt](https://github.com/pgassmann/puppet-letsencrypt) ist auf GitHub gelandet."
}

Repo.insert! %Contribution{
  user_id: 2,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 04},
  link: "https://github.com/drnoa/schemaspy",
  description: "Eine erweiterte Version von [schemaspy](https://github.com/drnoa/schemaspy) ist auf GitHub gelandet. Thomas Philipona und ich haben vor längerem schon damit begonnen das Projekt auf freemaker templates zu migrieren."
}

Repo.insert! %Contribution{
  user_id: 2,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 04},
  link: "https://github.com/drnoa/bumblebee-installer",
  description: "Da die installation der proprietären Nvidia Treiber mit Bumblebee auf Linux immer ein rechtes gebastel ist, habe damit begonnen die Installation und Konfiguration in einem Script [bumblebee-installer](https://github.com/drnoa/bumblebee-installer) zu vereinfachen. Der installtationsteil ist bereits intgriert, die Konfiguration wird noch folgen."
}

Repo.insert! %Contribution{
  user_id: 4,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 04},
  link: "https://github.com/drnoa/schemaspy/pull/2",
  description: "Die erweiterte Version von [schemaspy](https://github.com/drnoa/schemaspy), welche [Daniel Binggeli](https://github.com/drnoa) heute veröffentlicht hat, erweitert. Im Pull Request https://github.com/drnoa/schemaspy/pull/2 wurde die Dokumenation angepasst und ein Changelog erstellt."
}

Repo.insert! %Contribution{
  user_id: 6,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 04},
  link: "https://github.com/puzzle/cryptopus",
  description: "[Cryptopus](https://github.com/puzzle/cryptopus): JavaScript aufgeräumt, Assets Precompile fixed"
}

Repo.insert! %Contribution{
  user_id: 16,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 04},
  link: "https://github.com/puzzle/cryptopus",
  description: "[Cryptopus](https://github.com/puzzle/cryptopus): Accounts search fixed, das Löschen eines Teams eingeschränkt"
}

Repo.insert! %Contribution{
  user_id: 12,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 04},
  link: "https://github.com/wearecube/device-lab-link-forwarder",
  description: "Publizieren des Open Device Lab Link Sharers auf Github mit einer MIT License.
Link-Sharer / Forwarder for Open Device Labs Whenenver you are in a Open Device Lab and you want to test an webapplication or website, you have the problem, that you have enter your URL on all the devices. We thought, that this is super inconvenient. So to help you with that
TADAAAA - enter linksharer https://github.com/wearecube/device-lab-link-forwarder"
}

Repo.insert! %Contribution{
  user_id: 5,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 04},
  link: "https://github.com/puzzle/puppet-openshift3/commit/ae52fa675907f7a1323b3963282cda3850e9fad7",
  description: "Der pull request von gestern wurde bereits wieder gemerged: https://github.com/nijel/weblate/commit/7300b564e77a14cbc479108dfd034d4b9c4715e4
Heute habe ich an der Dokumentation unserers OpenShift 3 Puppet Modules weitergearbeitet: https://github.com/puzzle/puppet-openshift3/commit/ae52fa675907f7a1323b3963282cda3850e9fad7"
}

Repo.insert! %Contribution{
  user_id: 7,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 04},
  link: "https://github.com/mburri/break-out",
  description: "it’s moooooving…"
}

Repo.insert! %Contribution{
  user_id: 11,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 04},
  link: "https://github.com/puzzle/opensource-advent-challenge-2015/commit/a09fb94b68611f431a13063f14fec8eb56ae1965",
  description: "Sicherstellen, dass die Advents Challenge Seite auf Handies nur in eine Richtung scrollt."
}

Repo.insert! %Contribution{
  user_id: 9,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 04},
  link: "https://linuxmonk.ch/wordpress/index.php/2015/setup-remote-server-management-of-a-supermicro-bmc-with-freeipmi-on-linux/",
  description: "Kommentar zu gutem Blog Post über IPMI"
}

Repo.insert! %Contribution{
  user_id: 10,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 04},
  link: "https://github.com/gro-gg/modjprof",
  description: "Dokumentation des Java Profilers [modjprof](https://github.com/gro-gg/modjprof) ergänzt."
}

Repo.insert! %Contribution{
  user_id: 6,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 05},
  link: nil,
  description: "[Cryptopus](https://github.com/puzzle/cryptopus): Heute hat Cryptopus development seeds für die User erhalten."
}

Repo.insert! %Contribution{
  user_id: 7,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 05},
  link: nil,
  description: "[Man kann jetzt tatsächlich spielen (und verlieren)](http://mburri.github.io/break-out/dist/index.html)
- ich musste einige Teile der Applikation anpassen und habe einiges über die redux reducers, vor allem über die Kombination mehrerer reducers, gelernt.
- aus heiterem Himmel kam mein erster (nicht Puzzler) Follower [vom anderen Ende der Welt](https://github.com/TomClarkson)."
}

Repo.insert! %Contribution{
  user_id: 13,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 05},
  link: nil,
  description: "[c-for-sys-linux](https://github.com/phil-matti/c-for-sys-linux) Ich erstelle einige Beispiele für die Nutzung von C unter Linux. Ziel ist es, einen eigenen Daemon zu programmieren und möglichst viel dabei zu lernen."
}

Repo.insert! %Contribution{
  user_id: 4,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 05},
  link: nil,
  description: "Copy & Paste Fehler im offiziellen Wildfly 9 STI Dockerfile gefixed und per [Pull Request](https://github.com/openshift/sti-wildfly/pull/62) eingegeben, Pull Request gemerged.
Zusätzlich habe ich heute den Wildfly 10.0.0CR4 im OpenShift [Wildfly S2I Repo](https://github.com/phil-pona/sti-wildfly/) hinzugefügt und dafür einen [Pull Request](https://github.com/openshift/sti-wildfly/pull/63) erstellt."
}

Repo.insert! %Contribution{
  user_id: 17,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 05},
  link: nil,
  description: "Initiales Projekt-Setup für das AngularJS-Modul [ng-user-auth](https://github.com/guggero/ng-user-auth): Projekt-Skeleton mit Karma-Tests und Travis-CI-Integration."
}

Repo.insert! %Contribution{
  user_id: 11,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 05},
  link: nil,
  description: "Ich habe heute mehrere kleine Änderungen an [Puzzle Forms](https://github.com/lbischof/puzzle-forms) gemacht. Es gibt jetzt neu ein Configfile und der Prozess im Dockercontainer läuft nicht mehr als root. Zusätzlich habe ich eine neue Library eingesetzt welche das neue [Fetch API](https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API) einsetzt und endlich [XMLHttpRequest](https://developer.mozilla.org/de/docs/Web/API/XMLHttpRequest) ablöst."
}

Repo.insert! %Contribution{
  user_id: 16,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 05},
  link: nil,
  description: "Heute habe ich das ERD vom Cryptopus erneuert: <https://github.com/puzzle/cryptopus/wiki>"
}

Repo.insert! %Contribution{
  user_id: 5,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 05},
  link: nil,
  description: "OpenShift Enterprise 3.1 enthält nun einen integrierten EFK (Elasticsearch, Fluentd, Kibana) Stack um alle Container- und Platformlogs aggregrieren und analysieren zu können. Dessen Installation erfordert momentan noch diverse manuelle Schritte. Ich habe heute begonnen diese in unserem OpenShift 3 Puppet Modul zu automatisieren: <https://github.com/puzzle/puppet-openshift3/commits/logging>"
}

Repo.insert! %Contribution{
  user_id: 3,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 05},
  link: nil,
  description: "Letsencrypt Puppet Modul auf Forge hochgeladen: <https://forge.puppetlabs.com/pgassmann/letsencrypt>
Alternatives Letsencrypt Puppetmodul gefunden: <https://forge.puppetlabs.com/danzilio/letsencrypt>"
}

Repo.insert! %Contribution{
  user_id: 2,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 05},
  link: nil,
  description: "[bumblebee-installer](https://github.com/drnoa/bumblebee-installer) um Konfigurationsteil erweitert. Ist sicher noch nicht für jeden Rechner geeignet, aber lokal funktioniert das ganze bereits."
}

Repo.insert! %Contribution{
  user_id: 10,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 05},
  link: nil,
  description: "Dokumentation des Java Profilers [modjprof](https://github.com/gro-gg/modjprof) ergänzt."
}

Repo.insert! %Contribution{
  user_id: 4,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 06},
  link: nil,
  description: "Heute habe ich versucht die [Symfony2 Demo Applikation](https://github.com/symfony/symfony-demo) auf OpenShift V3 zu deployen. Dabei habe ich festgestellt, dass das aktuelle [PHP OpenShift S2I Image](https://github.com/openshift/sti-php) keine Scripts in der Assemble Phase ausführt, habe dazu nun einen [Issue](https://github.com/openshift/sti-php/issues/73) erfasst.
Das Ziel ist es für die Demo Applikation ein OpenShift 3 Template zu erstellen, mit welchem die Applikation per Knopfdruck auf OpenShift 3 deployed werden kann.
Die erste Version dieses Templates habe ich heute auf [GitHub](https://github.com/phil-pona/ose3-symfony2-ex) bestellt.
Zusätzlich wurde heute mein gestriger [Pull Request](https://github.com/openshift/sti-wildfly/pull/63) gemerged. Das Openshift Wildfly10 Docker Image ist ab sofort auf [Dockerhub](https://hub.docker.com/r/openshift/wildfly-100-centos7/) verfügbar."
}

Repo.insert! %Contribution{
  user_id: 11,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 06},
  link: nil,
  description: "Ich habe heute angefangen für [Respondcms](https://github.com/madoublet/respond) ein Dockerfile zu schreiben. [respondcms-docker](https://github.com/lbischof/respondcms-docker)."
}

Repo.insert! %Contribution{
  user_id: 13,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 06},
  link: nil,
  description: "[c-for-sys-linux](https://github.com/phil-matti/c-for-sys-linux) Ich habe noch die verwendeten Libraries kommentiert und ein Programm geschrieben das in ein File schreiben kann und ein paar kleinere Anpassungen gemacht."
}

Repo.insert! %Contribution{
  user_id: 17,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 06},
  link: nil,
  description: "Version 0.0.2 von [ng-user-auth](https://github.com/guggero/ng-user-auth): Projekt-unabhängiges Modul erstellt, Dependencies aufgeräumt und alle Tests lauffähig gemacht."
}

Repo.insert! %Contribution{
  user_id: 6,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 06},
  link: nil,
  description: "[Cryptopus](https://github.com/puzzle/cryptopus): Development Seeder ausgebaut"
}

Repo.insert! %Contribution{
  user_id: 5,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 06},
  link: nil,
  description: "An der Automatisierung der Installation des OpenShift Enterprise EFK Stacks weitergearbeitet: <https://github.com/puzzle/puppet-openshift3/commits/logging>"
}

Repo.insert! %Contribution{
  user_id: 9,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 06},
  link: nil,
  description: "OpenGL Beispiel implementiert, wie man eine Textur als Hintergrund des ganzen Fensters anzeigt. Könnte gebraucht werden um das Rasterizing Komplett auf der CPU zu rechnen und dann das fertige Bild nur noch mittels OpenGL anzuzeigen. Der Umweg über OpenGL hat den Vorteil, dass dies auf vielen Plattformen gleich funktioniert und nur einmal implementiert werden muss, da OpenGL weit verbreitet ist. <https://github.com/amsibamsi/opengl-examples/tree/master/bitmap>"
}

Repo.insert! %Contribution{
  user_id: 10,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 06},
  link: nil,
  description: "Dokumentation des Java Profilers [modjprof](https://github.com/gro-gg/modjprof) ergänzt."
}

Repo.insert! %Contribution{
  user_id: 3,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 06},
  link: nil,
  description: "[Cryptopus](https://github.com/puzzle/cryptopus): Feature request [Encrypted Notes](https://github.com/puzzle/cryptopus/issues/32)"
}

Repo.insert! %Contribution{
  user_id: 4,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 07},
  link: nil,
  description: "Heute habe ich die Dokumentation um das openshift/wildfly-100-centos7 erweitert und als [Pull Request](https://github.com/openshift/sti-wildfly/pull/65) eingegeben.
Des Weiteren habe ich das [sti-php](https://github.com/phil-pona/sti-php) geforked und die im [Issue](https://github.com/openshift/sti-php/issues/73) beschriebene Lösung von gestern umgesetzt. Und entsprechend das [OpenShift V 3 Symfony Template angepasst](https://github.com/phil-pona/ose3-symfony2-ex) und die Dokumentation angepasst."
}

Repo.insert! %Contribution{
  user_id: 12,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 07},
  link: nil,
  description: "Ein Minicommit an mein prototyping framework. Autobinding funktioniert jetzt auch wenn, das input Feld keinen type aufweist. [commit](https://github.com/RolandStuder/jeizinen-meteor/commit/28bb3a8a8191ec01e97662f69bde80e2dbd67b91)"
}

Repo.insert! %Contribution{
  user_id: 6,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 07},
  link: nil,
  description: "[Cryptopus](https://github.com/puzzle/cryptopus): Auch heute gibt es wieder was für Cryptopus. Neue Methode für das Erstellen von Teams erstellt und getestet. Damit sind wir dem Ziel die Business Logik aus den Controller zu entfernen einen Schritt näher."
}

Repo.insert! %Contribution{
  user_id: 10,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 07},
  link: nil,
  description: "Refactoring des Java Profilers [modjprof](https://github.com/gro-gg/modjprof)."
}

Repo.insert! %Contribution{
  user_id: 16,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 07},
  link: nil,
  description: "Heute habe ich im Cryptopus einen Bug behoben, damit die Teams wieder angezeigt werden und eine neue Wiki Seite zum Thema Permissions erstellt [Cryptopus](https://github.com/puzzle/cryptopus)."
}

Repo.insert! %Contribution{
  user_id: 11,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 07},
  link: nil,
  description: "Ich habe heute versucht die Berechtigungen auf einem Dockervolume zu ändern. Die schwierigkeit ist, dies Host unabhängig zu machen. Ich bin mit der aktuellen Lösung noch nicht zufrieden und werde es in den nächsten Tagen noch überarbeiten. Zusätzlich habe ich [nginx-proxy](https://github.com/jwilder/nginx-proxy) ausprobiert und anfänglich eingebaut. [respondcms-docker](https://github.com/lbischof/respondcms-docker)"
}

Repo.insert! %Contribution{
  user_id: 3,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 07},
  link: nil,
  description: "Letsencrypt Module: Info an Alternative: https://github.com/danzilio/puppet-letsencrypt/issues/4 &
Feedback Issue für mein Modul: https://github.com/pgassmann/puppet-letsencrypt/issues/1"
}

Repo.insert! %Contribution{
  user_id: 4,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 08},
  link: nil,
  description: "Der [Pull Request](https://github.com/openshift/sti-wildfly/pull/65) von gestern wurde gemerged. Des Weiteren habe ich angefangen unser [OSE3 Docker Builder](https://github.com/puzzle/puzzle-ose3-docker-builder) in einem [Fork](https://github.com/phil-pona/puzzle-ose3-docker-builder) auf die Origin Version umzuschreiben."
}

Repo.insert! %Contribution{
  user_id: 2,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 08},
  link: nil,
  description: "Eine kleine Anpassung des Readmes von gestern noch korrigiert und ein paar Kommentare im Script ergänzt. Gestern habe ich zudem den bumblebee-indicator in den Installer integriert. Da das nur eine kleine Contribution war, erwähne ich das erst heute. [Bumblebee-Installer](https://github.com/drnoa/bumblebee-installer)"
}

Repo.insert! %Contribution{
  user_id: 6,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 08},
  link: nil,
  description: "[Cryptopus](https://github.com/puzzle/cryptopus): Ja auch am 8. Tag gibt es wieder einen Commit an Cryptopus. Diesmal sind es einige Controller Tests sowie das Auslagern der Business-Logik in die Models. Cheers."
}

Repo.insert! %Contribution{
  user_id: 10,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 08},
  link: nil,
  description: "Refactoring des Java Profilers [modjprof](https://github.com/gro-gg/modjprof)."
}

Repo.insert! %Contribution{
  user_id: 11,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 08},
  link: nil,
  description: "Cleanup und refactoring vom IPA Latex-Template. [pull request](https://github.com/phil-matti/ipa-latex-template/pull/1)"
}

Repo.insert! %Contribution{
  user_id: 8,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 08},
  link: nil,
  description: "[Pull Request](https://github.com/hitobito/hitobito/pull/15) von Hitobito bearbeitet.
[RAAR](https://github.com/radiorabe/raar) ist eine Applikation zum Verwalten und Durchstöbern eines Audio Archivs. [Seed Daten](https://github.com/radiorabe/raar/commit/f5d36186963d00248dd8c71f9e048f84dcf765b5) für die Airtime Datenbank hinzugefügt."
}

Repo.insert! %Contribution{
  user_id: 4,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 09},
  link: nil,
  description: "Heute habe ich die Dokumentation vom [schemaspy](https://github.com/drnoa/schemaspy) aktualisiert und um die how to Build schemaspy erweiertern. Des Weiteren habe ich im schemaspy Projekt die Branches aufgeräumt. Neu ist der Master Branch der aktuelle HEAD.
Zusätzlich habe ich die [Symfony2 Demo Applikation](https://github.com/symfony/symfony-demo) auf OpenShift 3 zum Laufen gebracht. Dafür musste das [sti-php Image](https://github.com/phil-pona/sti-php) entsprechend angepasst werden, das [OpenShift 3 Template](https://github.com/phil-pona/ose3-symfony2-ex) ist auch veröffentlicht.
Für die Bugs im sti-php image werde ich einen Pull Request eröffnen und meine Fixes einspielen lassen."
}

Repo.insert! %Contribution{
  user_id: 11,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 09},
  link: nil,
  description: "Heute habe ich meinen Repositories eine Lizenz gegeben. Ich habe mich für die [MIT](https://opensource.org/licenses/MIT) Lizenz entschieden, weil sie viel Freiheit erlaubt und jegliche Haftung ausschliesst.
Mein [pull request](https://github.com/phil-matti/ipa-latex-template/pull/1) von gestern wurde gemerged. Paar kleine Rechtschreibfehler [korrigiert](https://github.com/drnoa/schemaspy/pull/5)."
}

Repo.insert! %Contribution{
  user_id: 6,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 09},
  link: nil,
  description: "[Cryptopus](https://github.com/puzzle/cryptopus): Es geht weiter mit Cryptopus. Heute habe ich damit begonnen den Style mehr Bootstrap-like zu gestalten. Ausserdem sehe ich noch einiges an Vereinfachungspotential. Ziel ist es die ganzen Views aufzuräumen. Die Änderungen sind auf dem v2-styling Branch da es noch einiges an Arbeit benötigt bis das Userinterface mit dem neuen Style brauchbar ist."
}

Repo.insert! %Contribution{
  user_id: 10,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 09},
  link: nil,
  description: "Refactoring des Java Profilers [modjprof](https://github.com/gro-gg/modjprof)."
}

Repo.insert! %Contribution{
  user_id: 18,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 09},
  link: nil,
  description: "Ich habe mich in mein vor 5 Jahren gestartetes Projekt [fadecut](https://github.com/micressor/fadecut) wieder eingearbeitet und einige Issues erfasst."
}

Repo.insert! %Contribution{
  user_id: 7,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 09},
  link: nil,
  description: "Nachdem ich einige materielle Dinge in die Open Source Welt entlassen hatte, habe ich mich jetzt wieder meinem [Projekt](https://github.com/mburri/break-out) gewidmet.
Dabei habe ich gemerkt, dass ich ziemlich auf dem Holzweg war, und habe begonnen, meine Applikation umzubauen - wodurch jetzt alles einfacher wird. Im Moment ist aber alles ein bisschen ein durcheinander - aber die Challange dauert noch ein paar Tage an..."
}

Repo.insert! %Contribution{
  user_id: 8,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 09},
  link: nil,
  description: "[RAAR](https://github.com/radiorabe/raar) ist eine Applikation zum Verwalten und Durchstöbern eines Audio Archivs. Einen ersten Wurf des [Imports](https://github.com/radiorabe/raar/commit/4079167128b8eade69268670dd6cfd3954356807) implementiert."
}

Repo.insert! %Contribution{
  user_id: 5,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 09},
  link: nil,
  description: "Einfaches Docker Hello World Beispiel implementiert welches mit dem Python SimpleHTTPServer eine statische Webseite ausliefert: <https://github.com/puzzle/openshift3-docker-hello>. Ich benutze dieses z.B. um OpenShift 3 custom Docker builders zu testen welche Dockerfile und Docker context nicht via Git beziehen."
}

Repo.insert! %Contribution{
  user_id: 3,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 09},
  link: nil,
  description: "[Puppet Setup All-In-One](https://github.com/pgassmann/puppet-setup): [Support for Redhat osfamily](https://github.com/pgassmann/puppet-setup/commit/46d39aa02aa05760e4265098f2290f93d31e8855)"
}

Repo.insert! %Contribution{
  user_id: 4,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 10},
  link: nil,
  description: "Ich habe heute die Issues am [sti-php Image](https://github.com/phil-pona/sti-php) gefixed und einen entsprechenden [Pull Request](https://github.com/openshift/sti-php/pull/75) erstellt. Mal schauen, was der OpenShift-Bot dazu meint ;-)"
}

Repo.insert! %Contribution{
  user_id: 16,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 10},
  link: nil,
  description: "Ich habe heute im [Cryptopus](https://github.com/puzzle/cryptopus) ein feature implementiert, damit nur noch admins Teams löschen können."
}

Repo.insert! %Contribution{
  user_id: 11,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 10},
  link: nil,
  description: "Damit mein [Dockercontainer](https://github.com/lbischof/respondcms-docker) einfach in die Produktion deployed werden kann, habe ich [xip.io](http://xip.io) eingebaut. Dies ermöglicht Subdomains während der Entwicklung ohne DNS Änderungen."
}

Repo.insert! %Contribution{
  user_id: 6,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 10},
  link: nil,
  description: "[Cryptopus](https://github.com/puzzle/cryptopus): Heute habe ich den Team Seeder gefixt."
}

Repo.insert! %Contribution{
  user_id: 3,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 10},
  link: nil,
  description: "[LXD Container \"Hypervisor\"](https://linuxcontainers.org/lxd): Mail mit Feedback und Fragen an Entwickler Stéphane Graber und dann zwei Issues erstellt: [lxc enter container name](https://github.com/lxc/lxd/issues/1395) und [lxc edit push and pull on stopped containers](https://github.com/lxc/lxd/issues/1394)"
}

Repo.insert! %Contribution{
  user_id: 4,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 11},
  link: nil,
  description: "Heute habe ich den [schemaspy](https://github.com/drnoa/schemaspy) um einen TemplateService Test erweitert. Ziel ist es, die Testabdeckung zu erhöhen, damit wir anschliessend refactoren können."
}

Repo.insert! %Contribution{
  user_id: 17,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 11},
  link: nil,
  description: "Habe Version 0.0.3 von [ng-user-auth](https://github.com/puzzle/ng-user-auth) erstellt und das GIT-Repo von meinem eigenen zu dem von Puzzle ITC verschoben. Zudem habe ich mit einer Sample-/Demo-Applikation für das Modul begonnen."
}

Repo.insert! %Contribution{
  user_id: 6,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 11},
  link: nil,
  description: "[Cryptopus](https://github.com/puzzle/cryptopus): Es ging weiter mit dem Styling des UIs. Heute war das Login sowie die Navigationsbar an der Reihe."
}

Repo.insert! %Contribution{
  user_id: 11,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 11},
  link: nil,
  description: "Dokumentieren wie man Cryptopus in einem Docker Container startet. [pull request](https://github.com/puzzle/cryptopus/pull/33)"
}

Repo.insert! %Contribution{
  user_id: 18,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 11},
  link: nil,
  description: "Ich konnte heute selber nichts contributen. Aber dafür hat der Debian Package Manager [micressor](https://github.com/micressor) in den letzten zwei Tagen ein paar Issues von [fadecut](https://github.com/micressor/fadecut) kommentiert und eines konnte er sogar schliessen. Ausserdem hat er das Testing-Framework erweitert. Wir haben uns abgesprochen dass er sich hauptsächlich um die Tests und die Debian Packaging Themen kümmert, während ich weiter an gewünschten Features arbeite."
}

Repo.insert! %Contribution{
  user_id: 18,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 12},
  link: nil,
  description: "Heute habe ich wieder an [fadecut](https://github.com/micressor/fadecut) weitergearbeitet:
* Ich habe weitere Issues erfasst und ein wenig sortiert, Labels umbenannt und den Milestone für Version 0.2.0 erfasst.
* Auf Github habe ich eine Organisation für fadecut erstellt [Organisation Fadecut](https://github.com/fadecut)
* Eine erste Version für ein Logo erstellt
* Eine Funktion erstellt, die das Auflisten aller vorhandenen fadecut Profile ermöglicht"
}

Repo.insert! %Contribution{
  user_id: 4,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 12},
  link: nil,
  description: "Heute habe ich den [schemaspy](https://github.com/drnoa/schemaspy) um weitere Tests erweitert. So können wir nun die MainIndex Seite refactoren."
}

Repo.insert! %Contribution{
  user_id: 17,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 12},
  link: nil,
  description: "Habe Version 0.0.4 von [ng-user-auth](https://github.com/puzzle/ng-user-auth) erstellt: Modul konfigurierbar gemacht."
}

Repo.insert! %Contribution{
  user_id: 14,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 12},
  link: nil,
  description: "Habe am [Hologram Github Theme](https://github.com/wearecube/hologram-github-theme) gearbeitet:
* Fix für eine überfällige [CSS Issue](https://github.com/wearecube/hologram-github-theme/issues/3) gepusht.
* Das [Hologram Github Theme Example](https://github.com/wearecube/hologram-github-theme-example) (Beispielprojekt, welches das Hologram Github Theme für den Styleguide verwendet) von Grunt auf NPM-only Build umgestellt.
* READMEs der beiden Repositories ergänzt.
* Version 0.1.4 des Hologram Github Theme released und zusätzlich als [NPM Package](https://www.npmjs.com/package/hologram-github-theme) zur Verfügung gestellt (bisher gab es nur ein Bower Package).
*"
}

Repo.insert! %Contribution{
  user_id: 6,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 12},
  link: nil,
  description: "[Cryptopus](https://github.com/puzzle/cryptopus): Heute hat Cryptopus ein neues Logo erhalten."
}

Repo.insert! %Contribution{
  user_id: 5,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 12},
  link: nil,
  description: "An der Automatisierung der Installation des OpenShift Enterprise EFK Stacks weitergearbeitet: <https://github.com/puzzle/puppet-openshift3/commits/logging>"
}

Repo.insert! %Contribution{
  user_id: 2,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 13},
  link: nil,
  description: "Ich habe heute den [schemaspy](https://github.com/drnoa/schemaspy) noch um eine weitere Prüfung in den Tests erweitert. So können wir nun zusätzlich auch die die Tabellen Seite refactoren und noch fertig mit freemaker templates umbauen."
}

Repo.insert! %Contribution{
  user_id: 18,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 13},
  link: nil,
  description: "Weitere commits an [fadecut](https://github.com/micressor/fadecut):"
}

Repo.insert! %Contribution{
  user_id: 4,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 13},
  link: nil,
  description: "Heute habe ich im [schemaspy](https://github.com/drnoa/schemaspy) einen Integration Test basierend auf einer H2 DB gebaut. Mit dem können wir nun einfach ganze Reportgenerations testen und entsprechend die einzelnen Bereiche in den Reports anpassen, resp. erweitern. Zusätzlich habe ich die Table Page noch einige Bereiche informationen erweitert."
}

Repo.insert! %Contribution{
  user_id: 11,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 13},
  link: nil,
  description: "Heute habe ich die erste Version von [puzzle-laptop-bootstrap](https://github.com/lbischof/puzzle-laptop-bootstrap) gepusht."
}

Repo.insert! %Contribution{
  user_id: 13,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 13},
  link: nil,
  description: "Ich habe heute das [ipa-latex-template](https://github.com/phil-matti/ipa-latex-template) gefixt, es gab einen import Error + Readme erweitert für die Installation unter Ubuntu 14.04 und Windows 7."
}

Repo.insert! %Contribution{
  user_id: 6,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 13},
  link: nil,
  description: "[Cryptopus](https://github.com/puzzle/cryptopus): So, Cryptopus in neuem Kleid. Bootstrap Tabellen und Form Items."
}

Repo.insert! %Contribution{
  user_id: 5,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 13},
  link: nil,
  description: "An der Automatisierung der Installation des OpenShift Enterprise EFK Stacks weitergearbeitet: <https://github.com/puzzle/puppet-openshift3/commits/logging>"
}

Repo.insert! %Contribution{
  user_id: 19,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 14},
  link: nil,
  description: "[backupcheck_ng](https://github.com/sandroBeffa/amanda_restore_check): Released backupcheck_ng, a python script which does automatic backup restore checking"
}

Repo.insert! %Contribution{
  user_id: 4,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 14},
  link: nil,
  description: "Heute habe ich die ConstraintsPage im [schemaspy](https://github.com/drnoa/schemaspy) mit Freemarker Templates implementiert und die Freemarker Version auf 2.3.23 aktualisiert. Zudem habe ich im Integration Test von gestern weitere Checks implementiert."
}

Repo.insert! %Contribution{
  user_id: 6,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 14},
  link: nil,
  description: "[Cryptopus](https://github.com/puzzle/cryptopus): Mit meinem heutigen Commit ist es nicht mehr möglich als Root ein Team zu erstellen mit dem Flag noroot."
}

Repo.insert! %Contribution{
  user_id: 18,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 14},
  link: nil,
  description: nil
}

Repo.insert! %Contribution{
  user_id: 11,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 14},
  link: nil,
  description: "Weitere [Änderungen](https://github.com/phil-matti/ipa-latex-template/pull/4) am [IPA Latex-Template](https://github.com/phil-matti/ipa-latex-template)"
}

Repo.insert! %Contribution{
  user_id: 6,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 15},
  link: nil,
  description: "[Profile](https://github.com/psunix/profile): Anstelle eines Commits für Cryptopus gibt es heute mal einen kleinen Bash Script. Mit dem Befehl 'cdg' wechselt man in das Haupt-Verzeichnis des aktuellen Git-Repos."
}

Repo.insert! %Contribution{
  user_id: 4,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 15},
  link: nil,
  description: "Heute habe ich die OrphansPage im [schemaspy](https://github.com/drnoa/schemaspy) mit Freemarker Templates implementiert."
}

Repo.insert! %Contribution{
  user_id: 18,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 15},
  link: nil,
  description: "Heute habe ich 6 kleine Bugs von [fadecut](https://github.com/fadecut/fadecut) repariert."
}

Repo.insert! %Contribution{
  user_id: 11,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 15},
  link: nil,
  description: "Heute habe ich beim [IPA Latex-Template](https://github.com/phil-matti/ipa-latex-template) ein Dockerfile mit der aktuellen Texlive-Version hinzugefügt. Zusätzlich habe ich das Packet für Codeblöcke ausgetauscht. [Pull Request](https://github.com/phil-matti/ipa-latex-template/pull/5)"
}

Repo.insert! %Contribution{
  user_id: 13,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 15},
  link: nil,
  description: "Optimierung des Dockerfiles von 7 auf 3 build-steps, so werden nur 3 Subcontainer generiert was den Buildprozess erheblich verkürzt beim [IPA Latex-Template](https://github.com/phil-matti/ipa-latex-template)."
}

Repo.insert! %Contribution{
  user_id: 20,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 15},
  link: nil,
  description: "Ich habe den Initialen Commit meines rudimentären Photo Sortierungsskript [Sortmypics](https://github.com/puzzle/sortmypics)  hinzugefügt."
}

Repo.insert! %Contribution{
  user_id: 11,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 16},
  link: nil,
  description: "Ich habe das [Dashing](http://dashing.io)-Widget, welches die aktuelle Aaretemperatur anzeigt, veröffentlicht. [dashing-aare-temperatur](https://github.com/lbischof/dashing-aare-temperatur)"
}

Repo.insert! %Contribution{
  user_id: 4,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 16},
  link: nil,
  description: "Heute habe ich auf der OrphansPage im [schemaspy](https://github.com/drnoa/schemaspy) ein Template Fehler geflickt und ensprechend die Tests erweitert."
}

Repo.insert! %Contribution{
  user_id: 6,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 16},
  link: nil,
  description: "[Cryptopus](https://github.com/puzzle/cryptopus): Message Flash in der View wieder eingebaut. Zwei Bugs beim Erstellen eines Teams gefixt."
}

Repo.insert! %Contribution{
  user_id: 18,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 16},
  link: nil,
  description: "Issues von [fadecut](https://github.com/fadecut/fadecut) erfasst und kommentiert. Am -quiet und -verbose mode gearbeitet."
}

Repo.insert! %Contribution{
  user_id: 8,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 16},
  link: nil,
  description: "[RAAR](https://github.com/radiorabe/raar) ist eine Applikation zum Verwalten und Durchstöbern eines Audio Archivs. Weiter am [Import](https://github.com/radiorabe/raar/commit/00f3458946a4aafd850d64ffb4f6e047b6e16589) gearbeitet."
}

Repo.insert! %Contribution{
  user_id: 11,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 17},
  link: nil,
  description: "Ich habe das [dashing-zenoss](https://github.com/lbischof/dashing-zenoss) Widget veröffentlicht."
}

Repo.insert! %Contribution{
  user_id: 4,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 17},
  link: nil,
  description: "Heute habe ich den Integration Test des [schemaspy](https://github.com/drnoa/schemaspy)s erweitert, dass man neu das generierte Resultat auf Filebasis vergleichen kann So kann sichergestellt werden, dass die Reports beim Refactoring inhaltlich gleich bleiben."
}

Repo.insert! %Contribution{
  user_id: 6,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 17},
  link: nil,
  description: "[Cryptopus](https://github.com/puzzle/cryptopus): Team Controller Tests updated."
}

Repo.insert! %Contribution{
  user_id: 4,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 18},
  link: nil,
  description: "Heute habe ich die Testdatenbank im Projekt [schemaspy](https://github.com/drnoa/schemaspy) um eine View erweitert und dies entsprechend im Integration Test angepasst. Des Weiteren habe ich die beiden Templates InsertionOrder und die DeletionOrder als Freemarker Templates umgesetzt und entsprechend eingebaut."
}

Repo.insert! %Contribution{
  user_id: 6,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 18},
  link: nil,
  description: "[Profile](https://github.com/psunix/profile): Heute habe ich meine i3wm config überarbeitet und auf Github zur Verfügung gestellt. Mein Default Bash Include File habe ich um zwei weitere Befehle erweitert."
}

Repo.insert! %Contribution{
  user_id: 11,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 18},
  link: nil,
  description: "[IPA Latex-Template](https://github.com/phil-matti/ipa-latex-template): Ich habe die Dokumentation ergänzt und ein bisschen umstrukturiert. Auch das Dockerfile ist jetzt übersichtlicher. [Pull Request](https://github.com/phil-matti/ipa-latex-template/pull/7)"
}

Repo.insert! %Contribution{
  user_id: 18,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 18},
  link: nil,
  description: nil
}

Repo.insert! %Contribution{
  user_id: 17,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 18},
  link: nil,
  description: "Version 0.0.5 von [ng-user-auth](https://github.com/puzzle/ng-user-auth) fertig gestellt: Beispiel-Applikation komplettiert, Testabdeckung verbessert, mehr Konfigurationsmöglichkeiten eingebaut und generelles Cleanup."
}

Repo.insert! %Contribution{
  user_id: 4,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 19},
  link: nil,
  description: "Heute habe ich die Testdatenbank im Projekt [schemaspy](https://github.com/drnoa/schemaspy) um Functions erweitert und dies entsprechend im Integration Test angepasst. 
Zusätzlich wurde mein [Issue](https://github.com/openshift/sti-php/issues/73) kommentiert und als PR eingegeben."
}

Repo.insert! %Contribution{
  user_id: 17,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 19},
  link: nil,
  description: "Dokumentation zu [ng-user-auth](https://github.com/puzzle/ng-user-auth) hinzugefügt und Version 0.1.0 released!"
}

Repo.insert! %Contribution{
  user_id: 6,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 19},
  link: nil,
  description: "[Cryptopus](https://github.com/puzzle/cryptopus): Bei der aktuellen V2 Version hat sich ein Bug eingeschlichen das keine Teammembers mehr angezeigt werden. Fixed :)"
}

Repo.insert! %Contribution{
  user_id: 18,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 19},
  link: nil,
  description: "an der logging Funktion von [fadecut](https://github.com/fadecut/fadecut) gearbeitet. Da ist noch etwas Baustelle... immerhin wieder etwas verbessert."
}

Repo.insert! %Contribution{
  user_id: 18,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 20},
  link: nil,
  description: nil
}

Repo.insert! %Contribution{
  user_id: 4,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 20},
  link: nil,
  description: "Die Columns Page des [schemaspy](https://github.com/drnoa/schemaspy)s wird nun auch mittels Freemarker Template generiert. Zusätzlich wurde die Legende als Komponente definiert und auf der Tables Seite integriert."
}

Repo.insert! %Contribution{
  user_id: 6,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 20},
  link: nil,
  description: "[Cryptopus](https://github.com/puzzle/cryptopus): Neuen Footer eingefügt und Flash Message Div auf fixed geändert."
}

Repo.insert! %Contribution{
  user_id: 13,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 20},
  link: nil,
  description: "[server-names](https://github.com/phil-matti/server-names): Wenn man eine neue Serverfarm aufbaut benötigt man auch ein paar Namen, pull requests welcome."
}

Repo.insert! %Contribution{
  user_id: 8,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 20},
  link: nil,
  description: "[RAAR](https://github.com/radiorabe/raar) ist eine Applikation zum Verwalten und Durchstöbern eines Audio Archivs. Weiter am [Import](https://github.com/radiorabe/raar/commit/ecd8f1b93f84d31ef52d881e465749b62a576823) gearbeitet."
}

Repo.insert! %Contribution{
  user_id: 5,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 20},
  link: nil,
  description: "OpenShift Enterprise 3.1 enthält nun einen integrierten metrics stack basierend Heapster, Hawkular und Cassandra um Metriken wie CPU- und Speicherverbrauch aller Container aggregrieren und analysieren zu können. Dessen Installation erfordert momentan noch diverse manuelle Schritte. Ich habe heute begonnen diese in unserem OpenShift 3 Puppet Modul zu automatisieren: <https://github.com/puzzle/puppet-openshift3/commits/metrics>"
}

Repo.insert! %Contribution{
  user_id: 4,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 21},
  link: nil,
  description: "Junittests im [schemaspy](https://github.com/drnoa/schemaspy) gefixed und die Implementation der Relationship Page als Freemarkertemplate gestartet."
}

Repo.insert! %Contribution{
  user_id: 7,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 21},
  link: nil,
  description: "Der Enthusiasmus für mein [redux-breakout clone](http://mburri.github.io/break-out/dist/index.html) ist etwas erlahmt... ich habe noch ein paar Sachen ergänzt, und man kann jetzt eigentlich spielen. Aber da fehlt noch einiges... vielleicht macht ja mal jemand weiter. Ich habe aber einiges gelernt über redux, vor allem aber über ES2015 und einige mir vorher nicht sehr vertraute javascript (front-end) tools und libraries:
- babel: damit man all die fancy ES2015-features schon heute gebrauchen kann.
- webpack: next gen module loader und grunt/ gulp Ersatz?
- immutable.js: Immutability will erzwungen sein.
- mocha/ chai: unit testing in Javascript.
In der Zwischenzeit habe ich ein neues Projekt gestartet: https://github.com/mburri/kicker-planner
Frei nach einer Idee von Daniel Ehrensperger - wieder mit redux, diesmal sollen aber dann auch ein server, websockets und react.js hinzukommen... und wenn alles gut läuft, können wir das vielleicht bei uns intern auf OpenShift deployen und verwenden..."
}

Repo.insert! %Contribution{
  user_id: 6,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 21},
  link: nil,
  description: "[Cryptopus](https://github.com/puzzle/cryptopus): Locale Drop-Down in Footer eingefügt."
}

Repo.insert! %Contribution{
  user_id: 20,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 21},
  link: nil,
  description: "Weiterentwicklung zu Objektorientertiert. Wieder das Python Know How aufgefrischt. Macht Spass :-). Copy Funktion muss noch erweitert/geflickt werden. Mag nicht mehr, bin zu müde."
}

Repo.insert! %Contribution{
  user_id: 2,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 22},
  link: nil,
  description: "Code Review bei Thömus Contribution durchgeführt und die Exlipse Project und Settings Files auf gitignore gesetzt."
}

Repo.insert! %Contribution{
  user_id: 4,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 22},
  link: nil,
  description: "Im [schemaspy](https://github.com/drnoa/schemaspy) die Implementation der Relationship Page als Freemarkertemplate abgeschlossen und unbenutzer Code gelöscht."
}

Repo.insert! %Contribution{
  user_id: 15,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 22},
  link: nil,
  description: "Für das [Pebble Smartwatch](https://www.pebble.com/) Watchface Projekt [BlueFuturistic](https://github.com/palian/BlueFuturistic) ein Issue erstellt, dass keine License vohanden ist: <https://github.com/palian/BlueFuturistic/issues/3>"
}

Repo.insert! %Contribution{
  user_id: 6,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 22},
  link: nil,
  description: "[Cryptopus](https://github.com/puzzle/cryptopus): Heute gibt es ein weiteres Design update."
}

Repo.insert! %Contribution{
  user_id: 7,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 22},
  link: nil,
  description: "[kicker-planner:](https://github.com/mburri/kicker-planner) Die step-by-step Beschreibung meiner Schritte verbessert, Tests für den redux-store geschrieben und ein einfaches [server-script](https://github.com/mburri/kicker-planner/blob/eeb58686bfd4258546a7714fe1adb3756fd7d7fc/server/index.js) erstellt. Machen tuts eigentlich noch nichts. Die Idee ist, dass der (Websocket) Server für jeden Change im redux State alle verbundenen Clients benachrichtigt, d.h. den neuen State \"mitteilt\"."
}

Repo.insert! %Contribution{
  user_id: 20,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 22},
  link: nil,
  description: "[Sortmypics:](https://github.com/puzzle/sortmypics) ist nun fully objektorientiert. Dazu den Code einer Diät unterzogen."
}

Repo.insert! %Contribution{
  user_id: 18,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 22},
  link: nil,
  description: "heute habe ich auf Sourceforge.net die Features von [Cryptopus](https://sourceforge.net/projects/cryptopus/) ergänzt und das Logo hochgeladen. Danach habe ich begonnen, Cryptopus gemäss Anleitung aus dem README auf meinem Notebook zu installieren. Ziel ist, die Screenshots auf Sourceforge.net zu erneuern. Eventuell gibt es morgen dazu ein Update."
}

Repo.insert! %Contribution{
  user_id: 4,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 23},
  link: nil,
  description: "Heute wurde [Wildfly 10.0.0CR5](http://wildfly.org/news/2015/12/23/WildFly10-CR5-Released/) released, daher habe ich das [sti-wildfly](https://github.com/openshift/sti-wildfly) Docker Image entsprechend angepasst und als [Pull Request](https://github.com/openshift/sti-wildfly/pull/66) eingegeben."
}

Repo.insert! %Contribution{
  user_id: 6,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 23},
  link: nil,
  description: "[Cryptopus](https://github.com/puzzle/cryptopus): Auch am zweit letzten Tag gibt es ein weiteres Update für Cryptopus. Neu ist es nicht mehr möglich bei einem bestehenden Team Root oder die Admins zu entfernen oder hinzuzufügen (private, noroot)."
}

Repo.insert! %Contribution{
  user_id: 7,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 23},
  link: nil,
  description: "[kicker-planner:](https://github.com/mburri/kicker-planner) Baby Steps in Sachen express und socket.io. Wenn sich ein client verbindet, wird ihm über eine websocket-connection der state aus dem redux store übermittelt."
}

Repo.insert! %Contribution{
  user_id: 2,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 23},
  link: nil,
  description: "Im [schemaspy](https://github.com/drnoa/schemaspy) eine aktuelle JQuery Version in die Sourcen und den JQuery Tablesorter integriert. Offen ist noch die Tabellensortierfunktion zu integrieren. Das folgt noch."
}

Repo.insert! %Contribution{
  user_id: 7,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 24},
  link: nil,
  description: "[kicker-planner:](https://github.com/mburri/kicker-planner) Clients können jetzt einen Match erstellen und alle verbundenen Clients erhalten den neuen State zum darstellen."
}

Repo.insert! %Contribution{
  user_id: 2,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 24},
  link: nil,
  description: "Im [schemaspy](https://github.com/drnoa/schemaspy) den JQuery Tablesorter in der Constraints Seite integriert. Es ist jetzt möglich die Übersicht der Tabellencontstrainst über die Tabellenüberschriften zu sortieren."
}

Repo.insert! %Contribution{
  user_id: 13,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 24},
  link: nil,
  description: "Stand-alone Puppet mit Hiera (deployed apache-forge module for testing) per Vagrant."
}

Repo.insert! %Contribution{
  user_id: 21,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 24},
  link: nil,
  description: "Einen kleinen Issue in der Hamcrest Matcher Library (welche auch in JUnit verwendet wird) gefixt und einen entsprechenden [Pull Request](https://github.com/hamcrest/JavaHamcrest/pull/132) erstellt."
}

Repo.insert! %Contribution{
  user_id: 4,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 24},
  link: nil,
  description: "In der Columnspage des [schemaspy](https://github.com/drnoa/schemaspy)s den Java Script Tablesorter eingebaut und unbenutzer Code gelöscht. Zusätzlich wurde mein [Pull Request](https://github.com/openshift/sti-wildfly/pull/66) von gestern gemerged und ist im [Docker Image](https://hub.docker.com/r/openshift/wildfly-100-centos7/) ab sofort auf Docker Hub verfügbar."
}

Repo.insert! %Contribution{
  user_id: 10,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 24},
  link: nil,
  description: "Ich habe in den vergangenen Tagen das Tool [pps](https://github.com/gro-gg/pps) erstellt, mit dem man in der Shell einfach zwischen verschiedenen Projekten wechseln kann. Heute habe ich noch das README erstellt und auf Github gestellt."
}

Repo.insert! %Contribution{
  user_id: 6,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 24},
  link: nil,
  description: "[Cryptopus](https://github.com/puzzle/cryptopus): Mein 24. Commit Tag liefert heute zwei Bugfixes für Cryptopus. Cheers."
}

Repo.insert! %Contribution{
  user_id: 21,
  challenge_id: 1,
  date: %Date{year: 2015, month: 12, day: 24},
  link: nil,
  description: "In der Overtime (es ist bereits der 25.12.) noch schnell die Basis für meine neue, zentralisierte [Cheat Sheet Sammlung](https://github.com/plow/cheatsheets) gelegt. Repo erstellt und erste Markdown-Files gepushed."
}
