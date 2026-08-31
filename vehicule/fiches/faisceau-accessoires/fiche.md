# Faisceau accessoires / gadgets

Faisceau électrique dédié aux gadgets et accessoires raid, indépendant du câblage d'origine de la 403.

## Principe

- Faisceau séparé, piloté depuis une **boîte à fusibles / relais** unique
- Alimentation sur la batterie via un **disjoncteur principal** (ou coupe-circuit)
- Chaque circuit protégé individuellement par fusible
- Masse dédiée sur carrosserie (point propre)

## Circuits prévus

| N° | Accessoire | Puissance estimée | Fusible | Remarques |
|---|---|---|---|---|
| 1 | Compresseur (trompettes + gonflage) | ~15–25 A | 25 A | Via relais, piloté depuis bouton habitacle |
| 2 | Barre sono (ampli Bluetooth + HP horn) | ~10 A | 15 A | Alimentation permanente batterie sono galerie |
| 3 | Sirène + micro PTT | ~5 A | 10 A | Partagé avec barre sono ou circuit dédié |
| 4 | Klaxon trompettes | ~10 A | 15 A | Via relais, piloté depuis klaxon d'origine ou bouton |
| 5 | Barre LED toit | ~5–10 A | 15 A | Selon longueur / puissance de la barre |
| 6 | Phares antibrouillard LED x2 | ~5 A | 10 A | Via relais, homologation à prévoir |
| 7 | TPMS | <1 A | 5 A | Alimentation USB ou solaire en priorité |

## Schéma de principe

```
Batterie (+)
    │
    ├─ Coupe-circuit / disjoncteur principal
    │
    └─ Boîte à fusibles/relais
           ├─ F1 — Compresseur ──────────── Relais ── Compresseur galerie
           ├─ F2 — Sono ─────────────────────────── Ampli BT + HP horn
           ├─ F3 — Sirène PTT ───────────────────── Sirène + micro
           ├─ F4 — Klaxon trompettes ────── Relais ── 4x trompettes
           ├─ F5 — Barre LED ────────────── Relais ── LED toit
           ├─ F6 — Antibrouillard ─────────Relais ── 2x phares LED
           └─ F7 — TPMS ────────────────────────── Module TPMS
```

## Emplacement boîte à fusibles

- [ ] À définir — habitacle ou coffre / galerie ?
- [ ] Accessible facilement pour intervention en raid

## Câblage

- [ ] Section câble alimentation principale : **6 mm²** minimum (selon longueur)
- [ ] Sections circuits individuels : 2,5 mm² (petits circuits) / 4–6 mm² (compresseur)
- [ ] Gaines tressées ou spiralées pour protection
- [ ] Connecteurs étanches (Deutsch DT ou équivalent) pour traversées de carrosserie

## Étapes d'installation — circuit principal

Liste ordonnée — vérifications/choix en premier, fabrication et pose ensuite.

### Phase 1 — Choix et mesures (avant toute commande ou fabrication)

- [ ] **Choisir le modèle de porte-fusible double Midi** — noter le diamètre des trous de cosses en entrée et en sortie (M8 ou M10)
- [ ] **Définir l'emplacement exact du coupe-circuit** dans la baie moteur (près de la batterie, accessible) — détermine la longueur du câble entre la borne + batterie et le coupe-circuit
- [ ] **Définir la taille des inserts filetés** pour la fixation du support coupe-circuit dans la baie moteur
- [ ] **Définir l'emplacement exact du porte-fusible double Midi** (côté baie moteur, près du pare-feu)
- [ ] **Inspecter le câble + batterie existant** — confirmer la section (35 mm² ?) et mesurer la longueur totale pour calculer les deux segments (batterie → coupe-circuit, coupe-circuit → démarreur)
- [ ] **Confirmer le diamètre du boulon démarreur** (M10 présumé — mesurer sur le véhicule)
- [ ] **Inspecter le câble habitacle existant** (démarreur → habitacle) — relever section, type de cosse, longueur disponible ; vérifier compatibilité avec la sortie du porte-fusible Midi retenu
- [ ] **Calculer la section du câble démarreur → porte-fusible** — selon distance mesurée et courant max du circuit (courant de charge + courant consommateurs habitacle)

### Phase 2 — Fabrication

- [ ] **Fabriquer le support coupe-circuit** → voir [fiche coupe-circuit](../coupe-circuit/fiche.md)
  - [ ] Trouver la tôle (acier 1,6 ou 2 mm, dimensions suffisantes pour le développé)
  - [ ] Découper selon le patron développé
  - [ ] Plier aux lignes de pliage
  - [ ] Souder les pliages
  - [ ] Poser les inserts filetés (taille définie en Phase 1)

### Phase 3 — Installation

- [ ] **Installer le coupe-circuit** sur son support, côté baie moteur près de la batterie
- [ ] **Modifier le câble + batterie** — séparer en deux segments :
  - Segment 1 : conserve la cosse batterie → va jusqu'au coupe-circuit → ajouter cosse 35 mm² trou M10 côté coupe-circuit
  - Segment 2 : repart du coupe-circuit → va jusqu'au démarreur → ajouter cosse 35 mm² trou M10 côté coupe-circuit
- [ ] **Installer le porte-fusible double Midi** à l'emplacement défini en Phase 1
- [ ] **Refaire le câble démarreur → entrée porte-fusible double Midi** — section et cosses déterminées en Phase 1 (M10 démarreur / M8 ou M10 porte-fusible)
- [ ] **Déplacer le câble habitacle** — décrocher du démarreur, adapter la cosse si nécessaire, brancher en sortie d'une voie du porte-fusible Midi

## À faire — faisceau accessoires

- [ ] Décider emplacement boîte à fusibles
- [ ] Dimensionner câblage principal (mesure longueur depuis batterie)
- [ ] Choisir modèle boîte à fusibles (blade fuse block avec relais intégrés)
- [ ] Tirer le faisceau et connecter circuit par circuit
- [ ] Documenter les connexions finales

## Notes

<!-- compléter au fur et à mesure -->
