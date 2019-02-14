# Thèse NPM

Ceci est le répertoire LaTeX de ma thèse.

## Dépendances
### Software

J'utilise pour la rédaction de ma thèse :

- GNU Make : pour automatiser la construction de la thèse 
si je n'utilise pas TeXStudio/TeXMaker
- TeXStudio/TeXMaker comme IDE LaTeX
- LanguageTool Server: serveur de correction grammatical/orthographique

### LaTeX

J'utilise les packages LaTeX suivants:
- TikZ: pour faire les dessins et autre.
- graphicx: pour les insertion d'images
- textpos: placer des textes
- booktabs: pour des tableaux plus lisibles
- appendix: pour les annexes
- url: pour gerer les liens
- subcaption: pour les sous figures

## Organisation

### Dossier racine

| Répertoire      | Description                                     |
|-----------------|-------------------------------------------------|
| thesis          | Dossier de construction                         |
| XX_TEMPLATE     | Dossier à copier pour chaque partie             |
| 00_Guards       | Contient la page de garde et 4ème de couverture |
| 01_Introduction | Chapitre d'introduction de la thèse             |
| XX_TEMPLATE     | Dossier à copier pour chaque partie             |
| XX_TEMPLATE     | Dossier à copier pour chaque partie             |
| EXAMPLE_PAUL    | Exemple de thèse LaTeX                          |

### Dossier chapitre

Chaque chapitre est organisé de la manière suivante:
- Un fichier LaTeX principal
- Un dossier avec les figures
- Un dossier avec les tableaux
