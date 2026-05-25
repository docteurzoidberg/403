# Plan — Homepage MkDocs Material (Hero Page)

## Statut
`draft` — idées non encore définies (au 2026-05-25)

## Décision de principe
La homepage sera **décorrélée du README.md** et de la syntaxe Markdown standard.
Elle sera implémentée comme une **hero page scrollable** via un template HTML custom MkDocs Material.

## Implémentation technique prévue
- Fichier source : `web/docs/index.md` avec front matter `template: home.html`
- Template HTML : `web/overrides/home.html` (étend `main.html`)
- Config `mkdocs.yml` : `custom_dir: overrides` (déjà prévu)
- Pleine liberté HTML/CSS dans le template — pas limité par la syntaxe Markdown

## Sections envisagées (à affiner)

### Section 1 — Hero principal
- À définir : grande photo, titre, tagline, éventuellement compteur de jours avant le départ

### Section 2 — Le projet en bref
- À définir : chiffres clés, résumé du concept

### Section 3 — Avancement / Timeline
- À définir : état des phases (Achat → Export → Restauration → Préparation → Départ)

### Section 4 — Liens rapides
- À définir : boutons vers les sections de la doc

## Ambiance visuelle
- À définir

## Palette de couleurs
- À définir (cohérente avec le thème Material existant)

## Typographie
- À définir

## Photos / visuels
- À définir : photos de la 403, du Maroc, du raid ?

## Références visuelles
- À définir : URLs, descriptions d'inspirations

## Contraintes
- Ne pas modifier les fichiers source existants (`vehicule/`, `raid/`, `README.md`)
- Pas de contenu inventé — uniquement ce qui est réel et validé par DrZoid
- Compatible MkDocs Material (version utilisée : cf. `web/requirements.txt`)

## Questions à trancher avant implémentation
- [ ] Contenu exact de chaque section
- [ ] Photos disponibles / choisies
- [ ] Ambiance visuelle (couleurs, typo, style)
- [ ] Compteur de jours ? (nécessite JS léger)
- [ ] Timeline statique ou dynamique ?
