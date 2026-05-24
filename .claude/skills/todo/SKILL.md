---
name: todo
description: Gère les 6 listes de travail du projet 403 (pièces à acquérir avant départ — France ou atelier Maroc, tâches avant départ Maroc, restauration Maroc, prep raid véhicule, inscriptions raid, sponsoring). Utiliser quand l'utilisateur veut ajouter, retirer, cocher (marquer fait), décocher, ou consulter un item de l'une de ces listes.
---

# /todo — listes de travail projet 403

## Les 6 listes

| Code | Liste | Fichier |
|---|---|---|
| `pieces` | Pièces à acquérir avant départ (France ou atelier Maroc) | `vehicule/02-preparation-export/pieces-a-acheter.md` |
| `export` | Tâches avant départ Maroc | `vehicule/02-preparation-export/taches.md` |
| `resto` | Restauration au Maroc | `vehicule/03-restauration-maroc/taches.md` |
| `prep-raid` | Préparation raid — côté véhicule | `vehicule/04-preparation-raid/taches.md` |
| `inscription` | Inscriptions / admin raid | `raid/01-inscription/taches.md` |
| `sponsoring` | Sponsoring (contacts, dossiers, relances) | `raid/02-sponsoring/taches.md` |

## Format de fichier

Chaque liste est une checklist markdown sous un en-tête `## À faire` :

```
- [ ] Item ouvert
- [x] Item fait
```

**Catégories (optionnelles)** : sous-sections `### <Catégorie>` (ex : Sellerie, Mécanique, Carrosserie, Électricité, Administratif…). Quand une ou plusieurs catégories existent dans le fichier, tout nouvel item est placé sous une catégorie. Quand le fichier est plat (sans catégorie), les items vont directement sous `## À faire`.

Les items cochés restent en place dans leur catégorie — ne pas les déplacer ni les supprimer automatiquement.

## Opérations

### Ajouter
Append `- [ ] <item>` dans la liste cible. **Ne jamais inventer un item** ni le compléter au-delà de ce que l'utilisateur a dit (pas de marque, modèle, quantité, prix, fournisseur etc. sauf si fournis).

**Catégorie cible** :
- Si l'utilisateur précise une catégorie (ex : `resto sellerie : ciel de toit`, `prep-raid mécanique : ...`), placer sous la sous-section `### <Catégorie>` (la créer si elle n'existe pas, à la fin du fichier).
- Si le fichier a déjà des catégories et que l'utilisateur n'en précise pas une mais que le wording la rend évidente (ex : "joint de culasse" → Mécanique), placer dans la catégorie évidente.
- Si le fichier a déjà des catégories et que l'intention est ambiguë, demander via AskUserQuestion (proposer les catégories existantes + "Nouvelle catégorie" + "Sans catégorie").
- Si le fichier est plat (aucune catégorie), append directement sous `## À faire` — sauf si l'utilisateur introduit explicitement une catégorie (alors basculer le fichier en mode catégorisé : créer la sous-section et y placer l'item ; les items existants restent en flat sous `## À faire`, à moins que l'utilisateur ne demande de les reclasser).

**Split** : si l'utilisateur formule plusieurs items dans un seul prompt (parenthèses listant des sous-éléments, virgules, etc.), demander s'il veut un item unique ou plusieurs items séparés — sauf si la formulation est sans ambiguïté.

### Retirer
Supprimer la ligne entière correspondant à l'item (matching sur le texte). Si plusieurs lignes matchent, demander laquelle via AskUserQuestion.

### Cocher (marquer fait)
Remplacer `- [ ]` par `- [x]` sur la ligne correspondante.

### Décocher
Remplacer `- [x]` par `- [ ]` (item coché par erreur, ou à refaire).

### Consulter
Afficher le contenu de la liste demandée — section `## À faire` (catégories incluses) uniquement.

## Identification de la liste cible

- L'utilisateur peut utiliser le code (`pieces`, `export`, `resto`, `prep-raid`, `inscription`, `sponsoring`) ou une formulation libre ("pièces", "à acheter", "à demander à l'atelier Maroc", "tâches Maroc", "raid véhicule", "inscriptions", "sponsors", etc.).
- Si l'intention est claire d'après le contexte ou le wording, agir directement sans demander.
- Si ambigu, utiliser AskUserQuestion pour choisir parmi les 6 listes.
- **Sans argument** : afficher l'état compact des 6 listes (nb d'items ouverts / total par liste).

## Règles

- **Ne jamais inventer** d'item ni de détail. Strictement ce que l'utilisateur a dit.
- Ne pas écrire dans `suivi.md` automatiquement. Les listes et le journal sont disjoints — si l'utilisateur veut consigner un événement dans le suivi (ex : "acheté tel jour, X €"), il le demandera explicitement.
- Après chaque opération de modification, montrer brièvement la ligne touchée et l'état résultant de la liste (compact, juste la liste mise à jour).
