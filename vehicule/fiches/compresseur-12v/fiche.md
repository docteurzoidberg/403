# Fiche technique — Compresseur 12V DIY

Conception d'un compresseur 12V avec cuve intégrée (extincteur recyclé), pour alimenter les trompettes et gonfler les pneus en autonomie sur le raid.

---

## Principe général

Compresseur du commerce (gonfleur 12V à pinces batterie, sans réservoir) couplé à une cuve de fabrication maison à base d'un extincteur recyclé. Ensemble monté sur le véhicule, piloté par pressostat.

---

## Composants

### Compresseur

- Gonfleur 12V avec pinces batterie, sans réservoir intégré
- Consommation max : ~20 A (≈ 200 W)
- *(référence à définir)*

### Cuve

- **Corps** : extincteur recyclé (taille à définir selon volume souhaité)
- **Équipements montés sur la cuve :**
  - Soupape de sécurité (pression max)
  - Vanne de vidange — en partie basse (purge eau + dépressurisation)
  - Pressostat — coupe le compresseur quand la pression de consigne est atteinte, relance quand elle redescend
  - Manomètre

### Sorties (3 vannes)

| # | Usage | Raccord |
|---|---|---|
| 1 | Purge / vidange air directe | Vanne simple |
| 2 | Utilisation générale (gonflage pneus, soufflette…) | Raccord rapide européen standard |
| 3 | Réseau d'air trompettes | Régulateur de pression réglable + raccord tuyau PTFE pneumatique |

---

## Liste d'achats

| # | Composant | Remarque / Référence | Prix indicatif |
|---|---|---|---|
| 1 | **Compresseur de base** | VIAIR 400P (150 PSI, 2.54 CFM, 12A) — référence overland | ~150-180 € |
| | *Alternative budget* | Gonfleur double cylindre 12V 150 PSI (AliExpress) | ~20-40 € |
| 2 | **Pressostat 12V** | Pressostat mécanique universel type "train horn" 120-150 PSI — [Amazon B07RBJZPNN](https://www.amazon.fr/dp/B07RBJZPNN) | ~10-15 € |
| | *Alternative à étudier* | KEUPOK pressostat multi-ports intégré (ports + soupape de décharge inclus) — **220V natif**, à utiliser via relai 12V — [Amazon B0GVV9QKKT](https://www.amazon.fr/dp/B0GVV9QKKT) — vérifier si variante 12V dispo | ~26 € |
| | | ![KEUPOK pressostat](photos/keupok-pressostat.jpg) | |
| 3 | **Adaptateur tête extincteur** | M30×2 → 1/4" BSP (filetage à confirmer sur l'extincteur) | ~5-10 € |
| 4 | **Soupape de sécurité** | 10 bar, filetage 1/4" BSP | ~10-20 € |
| 5 | **Manomètre** | Glycérine 0-16 bar, Ø50mm, 1/4" BSP | ~10-15 € |
| 6 | **3× vannes quart de tour** | 1/4" BSP laiton | ~5 €/pièce |
| 7 | **Raccord rapide européen** | Type C / NF E 49-053, mâle 1/4" BSP (sortie gonflage) | ~5-10 € |
| 8 | **Régulateur de pression réglable** | Mini réducteur 1/4" BSP (sortie trompettes) | ~10-15 € |
| 9 | **Raccord push-in + tuyau PTFE** | 6 ou 8mm selon trompettes, 1/4" BSP | ~5-10 € + ~3-5 €/m |
| 10 | **Relai automobile 30A** | ISO mini | ~3-5 € |
| 11 | **Câble 4mm²** | Rouge + noir, ~2m chaque | ~5-8 € |
| 12 | **Porte-fusible + fusible 30A** | En ligne sur le + batterie | ~5 € |
| 13 | **Collecteur 4 voies 1/4" BSP** | Pour distribuer les 3 sorties + soupape depuis la cuve | ~15-20 € |
| 14 | **Assortiment raccords 1/4" BSP** | Nipples, coudes, tés selon montage final | ~10-20 € |

**Total estimé** : ~250-310 € avec VIAIR / ~120-170 € avec compresseur budget

---

## Points à définir

- Volume de la cuve (extincteur : quelle contenance ?)
- Pression de consigne du pressostat (en bar)
- Pression max admissible de la cuve (à vérifier sur l'extincteur)
- Référence du compresseur de base
- Implantation sur le véhicule (galerie, coffre, ailleurs ?)
- Schéma de câblage (fusible en ligne, relai commandé par le pressostat)

---

## Notes

*(à compléter au fil de la conception)*
