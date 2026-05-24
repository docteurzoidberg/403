# Implémentation site MkDocs Material — Projet 403 (phase 1)

## Contexte
Projet de préparation d'une Peugeot 403 break pour le raid Crazy Dust 2027.
Tout le contexte projet, structure de dossiers et méthode de travail sont dans `CLAUDE.md` à la racine — **lis-le avant de démarrer**.
Mémoire utilisateur (préférences, statut) : `/home/drzoid/.claude/projects/-home-drzoid-projects-403/memory/MEMORY.md`.

## Objectif phase 1
Mettre en place un site statique **MkDocs Material** buildable en local, avec **automatisation au push (hook git)**.
**Hors scope** : déploiement GitHub Pages, GitHub Actions, i18n EN active, domaine custom, analytics.

## Séparation web vs contenu projet
**Règle structurante** : tout ce qui touche au site web est **isolé dans `web/`**. Le contenu projet (`vehicule/`, `raid/`, `CLAUDE.md`, `README.md`, `questions-en-suspens.md`) **ne bouge pas** et reste à la racine. Le site consomme ces sources en lecture seule.

```
/                                    ← racine projet (inchangée)
├── CLAUDE.md
├── README.md
├── questions-en-suspens.md
├── vehicule/                        ← source markdown (inchangée)
├── raid/                            ← source markdown (inchangée)
└── web/                             ← TOUT le projet web vit ici
    ├── mkdocs.yml
    ├── requirements.txt
    ├── .venv/                       ← gitignored
    ├── build/                       ← output du build, gitignored
    ├── overrides/                   ← surcharges thème Material si besoin
    ├── assets/                      ← logo/favicon/css custom si besoin
    └── scripts/
        ├── setup-hooks.sh
        └── hooks/
            └── pre-push
```

## Stack
- MkDocs + thème Material
- Python via venv local dans `web/.venv/`
- Plugins : `mkdocs-material`, `mkdocs-glightbox` (galeries photos), `mkdocs-awesome-pages-plugin` (nav fine)
- Le plugin officiel `i18n` est installé et configuré pour FR seulement, mais la structure reste prête pour EN plus tard

## Configuration site (`web/mkdocs.yml`)
- `site_name`: "Projet 403 — Crazy Dust 2027"
- `site_description`: courte, à proposer à l'utilisateur
- `docs_dir: ..` (la racine du repo sert de source ; nav explicite + `not_in_nav` pour cadrer)
- `site_dir: build` (donc artefacts dans `web/build/`)
- Langue : `fr`
- Palette Material : sombre par défaut + toggle clair (slate + default), accent à proposer
- Features Material recommandées : `navigation.tabs`, `navigation.sections`, `navigation.indexes`, `content.code.copy`, `search.suggest`, `search.highlight`
- Exclusions explicites (via `exclude_docs` / `not_in_nav`) :
  - `questions-en-suspens.md`
  - `raid/02-sponsoring/sponsors/**/*.md`
  - `CLAUDE.md`
  - `WEB-PROMPT.md`
  - `web/**` (le dossier web lui-même ne doit pas se publier)
  - `.claude/**`, `.git/**`
  - `README.md` (sauf si on en fait la home — à demander)

## Arborescence de navigation cible (nav explicite dans `mkdocs.yml`)

1. **Accueil** → page créée dans `web/` (ex. `web/home.md` référencé via nav) — à NE PAS placer à la racine
2. **Le véhicule**
   - Achat → `vehicule/01-achat/suivi.md` + galerie `vehicule/01-achat/photos/`
   - Préparation export → `taches.md` + `pieces-a-acheter.md` + `suivi.md` + photos
   - Restauration Maroc → `taches.md` + `suivi.md` + photos
   - Préparation raid → `taches.md` + `suivi.md` + photos
3. **Le raid**
   - Inscription → `raid/01-inscription/taches.md` + `suivi.md`
   - Sponsoring → `raid/02-sponsoring/dossier-fr.md` + `taches.md` (le `dossier-en.md` est ignoré en v1)

