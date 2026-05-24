# Implémentation site MkDocs Material — Projet 403 (phase 1)

## Contexte
Projet de préparation d'une Peugeot 403 break pour le raid Crazy Dust 2027.
Tout le contexte projet, structure de dossiers et méthode de travail sont dans `CLAUDE.md` à la racine — **lis-le avant de démarrer**.
Mémoire utilisateur (préférences, statut) : `/home/drzoid/.claude/projects/-home-drzoid-projects-403/memory/MEMORY.md`.

## Objectif phase 1
Mettre en place un site statique **MkDocs Material** buildable en local, avec **automatisation au push (hook git)**.
**Hors scope** : déploiement GitHub Pages, GitHub Actions, i18n EN active, domaine custom, analytics.

## Stack
- MkDocs + thème Material
- Python via venv local (`.venv/`)
- Plugins : `mkdocs-material`, `mkdocs-glightbox` (galeries photos), `mkdocs-awesome-pages-plugin` (nav fine)
- Le plugin officiel `i18n` est installé et configuré pour FR seulement, mais la structure reste prête pour EN plus tard

## Configuration site (`mkdocs.yml`)
- `site_name`: "Projet 403 — Crazy Dust 2027"
- `site_description`: courte, à proposer à l'utilisateur
- Langue : `fr`
- Palette Material : sombre par défaut + toggle clair (slate + default), accent à proposer
- Features Material recommandées : `navigation.tabs`, `navigation.sections`, `navigation.indexes`, `content.code.copy`, `search.suggest`, `search.highlight`
- Exclusions explicites du build :
  - `questions-en-suspens.md`
  - `raid/02-sponsoring/sponsors/**/*.md`
  - `CLAUDE.md`
  - `README.md` (sauf si on en fait la home — à demander)

## Arborescence de navigation cible

1. **Accueil** — présentation projet, statut actuel, liens vers sections (contenu à écrire avec l'utilisateur, NE PAS INVENTER)
2. **Le véhicule**
   - Achat → `vehicule/01-achat/suivi.md` + galerie `vehicule/01-achat/photos/`
   - Préparation export → `taches.md` + `pieces-a-acheter.md` + `suivi.md` + photos
   - Restauration Maroc → `taches.md` + `suivi.md` + photos
   - Préparation raid → `taches.md` + `suivi.md` + photos
3. **Le raid**
   - Inscription → `raid/01-inscription/taches.md` + `suivi.md`
   - Sponsoring → `raid/02-sponsoring/dossier-fr.md` + `taches.md` (le `dossier-en.md` est ignoré en v1)

## Mapping fichiers → pages
Utiliser `awesome-pages` (`.pages` files) ou `nav:` explicite dans `mkdocs.yml`. Pas de duplication de fichiers : les `.md` existants sont consommés tels quels via leur chemin source. Si un titre de page doit différer du `# H1` du fichier, le faire dans `.pages`/`nav:`.

## Galeries photos
- Installer `mkdocs-glightbox`
- Chaque sous-page de phase véhicule ajoute en bas une section "Photos" qui liste les images du dossier `photos/` correspondant
- Si les dossiers `photos/` sont vides à ce stade, prévoir un placeholder discret ("Aucune photo pour l'instant")

## Page d'accueil
Vide pour le moment. **À écrire avec l'utilisateur** — proposer un squelette puis demander confirmation/contenu. Ne rien inventer sur le projet, le véhicule, ou le raid au-delà de ce qui est dans `CLAUDE.md`, `README.md`, et les memory files.

## Automatisation locale au push
- Script `scripts/setup-hooks.sh` versionné : installe un hook git `pre-push` symlinké vers `scripts/hooks/pre-push`
- Hook `pre-push` : active le venv, lance `mkdocs build --strict`, échec = push refusé
- `setup-hooks.sh` doit être idempotent
- Documenter dans un `WEB.md` (ou section dédiée du README) comment :
  - créer le venv et installer les deps (`pip install -r requirements-web.txt`)
  - lancer le serveur local (`mkdocs serve`)
  - installer les hooks
- Ajouter à `.gitignore` : `.venv/`, `site/`, `__pycache__/`

## Découpage en commits (suivre la préférence "commit incrémental")
1. Setup venv + `requirements-web.txt` + `.gitignore` mis à jour
2. `mkdocs.yml` minimal + page d'accueil placeholder qui build à blanc
3. Branchement de la nav sur les fichiers existants (véhicule)
4. Branchement de la nav sur les fichiers existants (raid)
5. Plugin galerie + intégration photos
6. Hook git pre-push + script setup
7. Doc d'utilisation (`WEB.md` ou section README)

## Contraintes méthode (tirées de `CLAUDE.md`)
- **Ne jamais inventer de contenu projet** : pas de fausse présentation 403, pas de jalons fictifs
- **Commits au fur et à mesure** sans demander confirmation à chaque commit
- Les listes existantes (`taches.md`, `suivi.md`, `pieces-a-acheter.md`) restent **la source de vérité** : ne pas les modifier pour les besoins du site
- Toute info manquante → **demander à l'utilisateur**, pas inventer

## Questions à poser à l'utilisateur avant de coder
1. Contenu / squelette de la page d'accueil
2. `site_description` (1 phrase pour le `<meta>` + le header)
3. Couleur d'accent Material (rouge, ambre, deep-orange, custom… ?) — esprit raid/désert peut être pertinent
4. Photos déjà présentes dans les dossiers `vehicule/*/photos/` à intégrer en v1 ?
5. Logo/favicon disponibles ? Sinon on laisse le défaut Material

## Définition de "fini" pour la phase 1
- `mkdocs serve` ouvre un site complet, navigable, sans erreur ni warning strict
- `git push` déclenche le build et bloque si KO
- Toutes les pages cibles sont accessibles via la nav
- Les exclusions sont effectives (aucun contenu sensible publié)
- Doc d'utilisation présente
