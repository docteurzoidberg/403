---
name: budget
description: Ajoute ou met à jour un élément dans le budget du projet 403, recalcule les sous-totaux de la phase concernée et le récapitulatif global, puis rebuild MkDocs et pousse. Utiliser quand l'utilisateur veut enregistrer une dépense réelle ou prévisionnelle dans le budget.
---

# /budget — suivi budgétaire projet 403

## Fichier source

`budget.md` à la racine du repo. `web/docs/budget.md` est un symlink — **ne jamais l'éditer directement**.

## Les 5 phases

| Code | Phase | En-tête dans le fichier |
|---|---|---|
| `1` | Achat du véhicule | `## Phase 1 — Achat du véhicule` |
| `2` | Préparation export (France) | `## Phase 2 — Préparation export (France)` |
| `3` | Restauration Maroc | `## Phase 3 — Restauration Maroc` |
| `4` | Préparation raid | `## Phase 4 — Préparation raid` |
| `5` | Raid (sur place) | `## Phase 5 — Raid (sur place)` |

## Format de la table

Chaque phase contient une table markdown :

```
| Date | Description | Montant (€) | Type | Statut |
|---|---|---|---|---|
| 2026-05-29 | Description de l'élément | 230.80 | Réel | ✅ Payé |
| — | Description prévisionnelle | 465.20 | Prévisionnel | 💭 À renseigner |
```

### Valeurs des colonnes

**Date** : `YYYY-MM-DD` si connue, sinon `—`

**Montant** :
- Nombre connu : séparateur milliers = espace (`3 000`), décimales = point (`230.80`)
- Inconnu : `—`

**Type** :
- `Réel` — dépense engagée ou payée (l'utilisateur dit "réel", "dépensé", "payé", "commandé", "reçu")
- `Prévisionnel` — montant à venir (l'utilisateur dit "prévisionnel", "prévu", "estimé", "à venir")

**Statut** :
- `✅ Payé` — payé (défaut pour Réel si l'utilisateur dit "payé")
- `✅ Reçu <date>` — commandé et reçu (si l'utilisateur précise une date de réception)
- `🛒 Commandé` — commandé, pas encore reçu
- `💭 À renseigner` — défaut pour Prévisionnel, ou si Réel sans précision de statut

Si l'utilisateur ne précise pas le statut :
- Type Réel → `✅ Payé`
- Type Prévisionnel → `💭 À renseigner`

## Opération : ajouter un élément

1. Identifier la phase cible (l'utilisateur peut dire "phase 1", "achat", "export", "resto", "prep-raid", "raid" ou une formulation libre évidente).
2. Si la phase est ambiguë, demander via AskUserQuestion.
3. Insérer la nouvelle ligne **avant les lignes de sous-total** de la phase (les lignes `**Sous-total…**` et `**Prévisionnel…**`).
4. **Recalculer** les sous-totaux de la phase (voir section Recalcul).
5. **Recalculer** le récapitulatif global (voir section Récapitulatif global).
6. Rebuild MkDocs + commit + push (voir section Après modification).

**Ne jamais inventer** une description, un montant, une date ou un statut. Strictement ce que l'utilisateur a fourni.

## Opération : mettre à jour un élément existant

1. Identifier la ligne à modifier par la description (matching textuel).
2. Si plusieurs lignes matchent, demander laquelle via AskUserQuestion.
3. Modifier les colonnes indiquées par l'utilisateur (montant, statut, date, type).
4. Recalculer les sous-totaux de la phase + récapitulatif global.
5. Rebuild MkDocs + commit + push.

## Opération : consulter

Afficher le contenu de la phase demandée, ou le récapitulatif global si aucune phase précisée.

## Recalcul des sous-totaux par phase

Après chaque modification, recalculer et réécrire les lignes de sous-total de la phase concernée.

**Règle fondamentale : le total réel n'inclut jamais les montants prévisionnels.**

### Calcul

- **Réel** = somme des lignes `Type = Réel` où `Montant ≠ —`
- **Prévisionnel** = somme des lignes `Type = Prévisionnel` où `Montant ≠ —`
- Si au moins une ligne Réel a `Montant = —` → ajouter une note `*(+ X à renseigner)*` (X = nb de lignes avec montant inconnu)
- Si au moins une ligne Prévisionnel a `Montant = —` → ajouter `*(partiel)*` ou `*(reste à compléter)*`

### Format des lignes de sous-total (à réécrire après chaque modif)

```
**Sous-total réel payé** : <montant> € [*(+ N à renseigner)*]
**Prévisionnel** : <montant> € [*(partiel)*]
```

Si réel = 0 ou inconnu : `**Sous-total réel engagé** : —`
Si prévisionnel = 0 ou inconnu : `**Prévisionnel** : *(à renseigner)*`
Si prévisionnel partiel connu : `**Prévisionnel partiel** : <montant> € *(reste à compléter)*`

Adapter le libellé selon la phase :
- Phase 1 : `**Sous-total réel payé**`
- Phases 2, 3, 4, 5 : `**Sous-total réel engagé**`

## Récapitulatif global

En bas du fichier, réécrire le tableau récapitulatif global après chaque modification :

```markdown
| Phase | Réel payé (€) | Prévisionnel (€) |
|---|---|---|
| 1 — Achat véhicule | <réel P1> | <prévi P1> |
| 2 — Préparation export | <réel P2> | <prévi P2> |
| 3 — Restauration Maroc | <réel P3> | <prévi P3> |
| 4 — Préparation raid | <réel P4> | <prévi P4> |
| 5 — Raid | <réel P5> | <prévi P5> |
| **TOTAL** | **<somme réels>** | **<somme prévis>** |
```

- Réel payé = somme des Réel connus de la phase (jamais les Prévisionnels)
- Si réel = 0 : `—`
- Si partiel (certains Réels inconnus) : `<montant> +`
- Si prévisionnel partiel : `<montant> +`

## Après modification

Une fois `budget.md` modifié et les totaux recalculés :

```bash
cd /chemin/vers/repo/web && .venv/bin/mkdocs build
```

Puis commit + push :
```bash
git add budget.md
git commit -m "budget: <description courte de la modification>"
git push
```

## Règles

- **Ne jamais éditer `web/docs/budget.md`** — c'est un symlink, toujours éditer `budget.md` racine.
- **Le total réel n'inclut jamais les montants prévisionnels.**
- Ne jamais inventer de montant, description ou date.
- Montants : séparateur milliers = espace, décimales = point, inconnu = `—`.
- Après chaque modification : recalcul phase + récap global + rebuild + push, sans exception.
