# Plan — Homepage MkDocs Material (Hero Page)

## Statut
`implemented` — hero page en production sur `web/docs/index.md` (au 2026-05-27)

Le plan est conservé pour référence et historique. La hero page a fait l'objet
d'itérations qui s'écartent du plan initial — la source de vérité est désormais
le code (`web/overrides/home.html`, `web/docs/assets/extra.css`, `web/docs/index.md`).

Principaux écarts vs plan initial :
- Header Material **entièrement remplacé** par un `.home-403-header` custom (fixed,
  transparent → opaque/blur au scroll, logo monochrome en silhouette via mask-image,
  texte clair sur la photo) — les blocs `header` + `tabs` sont surchargés à vide
  dans `home.html`.
- Effets de scroll : parallaxe de la photo et reveals sont en JS (cross-browser)
  plutôt qu'en CSS scroll-driven (limité à Chromium).
- Hauteurs variables par section (intro 100vh, pilotes 70vh, etc.) au lieu de
  uniformes.
- README.md (ancien accueil) supprimé du dossier docs — index.md est le seul
  accueil mkdocs désormais.

---

## Décision de principe
La homepage sera **décorrélée du README.md** et de la syntaxe Markdown standard.
Elle sera implémentée comme une **hero page scrollable** via un template HTML custom MkDocs Material.

La page `web/docs/README.md` reste le contenu d'accueil "doc" (tableau d'avancement).
La hero page est une couche visuelle au-dessus, rendue via template dédié.

---

## État actuel du projet (2026-05-27)

### Skin / thème déjà en place
- Palette **sable + cuir + orange brûlé + cognac**, deux modes (clair/sombre)
- Typographies : **Cormorant Garamond** (titres) + **Inter** (corps) + **JetBrains Mono** (eyebrow/code)
- Variables CSS custom définies dans `web/docs/assets/extra.css`
- Surcharge thème dans `web/overrides/main.html`

### Hero existant (main.html — à remplacer)
Un bloc hero minimal est déjà injecté sur la homepage via `main.html` :
```
Eyebrow  : "Crazy Dust · 2027"       (JetBrains Mono, uppercase, letterspacing 0.28em)
Titre    : "Peugeot 403 break"        (Cormorant Garamond 3.4rem)
Rule     : ligne décorative 60px
Tagline  : "Carnet de bord — du garage français aux pistes marocaines."
```
Ce hero **sera remplacé** par le template dédié `home.html`.

### Photos disponibles
| Chemin | Contenu | Utilisable hero ? |
|---|---|---|
| `vehicule/01-achat/photos/annonce-01..03.jpg` | Photos annonce vendeur (403 en France) | Possible |
| `vehicule/01-achat/photos/vendeur-01..10.jpg` | Photos vendeur (403 en France) | Possible |
| `vehicule/04-preparation-raid/photos/ia-concept-01.png` | Concept IA (1448×1086, RGBA) — 403 ambiance raid/désert | **✅ Choisi comme photo hero** |
| `web/docs/assets/logo.png` | Logo projet | Header uniquement |

Dossiers photos export / restauration / raid : **vides pour l'instant**.

### Véhicule — données réelles
- Modèle : Peugeot 403 break, diesel
- Année : 1962 (1ère mise en circulation 12/1961)
- Kilométrage : 92 756 km
- Couleur : beige
- Statut : réservé, pas encore livré

### Raid — données réelles (Crazy Dust 2026, édition de référence)
- ~2 700 km de parcours total
- ~410 km de piste
- 9 jours (19 → 27 octobre 2026)
- Algésiras → Haut-Atlas → portes du Sahara → Marrakech → retour

---

## Stratégie de développement — page preview

Pour ne pas toucher à l'index actuel pendant le développement :

1. **Créer `web/docs/preview.md`** avec front matter `template: home.html` — page de prévisualisation isolée
2. **Développer et itérer** sur `home.html` + CSS en visant `/preview/`
3. **L'index actuel** (`README.md`) reste intact et fonctionnel pendant toute la phase de dev
4. **Validation** → quand la preview est approuvée par DrZoid :
   - Renommer `preview.md` → `index.md`
   - Mettre à jour nav `mkdocs.yml` : `Accueil: index.md`
   - Supprimer le bloc hero provisoire dans `main.html`
   - Supprimer `preview.md`

URL preview en local : `http://192.168.77.203:8000/403/preview/`
La page preview peut figurer discrètement en bas de nav ou être absente de la nav (accès URL direct uniquement).

---

## Implémentation technique

### Fichiers à créer / modifier
| Fichier | Action | Rôle |
|---|---|---|
| `web/overrides/home.html` | **Créer** | Template dédié hero page (extends `main.html`) |
| `web/docs/preview.md` | **Créer** | Page preview — front matter `template: home.html` |
| `web/docs/index.md` | **Créer** (après validation) | Remplace `preview.md` en production |
| `web/docs/assets/extra.css` | **Modifier** | Ajouter CSS sections hero scrollable |
| `web/docs/assets/ia-concept-01.png` | **Copier** | Photo hero (depuis `vehicule/04-preparation-raid/photos/`) |
| `web/overrides/main.html` | **Modifier** (après validation) | Supprimer le bloc hero provisoire |
| `web/mkdocs.yml` | **Modifier** (après validation) | Nav `Accueil: index.md` au lieu de `README.md` |

### Mécanisme MkDocs
```yaml
# web/docs/preview.md  (puis index.md après validation)
---
template: home.html
title: Accueil
---
```
Le template `home.html` extend `main.html` (qui extend `base.html`) et surcharge `{% block content %}`.