Note : avec `docs_dir: ..`, MkDocs résoudra les liens internes des `.md` existants depuis la racine. Vérifier qu'aucun lien relatif ne casse, ajuster sinon (sans modifier la structure des fichiers source).

## Galeries photos
- Installer `mkdocs-glightbox`
- Chaque sous-page de phase véhicule ajoute en bas une section "Photos" qui liste les images du dossier `photos/` correspondant
- Si les dossiers `photos/` sont vides à ce stade, prévoir un placeholder discret ("Aucune photo pour l'instant")

## Page d'accueil
Fichier `web/home.md` (ou équivalent), référencé en `index.md` dans la nav. Contenu **à écrire avec l'utilisateur** — proposer un squelette puis demander confirmation/contenu. Ne rien inventer sur le projet, le véhicule, ou le raid au-delà de ce qui est dans `CLAUDE.md`, `README.md`, et les memory files.

## Automatisation locale au push
- Script `web/scripts/setup-hooks.sh` (versionné, idempotent) : installe un hook git `pre-push` symlinké vers `web/scripts/hooks/pre-push`
- Hook `pre-push` : `cd web/` → active `.venv` → `mkdocs build --strict`. Échec = push refusé.
- Documenter dans `web/README.md` :
  - création du venv : `cd web && python -m venv .venv && source .venv/bin/activate && pip install -r requirements.txt`
  - serveur local : `cd web && mkdocs serve`
  - installation des hooks : `web/scripts/setup-hooks.sh`
- Ajouter à `.gitignore` (racine) : `web/.venv/`, `web/build/`, `web/__pycache__/`, `**/__pycache__/`

## Découpage en commits (préférence projet : commits incrémentaux)
1. Création `web/`, `web/.gitignore`, `web/requirements.txt`, `.gitignore` racine mis à jour
2. `web/mkdocs.yml` minimal + `web/home.md` placeholder → `mkdocs build --strict` passe à vide
3. Branchement de la nav sur les fichiers existants (véhicule)
4. Branchement de la nav sur les fichiers existants (raid)
5. Plugin galerie + intégration photos
6. Hook git `pre-push` + `setup-hooks.sh`
7. `web/README.md` (doc d'utilisation)

## Contraintes méthode (tirées de `CLAUDE.md`)
- **Ne jamais inventer de contenu projet** : pas de fausse présentation 403, pas de jalons fictifs
- **Commits au fur et à mesure** sans demander confirmation à chaque commit
- Les fichiers de contenu (`taches.md`, `suivi.md`, `pieces-a-acheter.md`, etc.) restent **la source de vérité** : ne pas les modifier pour les besoins du site (si un lien interne casse, ajuster intelligemment en privilégiant la non-modification)
- Toute info manquante → **demander à l'utilisateur**, pas inventer
- Aucun fichier web-related ne doit apparaître hors de `web/` (sauf `WEB-PROMPT.md` qui est le brief, et le `.gitignore` racine qui doit connaître `web/.venv` et `web/build`)

## Questions à poser à l'utilisateur avant de coder
1. Contenu / squelette de la page d'accueil
2. `site_description` (1 phrase pour le `<meta>` + le header)
3. Couleur d'accent Material (rouge, ambre, deep-orange, custom… ?) — esprit raid/désert peut être pertinent
4. Photos déjà présentes dans les dossiers `vehicule/*/photos/` à intégrer en v1 ?
5. Logo/favicon disponibles ? Sinon on laisse le défaut Material

## Définition de "fini" pour la phase 1
- `cd web && mkdocs serve` ouvre un site complet, navigable, sans erreur ni warning strict
- `git push` déclenche le build et bloque si KO
- Toutes les pages cibles sont accessibles via la nav
- Les exclusions sont effectives (aucun contenu sensible publié)
- `web/build/` contient le site généré, `web/build/` et `web/.venv/` sont gitignored
- `web/README.md` documente l'usage
