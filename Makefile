###############################################################################
#                            Makefile pour la thèse                           #
###############################################################################

# Variables de construction ###################################################
MAIN_TEX = main.tex# Fichier principal.
MAIN_TEMP = temp.tex# Fichier temporaire.
OUT_DIR = build# Répertoire de construction.
SIMPLE_DIR = tmp# Répertoire temporaire.
LUALATEX_FLAGS = -halt-on-error -interaction=nonstopmode -shell-escape

PDG = 1ere.tex
export PDG

LATEX_PROCESSOR = lualatex
#LATEX_PROCESSOR = xelatex
#LATEX_PROCESSOR = pdflatex

ALL_TEX := $(shell find $(SOURCEDIR) -name '*.tex')
ALL_PNG := $(shell find $(SOURCEDIR) -name '*.png')
ALL_JPEG := $(shell find $(SOURCEDIR) -name '*.jpeg')
ALL_JPG := $(shell find $(SOURCEDIR) -name '*.jpg')
ALL_SVG := $(shell find $(SOURCEDIR) -name '*.svg')
ALL_PDF := $(shell find $(SOURCEDIR) -name '*.pdf')

ALL_BK := $(shell find $(SOURCEDIR) -name '*.bak*')

# Toutes les constructions. ###################################################
# Créer le fichier final.
all: these slides

# Supprime les constructions.
clean: bak_clean post_clean
	@rm -rf $(OUT_DIR)

these: pdg pdf post_clean

slides:
	$(MAKE) -C Soutenance/

# Créer un pdf.
pdf: create_out_dir
	$(LATEX_PROCESSOR) --output-directory=$(OUT_DIR) \
	$(LUALATEX_FLAGS) $(MAIN_TEX)
	makeglossaries -d $(OUT_DIR) $(basename $(MAIN_TEX))
	biber $(OUT_DIR)/$(basename $(MAIN_TEX))
	$(LATEX_PROCESSOR) --output-directory=$(OUT_DIR) \
	$(LUALATEX_FLAGS) $(MAIN_TEX)

# Créer le pdf du dossier temp.
pdf_temp: create_out_dir
	$(LATEX_PROCESSOR) $(LUALATEX_FLAGS) --output-directory=$(OUT_DIR) \
	$(LUALATEX_FLAGS) TEMP/$(MAIN_TEMP)

# Créer le répertoire de sortie.
create_out_dir:
	@if [ ! -d $(OUT_DIR) ]; then mkdir -p $(OUT_DIR)/$(OUT_DIR); fi

# Supprime les fichiers dissident de la construction
post_clean:
	@rm -f *.glo
	@rm -f *.glsdefs
	@rm -f *.acn
	@rm -f *.ist
	@rm -f *.mtc*
	@rm -f *.maf
	@rm -f *.run.xml

# Créer la page de garde
pdg:
	@$(MAKE) -C 00_Guards/

# Ajuste automatiquement les indentations de tous les fichiers tex.
format: format_temp bak_clean

format_temp:
	@$(foreach tex,$(ALL_TEX), latexindent -w $(tex);)


# Supprimer les fichier backup de latexindent.
bak_clean:
	@rm -f bib/*.sav
	@rm -f bib/*.bak
	@rm -f $(ALL_BK)
	@rm -f indent.log

# Save
save:
	@tar -zcvf $(shell date +%Y_%m_%d)_thesis.tar.gz $(ALL_TEX) $(ALL_PNG) $(ALL_JPEG) $(ALL_JPG) $(ALL_SVG) $(ALL_PDF)