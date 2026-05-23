---
name: todo
description: Gère les 5 listes de travail du projet 403 (pièces à acheter en France, tâches avant départ Maroc, restauration Maroc, prep raid véhicule, inscriptions raid). Utiliser quand l'utilisateur veut ajouter, retirer, cocher (marquer fait), décocher, ou consulter un item de l'une de ces listes.
---

# /todo — listes de travail projet 403

## Les 5 listes

| Code | Liste | Fichier |
|---|---|---|
| `pieces` | Pièces à acheter en France | `vehicule/02-preparation-export/pieces-a-acheter.md` |
| `export` | Tâches avant départ Maroc | `vehicule/02-preparation-export/taches.md` |
| `resto` | Restauration au Maroc | `vehicule/03-restauration-maroc/taches.md` |
| `prep-raid` | Préparation raid — côté véhicule | `vehicule/04-preparation-raid/taches.md` |
| `inscription` | Inscriptions / admin raid | `raid/01-inscription/taches.md` |

## Format de fichier

Chaque liste est une checklist markdown sous un en-tête `## À faire` :

```
- [ ] Item ouvert
- [x] Item fait
```

Pas de sous-catégorisation. Les items cochés restent en place — ne pas les déplacer ni les supprimer automatiquement.

## Opérations

### Ajouter
Append `- [ ] <item>` à la fin de la section `## À faire` de la liste cible. **Ne jamais inventer un item** ni le compléter au-delà de ce que l'utilisateur a dit (pas de marque, modèle, quantité, prix, fournisseur etc. sauf si fournis).

### Retirer
Supprimer la ligne entière correspondant à l'item (matching sur le texte). Si plusieurs lignes matchent, demander laquelle via AskUserQuestion.

### Cocher (marquer fait)
Remplacer `- [ ]` par `- [x]` sur la ligne correspondante.

### Décocher
Remplacer `- [x]` par `- [ ]` (item coché par erreur, ou à refaire).

### Consulter
Afficher le contenu de la liste demandée — section `## À faire` uniquement.

## Identification de la liste cible

- L'utilisateur peut utiliser le code (`pieces`, `export`, `resto`, `prep-raid`, `inscription`) ou une formulation libre ("pièces FR", "à acheter en France", "Maroc", "raid véhicule", "inscriptions", etc.).
- Si l'intention est claire d'après le contexte ou le wording, agir directement sans demander.
- Si ambigu, utiliser AskUserQuestion pour choisir parmi les 5 listes.
- **Sans argument** : afficher l'état compact des 5 listes (nb d'items ouverts / total par liste).

## Règles

- **Ne jamais inventer** d'item ni de détail. Strictement ce que l'utilisateur a dit.
- Ne pas écrire dans `suivi.md` automatiquement. Les listes et le journal sont disjoints — si l'utilisateur veut consigner un événement dans le suivi (ex : "acheté tel jour, X €"), il le demandera explicitement.
- Après chaque opération de modification, montrer brièvement la ligne touchée et l'état résultant de la liste (compact, juste la liste mise à jour).
