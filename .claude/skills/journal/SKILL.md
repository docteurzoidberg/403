---
name: journal
description: Ajoute, consulte ou liste des entrées dans les journaux (suivi.md) du projet 403. Utiliser quand l'utilisateur veut noter un événement, une action, une conversation, ou consulter l'historique d'une phase.
---

# /journal — journaux de suivi projet 403

## Les 5 journaux

| Code | Journal | Fichier |
|---|---|---|
| `achat` | Achat du véhicule | `vehicule/01-achat/suivi.md` |
| `export` | Préparation export / transport Maroc | `vehicule/02-preparation-export/suivi.md` |
| `resto` | Restauration au Maroc | `vehicule/03-restauration-maroc/suivi.md` |
| `prep-raid` | Préparation raid — côté véhicule | `vehicule/04-preparation-raid/suivi.md` |
| `inscription` | Inscriptions / admin raid | `raid/01-inscription/suivi.md` |

## Format d'une entrée

Les entrées sont ajoutées dans la section `## Journal` de chaque fichier, **en haut**, par ordre antichronologique (entrée la plus récente en premier). Les entrées sont séparées par une ligne `---` :

```markdown
### YYYY-MM-DD — <Titre court>

Contenu libre (texte, listes à puces, sous-sections, etc.)

---
```

## Opérations

### Ajouter une entrée

Insérer sous `## Journal`, juste après le commentaire HTML et **avant** la première entrée existante, suivie d'un séparateur `---` :

```
### YYYY-MM-DD — <titre>

<contenu>

---
```

Ne jamais réordonner ni réécrire les entrées existantes.

**Règles :**
- Date : celle fournie par l'utilisateur, ou date du jour si non précisée.
- Titre : formulation courte fournie par l'utilisateur. Ne pas inventer ni reformuler au-delà.
- Contenu : strictement ce que l'utilisateur a dit. Ne rien inventer, ne rien compléter.
- Ne jamais cocher automatiquement un item dans taches.md suite à une entrée journal.

### Consulter / lire un journal

Afficher le contenu de la section `## Journal` du fichier cible.

### Lister les journaux (sans argument)

Afficher pour chaque journal le nombre d'entrées et le titre de la dernière entrée.

## Identification du journal cible

- L'utilisateur peut utiliser le code (`achat`, `export`, `resto`, `prep-raid`, `inscription`) ou une formulation libre ("achat", "transport", "Maroc", "restauration", "raid", "inscription", etc.).
- Si l'intention est claire d'après le contexte, agir directement.
- Si ambigu, demander parmi les 5 journaux.

## Règles

- **Ne jamais inventer** de contenu. Strictement ce que l'utilisateur a dit.
- Ne pas modifier les autres sections du fichier (entête, historique, etc.).
- Après ajout, confirmer avec le titre et la date de l'entrée créée.
