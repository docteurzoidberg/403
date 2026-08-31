# Modification faisceau électrique

Fiabilisation du câblage d'origine + préparation pour futurs accessoires (hors gadgets raid).

## Matériel

- [x] Coupe-circuit rotatif à clé Master Switch — ref. Amazon B0C36X7LBV (2 clés fournies)
  ![Coupe-circuit à clé](photos/coupe-circuit-cle.png)
- [ ] Support coupe-circuit à concevoir/fabriquer (baie moteur)
- [ ] Tirette + câble bowden (commande habitacle → coupe-circuit)
- [x] Porte-fusible ANL 2 voies bolt-down, couvercle rouge — ref. Amazon B0FLT2RJMW
  ![Porte-fusible ANL 2 voies](photos/porte-fusible-anl.png)
- [x] 2 × fusible ANL 30 A
- [x] Porte-fusible ATO 4 voies (habitacle)
- [x] Fusibles ATO : 1 × 20 ou 25 A / 1 × 5 A / réserves
- [ ] Relais 12 V (type 5 broches, 30/40 A) — klaxon Ooga
- [x] Klaxon Ooga (puissance max 18 A)
- [x] Interrupteur momentané (trigger klaxon)
- [ ] Câble automobile multibrin (sections adaptées aux circuits)
- [ ] Cosses à sertir (anneau, fourche — assorties aux sections)
- [ ] Gaine thermorétractable (assortiment diamètres)
- [ ] Gaine tressée ou spiralée
- [ ] Passe-fils caoutchouc (traversées de tôle)

## Schéma d'origine

```
Batterie (+)
    └─ Démarreur (borne +)
           └─ Câble habitacle (tous circuits d'origine)
```

## Schéma modifié

```
Batterie (+)
    └─ Coupe-circuit à clé (baie moteur, proche batterie)
    │      [actionnable depuis habitacle via tirette + câble bowden]
           └─ Démarreur (borne +)
                  └─ Porte-fusible ANL 2 voies (baie moteur)
                         ├─ Voie 1 — 30 A → câble existant habitacle (circuits d'origine)
                         └─ Voie 2 — 30 A → câble vers habitacle
                                            └─ Porte-fusible ATO 4 voies (habitacle)
                                                   ├─ Voie 1 — 20/25 A → Relais klaxon Ooga
                                                   │                          └─ Klaxon Ooga
                                                   ├─ Voie 2 — 5 A    → Interrupteur momentané (trigger relais)
                                                   ├─ Voie 3 — 20 A    → Platine USB (préparation export)
                                                   │                          [chargeur USB-C 40W + prise allume-cigare 150W max]
                                                   └─ Voie 4 — réserve
```

## À faire

### Baie moteur

#### Phase 1 — Choix et mesures (avant toute commande ou fabrication)

- [ ] **Valider le diamètre des boulons du porte-fusible ANL** (entrée et sortie) — pour choisir les cosses adaptées (M8 ou M10)
- [ ] **Définir l'emplacement exact du coupe-circuit** dans la baie moteur (près de la batterie, accessible) — détermine la longueur du câble entre la borne + batterie et le coupe-circuit
- [ ] **Définir la taille des inserts filetés** pour la fixation du support coupe-circuit dans la baie moteur
- [ ] **Définir l'emplacement exact du porte-fusible ANL 2 voies** (côté baie moteur, près du pare-feu)
- [ ] **Confirmer le diamètre du boulon démarreur** (M10 présumé — mesurer sur le véhicule)
- [ ] **Inspecter le câble habitacle existant** (démarreur → habitacle) — relever section, type de cosse, longueur disponible ; vérifier compatibilité avec la sortie du porte-fusible ANL retenu
- [ ] **Calculer la section du câble démarreur → porte-fusible** — selon distance mesurée et courant max du circuit

#### Phase 2 — Fabrication

- [ ] **Fabriquer le support coupe-circuit** → voir [fiche coupe-circuit](../coupe-circuit/fiche.md)
  - [ ] Trouver la tôle (acier 1,6 ou 2 mm, dimensions suffisantes pour le développé)
  - [ ] Découper selon le patron développé
  - [ ] Plier aux lignes de pliage
  - [ ] Souder les pliages
  - [ ] Poser les inserts filetés (taille définie en Phase 1)

#### Phase 3 — Installation

- [ ] **Fixer le support** dans la baie moteur (trouver la visserie adaptée aux inserts choisis)
- [ ] **Monter le coupe-circuit** sur le support
- [ ] **Modifier le câble + batterie (35 mm²)** — séparer en deux segments, longueur segment 1 déterminée à l'étape de validation emplacement :
  - Segment 1 : conserve la cosse batterie → va jusqu'au coupe-circuit → ajouter cosse 35 mm² trou M10 côté coupe-circuit
  - Segment 2 : repart du coupe-circuit → va jusqu'au démarreur → ajouter cosse 35 mm² trou M10 côté coupe-circuit
- [ ] **Installer le porte-fusible ANL 2 voies** à l'emplacement défini en Phase 1
- [ ] **Refaire le câble démarreur → entrée porte-fusible ANL** — section et cosses déterminées en Phase 1 (M10 démarreur / M8 ou M10 porte-fusible)
- [ ] **Déplacer le câble habitacle** — décrocher du démarreur, adapter la cosse si nécessaire, brancher en sortie d'une voie du porte-fusible ANL

### Habitacle

→ Détail complet dans la [fiche tiroir électrique](../tiroir-electrique/fiche.md)

- [ ] **Concevoir le tiroir électrique** — tôle pliée, disposition interne (1 poussoir klaxon + 3 toggles, 4 relais, porte-fusible ATO 4 voies), façade détachable M4, platine USB fixée sous le tiroir
- [ ] **Concevoir le support tiroir** — après tiroir, glissières calquées sur ses dimensions, fixation tableau de bord + pare-feu
- [ ] **Définir l'emplacement** dans l'habitacle (position entre tableau de bord et pare-feu)
- [ ] **Fabriquer le tiroir électrique**
- [ ] **Fabriquer le support tiroir**
- [ ] **Installer le support** (fixation tableau de bord + pare-feu)
- [ ] **Câbler et installer le tiroir électrique** dans son support

---

## Interventions réalisées

| Date | Intervention | Résultat |
|---|---|---|
| | | |

## Photos

<!-- Ajouter dans photos/ au fil des travaux -->
