# Thèse NPM

Ceci est le répertoire LaTeX de ma thèse. Il coentient toutes les ressources nécessaire pour assembler et construire la thèse.

La thèse porte sur la conception de profileurs non intrusif pour le faisceau de protons de la future source de spallation Européenne (ESS).

## Dépendances

### Software

J'utilise pour la rédaction de ma thèse :

- GNU Make : pour automatiser la construction de la thèse si je n'utilise pas TeXStudio/TeXMaker.
- TeXStudio/TeXMaker comme IDE LaTeX.
- GNU Emacs ou Visual Studio Code comme éditeur de texte.
- LanguageTool Server, un serveur de correction grammatical/orthographique.
- JabRef comme gestionaire de ressources bibliographiques.

### LaTeX

J'utilise les packages LaTeX suivants:

- BibLaTeX: pour la bibliographie.
- Biber: pour la génération de la bibliographie.
- TikZ: pour faire les dessins et autre.
- graphicx: pour les insertion d'images.
- asmath: pour la numérotation des équations.
- booktabs: pour des tableaux plus lisibles.
- textpos: placer des textes.
- hyperref: pour faire des liens dans le documents.
- lipsum: pour generer des lipsum (totalement optionnel).
- array: pour faire des tableaux.
- multicol: pour faire des multiples colonnes dans un document.
- helvet: support de la police Helvetica (si besoin).
- xcolor: pour une gestion avancée des couleurs.
- appendix: pour les annexes.
- url: pour gerer les liens externes.
- subcaption: pour les sous figures.
- minitoc: pour générer des tables des matières à chaque chapitre.

## Organisation

### Dossier racine

| Répertoire      | Description                                     |
|-----------------|-------------------------------------------------|
| thesis          | Dossier de construction                         |
| XX_TEMPLATE     | Dossier contenant des modèles tex               |
| 00_Guards       | Contient la page de garde et 4ème de couverture |
| 01_Introduction | Chapitre d'introduction de la thèse             |
| 02_BeamDiag     | Chapitre sur la dynamique faisceau et diag      |
| 03_Prototype    | Chapitre sur la simulation des prototypes       |
| 04_Prototype    | Chapitre sur la conception/tests des prototypes |
| 05_Conclusion   | Chapitre de conclusion                          |

### Dossier chapitre

Chaque chapitre est organisé de la manière suivante:

- Un fichier LaTeX principal
- Un dossier avec les figures
- Un dossier avec les tableaux

## Utilisation

### Via un éditeur LaTeX

Avec un éditeur de texte comme TexStudio ou TeXMaker il suffit simplement d'ouvrir le fichier main.tex et de lancer la compilation. Attention cependant l'ensemble des fichiers de sortie sont mis dans le répertoire principal. La compilation doit également fonctionner sous ShareLaTeX.

### Via le Makefile

```sh
make
```