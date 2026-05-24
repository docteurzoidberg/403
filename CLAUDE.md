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

raid/
  01-inscription/                 → démarches d'inscription au Crazy Dust
    taches.md                     → inscriptions / admin raid
  02-sponsoring/                  → dossier sponsor (FR + EN)
    taches.md                     → démarches sponsoring (contacts, dossiers, relances)
  03-photos-evenement/            → photos pendant le raid (futur)
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

## Méthode de travail

- L'utilisateur dicte le rythme et le contenu : **ne jamais inventer d'étapes, de jalons ou de tâches**
- Le contenu est ajouté au fil de l'avancement réel du projet
- Les `suivi.md` sont des journaux de bord chronologiques — toujours ajouter en bas, sans réécrire l'historique
- Les `taches.md` / `pieces-a-acheter.md` sont des listes vivantes — items cochés restent en place
- Listes et journaux sont disjoints : ne pas écrire dans `suivi.md` automatiquement quand un item est coché
- Les photos restent dans le sous-dossier `photos/` de la phase concernée

## Informations véhicule

- **Modèle** : Peugeot 403 break
- **Raid cible** : Crazy Dust 2027
- **Restauration** : au Maroc
