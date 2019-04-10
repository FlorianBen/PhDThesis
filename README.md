# Thèse NPM

Ceci est le répertoire LaTeX de ma thèse. Il coentient toutes les ressources nécessaire pour assembler et construire la thèse.

La thèse porte sur la conception de profileurs non intrusif pour le faisceau de protons de la future source de spallation Européenne (ESS).

## Dépendances

### Software

J'utilise pour la rédaction de ma thèse :

- GNU Make : pour automatiser la construction de la thèse si je n'utilise pas TeXStudio/TeXMaker.
- LuaLaTeX comme processeur LaTeX (pdfLaTeX devrait être aussi compatible)
- TeXStudio/TeXMaker comme IDE LaTeX.
- GNU Emacs ou Visual Studio Code comme éditeur de texte.
- LanguageTool Server, un serveur de correction grammatical/orthographique.
- JabRef comme gestionaire de ressources bibliographiques.

### LaTeX

J'utilise les packages LaTeX suivants:

- BibLaTeX: pour la bibliographie.
- Biber: pour la génération de la bibliographie.
- TikZ: pour faire les dessins et autre.
- circuitikz: module TikZ qui aide à dessiner des circuit
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
- shellesc: pour que LuaLaTeX puisse executer des instructions shell
- fancyhdr: pour personnaliser les en têtes et pieds de page
- inputenc: encodage des caractères d'entrées
- fontenc: encodage des caractères de sortie
- lmodern: police d'écriture LaTeX moderne (police vectorielle)
- wrapfig: pour mettre faire des images entourées de texte.
- svg: pour importer des images svg dans le document

## Organisation

### Dossier racine

| Répertoire      | Description                                     |
|-----------------|-------------------------------------------------|
| build           | Dossier de construction                         |
| bib             | Dossier contenant les fichiers BibTex           |
| XX_TEMPLATE     | Dossier contenant des modèles tex               |
| 00_Guards       | Contient la page de garde et 4ème de couverture |
| 01_Introduction | Chapitre d'introduction de la thèse             |
| 02_BeamDiag     | Chapitre sur la dynamique faisceau et diag      |
| 03_Prototype    | Chapitre sur la simulation des prototypes       |
| 04_Prototype    | Chapitre sur la conception/tests des prototypes |
| 05_Conclusion   | Chapitre de conclusion                          |
| SciencePlots    | Dossier contenant le thème matplotlib           |

### Dossier chapitre

Chaque chapitre est organisé de la manière suivante:

- Un fichier LaTeX principal
- Un dossier avec les figures
- Un dossier avec les tableaux

## Utilisation

### Via le Makefile (recommandé)

La construction de la thèse repose sur un Makefile. Pour construire il faut simplement lancer make:

```sh
make
```

Pour formater l'ensemble des fichier TeX:

```sh
make format
```

Pour nettoyer le dossier:

```sh
make clean
```

Pour sauvegarder le dossier:

```sh
make save
```

### Via un éditeur LaTeX

Avec un éditeur de texte comme TexStudio ou TeXMaker il suffit simplement d'ouvrir le fichier main.tex et de lancer la compilation. Attention cependant l'ensemble des fichiers de sortie sont mis dans le répertoire principal. La compilation doit également fonctionner sous ShareLaTeX.

## Comment ça marche

J'utilise LuaLaTeX pour générer le fichier PDF depuis mon fichier LaTeX principal.

Pour le format des images utilisées dans la thèse :

- PNG : pour les schémas simples et plots
- JPEG/JPG : pour les photographies ou les dessins complexes
- SVG : pour les plots de matplotlib ou ROOT

ROOT et matplotlib peuvent exporter les graphiques dans un fichier SVG qui permet la mise à l'echelle sans perte. Pour matplotlib j'utilise un thème pour avoir la même mise en forme tout au long du document. Le package svg de LaTeX va convertir chaque fichier svg en un fichier PDF. Les fichier PDF peuvent être réutilisés.

Pour des raisons de rapidité et de modularité la construction de la thèse est externalisé. C'est à dire que chaque étape crée des fichiers indépendants puis l'ensemble est fusionné dans un fichier principal. C'est très utile car TikZ est très lent. Il faut cependant bien supprimer les images intermédiaires si les originales ont été modifiées. Attention la numérotation des images n'a pas de rapport avec l'ordre d'apparition dans la thèse.