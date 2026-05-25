# Copilot Instructions — Projet Peugeot 403 Break / Crazy Dust 2027

## Contexte

Préparation à la participation au raid **Crazy Dust** (édition 2027) à bord d'une **Peugeot 403 break**.

Le projet couvre deux axes :
1. **Le véhicule** — achat, préparation export, restauration au Maroc, préparation raid
2. **Le raid** — inscription, logistique, sponsoring éventuel

Documentation principale en **français**. Sections sponsoring bilingues (FR + EN).

> Pour le contexte complet, la méthode de travail et les règles détaillées, lire [`CLAUDE.md`](../CLAUDE.md) à la racine du repo.

---

## Structure du repo

```
vehicule/
  01-achat/                     → journal achat + photos
  02-preparation-export/        → pièces à acquérir, tâches avant départ Maroc
  03-restauration-maroc/        → tâches de restauration
  04-preparation-raid/          → tâches préparation raid (post-atelier)
  fiches/                       → fiches techniques par modification
    <nom-modification>/
      fiche.md                  → doc technique (source, pièces, étapes, notes)
      photos/

raid/
  01-inscription/               → tâches + journal inscription (`suivi.md`)
  02-sponsoring/                → tâches sponsoring
  03-photos-evenement/          → photos pendant le raid (futur)
  crazy-dust-fiche.md           → toutes les infos compilées sur le raid

web/                            → site MkDocs Material (lecture seule sur vehicule/ et raid/)

prompts/
  0_MKDOCS_PLAN.md             → brief d'implémentation MkDocs phase 1
  1_MKDOCS_HOMEPAGE_PLAN.md    → plan homepage hero page (en cours de définition)

questions-en-suspens.md         → décisions en attente, infos manquantes

Journaux de suivi (`suivi.md`) :

| Code | Fichier |
|---|---|
| `achat` | `vehicule/01-achat/suivi.md` |
| `export` | `vehicule/02-preparation-export/suivi.md` |
| `resto` | `vehicule/03-restauration-maroc/suivi.md` |
| `prep-raid` | `vehicule/04-preparation-raid/suivi.md` |
| `inscription` | `raid/01-inscription/suivi.md` |
```

---

## Règles essentielles

- **Ne jamais inventer** d'étapes, tâches, décisions ou informations techniques
- `suivi.md` = journal chronologique — toujours **ajouter en bas**, ne jamais réécrire
- `taches.md` = liste vivante — items cochés **restent en place**
- Ne pas écrire dans `suivi.md` automatiquement quand un item est coché
- Fiches techniques (`vehicule/fiches/`) : contenu issu exclusivement de sources réelles
- Les sections `⚠️ à compléter` dans les fichiers sont des placeholders — ne pas les remplir sans instruction explicite

---

## Infos raid Crazy Dust

Toutes les informations disponibles sur le raid sont dans [`raid/crazy-dust-fiche.md`](../raid/crazy-dust-fiche.md) :
concept, étapes 2026, tarifs, inclus/non inclus, équipements requis, hébergement.

Source : crazy-dust.com + owaka.com (scraping 2026-05-25).  
Édition 2027 non encore publiée.

---

## Véhicule

- **Modèle** : Peugeot 403 break
- **Statut** : en cours d'achat (réservé, pas encore livré — au 2026-05-25)
- **Restauration** : au Maroc
- **Raid cible** : Crazy Dust 2027
