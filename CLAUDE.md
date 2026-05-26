# Projet Peugeot 403 Break — Crazy Dust 2027

## Contexte du projet

Préparation à la participation au raid **Crazy Dust** (édition 2027) à bord d'une **Peugeot 403 break**.

Le projet couvre deux axes parallèles :
1. **Le véhicule** — achat, préparation export, restauration au Maroc, préparation raid
2. **Le raid** — inscription, logistique, dossier de sponsoring éventuel

Documentation bilingue : français (principal) + anglais (sections sponsoring notamment).

## Statut actuel

- Véhicule : en cours d'achat en France (réservé, pas encore livré)
- Raid : aucune démarche engagée pour l'instant

## Structure du dossier

```
vehicule/
  01-achat/                       → suivi de l'achat + photos
  02-preparation-export/          → préparation pour transport vers le Maroc
    pieces-a-acheter.md           → pièces à acquérir avant départ (FR ou atelier Maroc)
    taches.md                     → tâches avant départ
  03-restauration-maroc/          → restauration sur place
    taches.md                     → tâches de restauration
  04-preparation-raid/            → préparation raid côté véhicule
    taches.md                     → tâches prep raid (post-atelier)
  fiches/                         → fiches techniques par modification/transformation
    <nom-modification>/           → un dossier par fiche
      fiche.md                    → documentation technique (source, pièces, étapes, notes)
      photos/                     → photos liées à cette modification

raid/
  01-inscription/                 → démarches d'inscription au Crazy Dust
    taches.md                     → inscriptions / admin raid
  02-sponsoring/                  → dossier sponsor (FR + EN)
    taches.md                     → démarches sponsoring (contacts, dossiers, relances)
  03-photos-evenement/            → photos pendant le raid (futur)

web/                              → sous-dossier du projet : site MkDocs Material
                                    (config, venv, build, scripts)
                                    consomme vehicule/ et raid/ en lecture seule
```

## Listes de travail

6 fichiers de listes recensent les items ouverts par phase. Format checklist markdown (`- [ ] item` / `- [x] item`) sous un en-tête `## À faire`, avec sous-sections optionnelles `### <Catégorie>` (Sellerie, Mécanique, Carrosserie, etc.) quand une liste s'y prête. Un item terminé est coché et reste dans la liste — il n'est pas automatiquement déplacé.

| Code | Liste | Fichier |
|---|---|---|
| `pieces` | Pièces à acquérir avant départ (France ou atelier Maroc) | `vehicule/02-preparation-export/pieces-a-acheter.md` |
| `export` | Tâches avant départ Maroc | `vehicule/02-preparation-export/taches.md` |
| `resto` | Restauration au Maroc | `vehicule/03-restauration-maroc/taches.md` |
| `prep-raid` | Prep raid côté véhicule | `vehicule/04-preparation-raid/taches.md` |
| `inscription` | Inscriptions / admin raid | `raid/01-inscription/taches.md` |
| `sponsoring` | Sponsoring (contacts, dossiers, relances) | `raid/02-sponsoring/taches.md` |

Gestion via le skill `/todo` (cf. [`.claude/skills/todo/SKILL.md`](.claude/skills/todo/SKILL.md)) : add / remove / cocher / décocher / consulter.

## Journaux de suivi

5 fichiers `suivi.md` servent de journal chronologique par phase. Toujours ajouter **en haut** (entrée la plus récente en premier), jamais réécrire l'historique.

| Code | Journal | Fichier |
|---|---|---|
| `achat` | Achat du véhicule | `vehicule/01-achat/suivi.md` |
| `export` | Préparation export / transport Maroc | `vehicule/02-preparation-export/suivi.md` |
| `resto` | Restauration au Maroc | `vehicule/03-restauration-maroc/suivi.md` |
| `prep-raid` | Préparation raid — côté véhicule | `vehicule/04-preparation-raid/suivi.md` |
| `inscription` | Inscriptions / admin raid | `raid/01-inscription/suivi.md` |

Gestion via le skill `/journal` (cf. [`.claude/skills/journal/SKILL.md`](.claude/skills/journal/SKILL.md)) : ajouter, consulter, lister.

## Questions en suspens

Les décisions non encore prises, informations manquantes ou points à clarifier (toutes phases) sont centralisés dans :

→ [`questions-en-suspens.md`](questions-en-suspens.md)

Une question résolue est retirée de la liste. Ne pas ajouter de question sans instruction explicite de DrZoid.

## Site web

Un site statique **MkDocs Material** publie le projet (suivi, listes, sponsoring). Le sous-dossier `web/` regroupe ce qui concerne le site : config (`mkdocs.yml`), dépendances (`requirements.txt`), venv (`.venv/`), build (`build/`), scripts. Le site consomme `vehicule/` et `raid/` **en lecture seule** — ne jamais déplacer ou réécrire ces fichiers pour les besoins du site.

Brief d'implémentation phase 1 : [`prompts/0_MKDOCS_PLAN.md`](prompts/0_MKDOCS_PLAN.md). Phase 2 (déploiement GitHub Pages) à venir.

Plan homepage hero page : [`prompts/1_MKDOCS_HOMEPAGE_PLAN.md`](prompts/1_MKDOCS_HOMEPAGE_PLAN.md).

## Méthode de travail

- L'utilisateur dicte le rythme et le contenu : **ne jamais inventer d'étapes, de jalons ou de tâches**
- Le contenu est ajouté au fil de l'avancement réel du projet
- Les `suivi.md` sont des journaux de bord — **entrée la plus récente en haut**, sans réécrire l'historique
- Les `taches.md` / `pieces-a-acheter.md` sont des listes vivantes — items cochés restent en place
- Listes et journaux sont disjoints : ne pas écrire dans `suivi.md` automatiquement quand un item est coché
- Les photos restent dans le sous-dossier `photos/` de la phase concernée
- Les fiches techniques (`vehicule/fiches/<nom>/fiche.md`) documentent les modifications significatives : source, pièces, étapes, notes. Chaque fiche a son propre dossier avec un sous-dossier `photos/`. Le contenu des fiches provient exclusivement de sources réelles (retours d'expérience, forums, docs techniques) — ne rien inventer.

## Informations véhicule

- **Modèle** : Peugeot 403 break
- **Raid cible** : Crazy Dust 2027
- **Restauration** : au Maroc

## Fiche raid Crazy Dust

Toutes les informations compilées sur le raid (concept, étapes, tarifs, équipements, inclus/non inclus) sont dans :

→ [`raid/crazy-dust-fiche.md`](raid/crazy-dust-fiche.md)

Source : crazy-dust.com + owaka.com (scraping 2026-05-25). Les sections marquées `⚠️ à compléter` contiennent des placeholders — ne pas inventer de contenu, attendre confirmation de DrZoid ou de l'organisateur.
