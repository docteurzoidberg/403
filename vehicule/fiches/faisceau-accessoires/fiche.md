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

## À faire

- [ ] Décider emplacement boîte à fusibles
- [ ] Dimensionner câblage principal (mesure longueur depuis batterie)
- [ ] Choisir modèle boîte à fusibles (blade fuse block avec relais intégrés)
- [ ] Tirer le faisceau et connecter circuit par circuit
- [ ] Documenter les connexions finales

## Notes

<!-- compléter au fur et à mesure -->
