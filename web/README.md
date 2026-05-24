# web/ — Site MkDocs Material

Sous-dossier qui regroupe ce qui concerne le site statique du projet : config (`mkdocs.yml`), dépendances, venv, scripts, et le build (`build/`). Le contenu source reste à la racine (`README.md`, `vehicule/`, `raid/`) et est accessible via des symlinks dans `docs/`.

## Stack

- [MkDocs](https://www.mkdocs.org/) + thème [Material](https://squidfunk.github.io/mkdocs-material/)
- Plugins : `mkdocs-glightbox` (galeries photos), `mkdocs-awesome-pages-plugin`
- Python 3.10+ (testé sur 3.12)

## Premier lancement

```bash
cd web
python3 -m venv .venv
.venv/bin/pip install -r requirements.txt
scripts/setup-hooks.sh          # installe le hook git pre-push
```

## Travailler en local

Lancer le serveur de dev avec rechargement à chaud :

```bash
cd web
.venv/bin/mkdocs serve
# ouvrir http://127.0.0.1:8000
```

Builder le site dans `web/build/` :

```bash
cd web
.venv/bin/mkdocs build --strict
```

## Hook git `pre-push`

Installé par `scripts/setup-hooks.sh` (symlink vers `web/scripts/hooks/pre-push`).
Avant chaque `git push`, le hook exécute `mkdocs build --strict` et **refuse le push** si le build échoue. Le venv doit exister sous `web/.venv/`.

Pour réinstaller / mettre à jour les hooks après un `pull` :

```bash
web/scripts/setup-hooks.sh
```

## Structure

```
web/
├── mkdocs.yml          → config Material, palette, nav, plugins
├── requirements.txt    → dépendances pinnées
├── PROMPT.md           → brief d'implémentation (historique)
├── .venv/              → gitignored
├── build/              → gitignored, output mkdocs
├── docs/               → docs_dir MkDocs
│   ├── README.md       → symlink → ../../README.md (accueil)
│   ├── vehicule/       → symlink → ../../vehicule
│   ├── raid/           → symlink → ../../raid
│   ├── assets/         → logo + favicon
│   └── galeries/       → pages galerie photos par phase véhicule
└── scripts/
    ├── setup-hooks.sh  → installe les hooks git (idempotent)
    └── hooks/
        └── pre-push    → build --strict, bloque le push si KO
```

## Exclusions du site

Définies dans `mkdocs.yml` (clé `exclude_docs`) :
- `raid/02-sponsoring/sponsors/**` — notes internes sponsors
- `raid/02-sponsoring/dossier-en.md` — version EN, ajoutée en phase i18n
- `raid/02-sponsoring/modele-orga/**` — modèles de référence

Le contenu sensible (`questions-en-suspens.md`, etc.) reste à la racine du repo mais n'est pas exposé sur le site car il n'est pas dans `web/docs/`.

## Phase 2 — à venir

Déploiement automatique sur GitHub Pages via GitHub Actions au push sur `main`.