### Navigation `mkdocs.yml` — état final (après validation)
```yaml
nav:
  - Accueil: index.md   # ← était README.md
  - ...
```

---

## Contenu des sections — décisions validées

### Section 1 — Hero principal

| Élément | Décision |
|---|---|
| Photo de fond | `ia-concept-01.png` (concept IA 403, ambiance désert) |
| Hauteur | `100vh` |
| Eyebrow | `Crazy Dust · 2027` |
| Titre | **`Crazy 403,`** |
| Rule | Ligne décorative (style existant) |
| Tagline | *"Carnet de bord — du garage français aux pistes marocaines."* |
| Compteur de jours | ❌ Non |

**CSS :** `min-height: 100vh`, `background-image` avec overlay gradient sombre/sable cohérent avec la palette, texte centré.

---

### Section 2 — Le projet en bref

**Texte de présentation :**
> Sortir une 403 de 1962 d'un garage français, la restaurer au Maroc, et la lancer sur les pistes du Crazy Dust. Deux pilotes, zéro garantie, beaucoup de cambouis.

**Chiffres clés (grille 4 colonnes) :**
| Chiffre | Libellé |
|---|---|
| `2 700 km` | parcours total |
| `410 km` | dont piste |
| `9 jours` | durée du raid |
| `1962` | année de la 403 |

**Rendu :** grand nombre Cormorant Garamond + libellé Inter sous chaque chiffre, fond légèrement contrasté.

---

### Section 3 — Pilotes

**Contenu :**
- DrZoid + Zill
- Placeholder photo circulaire pour chaque pilote (pour futures versions stylisées de profil)
- Pas de photos réelles pour l'instant — placeholder générique (initiales ou icône)

---

### Section 4 — Avancement / Timeline

**Phases :**
1. Achat — 🔄 En cours
2. Préparation export — ⏳ À venir
3. Restauration Maroc — ⏳ À venir
4. Préparation raid — ⏳ À venir
5. Inscription Crazy Dust — ⏳ À venir
6. Sponsoring — ⏳ À venir

**Format :** timeline horizontale (desktop) / verticale (mobile), badges colorés par statut, **statique** (hard-codé dans le template).

---

### Section 5 — Liens rapides

**4 liens (placeholders, à revoir plus tard) :**
1. Suivre l'avancement
2. Le raid Crazy Dust
3. Dossier sponsoring
4. Galerie photos

**Rendu :** 4 cards/boutons, icônes Material, palette cohérente.

---

## Ambiance visuelle

### Palette (déjà définie dans `extra.css`)
| Variable | Mode clair | Mode sombre |
|---|---|---|
| Primary | `#b25a2c` (orange brûlé) | `#c46a3a` |
| Accent | `#8b4f2c` (cognac) | `#d9a06b` (sable doré) |
| Background | `#f3e9d2` (sable clair) | `#1c1612` (cuir noir) |
| Texte | `#2e221a` (cuir foncé) | `#ece1c5` (sable) |

### Typographies (déjà chargées)
- **Titres** : Cormorant Garamond 500/600/700 — serif élégant, explorateur vintage
- **Corps** : Inter — lisible, moderne
- **Labels/eyebrow** : JetBrains Mono — technique, raid

### Style général
- Explorateur vintage / raid désert
- Sobre, pas de surcharge graphique
- Compatible affichage sombre par défaut

---

## Contraintes
- Ne pas modifier les fichiers source existants (`vehicule/`, `raid/`, `README.md`)
- Pas de contenu inventé — uniquement ce qui est réel et validé par DrZoid
- Compatible MkDocs Material (version installée : cf. `web/requirements.txt`)
- Photo hero copiée dans `web/docs/assets/` (MkDocs doit y accéder directement)
- Pas de JS (pas de compteur)

---

## Étape finale — Migration preview → home (après validation)

Une fois que DrZoid a validé le rendu sur `/preview/` :

1. **Renommer** `web/docs/preview.md` → `web/docs/index.md`
2. **Mettre à jour la nav** dans `web/mkdocs.yml` : `Accueil: index.md` (était `README.md`)
3. **Supprimer le bloc hero provisoire** dans `web/overrides/main.html` (le `{% if page.is_homepage %}` + section `.hero-403` injectée)
4. **Nettoyer le CSS** dans `extra.css` : supprimer les règles `.hero-403` provisoires devenues inutiles
5. **Commit** : `web: hero page — mise en production (preview → index)`
6. **Vérifier** `mkdocs build --strict` passe sans erreur ni warning

> ⚠️ Ne pas exécuter cette étape sans validation explicite de DrZoid.

---

## Questions — toutes tranchées ✅

| # | Question | Réponse |
|---|---|---|
| Q1 | Photo hero | `ia-concept-01.png` (concept IA) |
| Q2 | Hauteur hero | `100vh` |
| Q3 | Titre hero | `Crazy 403,` |
| Q4 | Tagline | Garder l'actuelle |
| Q5 | Compteur de jours | Non |
| Q6 | Chiffres clés | 2 700 km · 410 km piste · 9 jours · 1962 |
| Q7 | Pilotes | DrZoid + Zill, placeholder photo circulaire |
| Q8 | Liens rapides | 4 placeholders (avancement · raid · sponsoring · galerie) |
| Q9 | Section "Pour les agents IA" | Retirée du rendu public |
| Q10 | Texte Section 2 | Option B validée |
