# Plan — Homepage MkDocs Material (Hero Page)

## Statut
`in-progress` — analyse complète, questions ouvertes regroupées en fin de document (au 2026-05-27)

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

### Hero existant (main.html — provisoire)
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
| `vehicule/04-preparation-raid/photos/ia-concept-01.png` | Concept IA (1448×1086, RGBA) — 403 ambiance raid/désert | Candidat principal hero |
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

## Implémentation technique

### Fichiers à créer / modifier
| Fichier | Action | Rôle |
|---|---|---|
| `web/overrides/home.html` | **Créer** | Template dédié hero page (extends `main.html`) |
| `web/docs/index.md` | **Créer** | Front matter `template: home.html` + données YAML pour les sections |
| `web/docs/assets/extra.css` | **Modifier** | Ajouter CSS sections hero scrollable |
| `web/overrides/main.html` | **Modifier** | Supprimer le bloc hero provisoire |

### Mécanisme MkDocs
```yaml
# web/docs/index.md
---
template: home.html
title: Accueil
---
```
Le template `home.html` extend `main.html` (qui extend `base.html`) et surcharge `{% block content %}`.
Les données de contenu des sections peuvent être passées via front matter YAML ou codées en dur dans le template.

### Navigation `mkdocs.yml`
La nav actuelle pointe `Accueil: README.md` — à changer en `Accueil: index.md` une fois le template créé.

---

## Structure de la hero page (sections)

### Section 1 — Hero principal (plein écran ou demi-écran)

**Contenu :**
- Photo de fond (pleine largeur, overlay sombre/sable)
- Eyebrow : `Crazy Dust · 2027` (style existant)
- Titre principal : **à décider** (voir Questions)
- Tagline : **à décider** (voir Questions)
- Éventuellement : compteur de jours avant le départ (JS léger)

**CSS à écrire :**
- `min-height: 70vh` ou `100vh` selon préférence
- `background-image` sur la photo choisie + overlay gradient (cohérent avec skin)
- Titre en blanc / sable sur fond sombre

**Contrainte photo :** la photo hero doit être commitée dans le repo sous `web/docs/assets/` (pas dans `vehicule/` — MkDocs doit y accéder directement).

---

### Section 2 — Chiffres clés / Le projet en bref

**Données disponibles et réelles :**
```
2 700 km    — parcours total
410 km      — dont piste
9 jours     — durée du raid
1962        — année de la 403
```
**À décider :** quels chiffres afficher, dans quel ordre, avec quel libellé (voir Questions).

**Rendu envisagé :** grille 3 ou 4 colonnes, grand nombre Cormorant Garamond + libellé Inter, sur fond légèrement contrasté.

---

### Section 3 — Avancement / Timeline

**Phases actuelles (source `README.md`) :**
1. Achat — 🔄 En cours
2. Préparation export — ⏳ À venir
3. Restauration Maroc — ⏳ À venir
4. Préparation raid — ⏳ À venir
5. Inscription Crazy Dust — ⏳ À venir
6. Sponsoring — ⏳ À venir

**Format envisagé :** timeline horizontale (desktop) / verticale (mobile), badges colorés par statut.
**Statique** (hard-codé dans le template) — plus robuste, pas de dépendance aux fichiers source.
Mise à jour manuelle au fil du projet.

---

### Section 4 — Liens rapides

**Cibles logiques (à valider) :**
- → Suivre l'avancement (tableau de bord)
- → Le raid Crazy Dust (fiche raid)
- → Dossier sponsoring
- → Galerie photos

**Rendu envisagé :** 4 boutons/cards, icônes Material, style cohérent avec la palette.

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
- Photo hero : copier dans `web/docs/assets/` si issue de `vehicule/`
- JS si compteur : fichier dédié `web/docs/assets/countdown.js`, chargé via `extra_javascript` dans `mkdocs.yml`

---

## Questions à trancher avant implémentation

### Photo hero (Section 1)
- [ ] **Q1** — Utiliser le concept IA (`ia-concept-01.png`) comme photo hero, ou attendre d'avoir une vraie photo de la 403 ? (ou autre source ?)
- [ ] **Q2** — La photo hero doit-elle occuper tout l'écran (`100vh`) ou juste une bannière haute (`60-70vh`) ?

### Textes (Section 1)
- [ ] **Q3** — Titre hero : garder `"Peugeot 403 break"` ou quelque chose de plus court/punchier (ex. `"403"`, `"Projet 403"`, autre) ?
- [ ] **Q4** — Tagline : garder `"Carnet de bord — du garage français aux pistes marocaines."` ou proposer une nouvelle version ?

### Compteur de jours (Section 1)
- [ ] **Q5** — Afficher un compteur JS "X jours avant le départ" ? Si oui, date cible : édition 2026 (19 oct 2026) ou 2027 ?

### Chiffres clés (Section 2)
- [ ] **Q6** — Quels chiffres afficher parmi : `2 700 km` / `410 km piste` / `9 jours` / `1962` / autre ?
- [ ] **Q7** — Mentionner le nombre de pilotes (DrZoid + Zill = 2) ? Et leurs noms / pseudos ?

### Liens rapides (Section 4)
- [ ] **Q8** — Valider les 4 cibles proposées : Avancement · Crazy Dust · Sponsoring · Galerie ? Autres boutons souhaités ?

### Contenu général
- [ ] **Q9** — La section "Pour les agents IA" du README actuel doit-elle rester visible sur la homepage, ou être retirée du rendu public ?
- [ ] **Q10** — Un court texte de présentation du projet dans la Section 2 (en plus des chiffres) ? Si oui, valider le wording avant implémentation.
