###############################################################################
#                            Makefile pour la soutenance                      #
###############################################################################

# Variables de construction ###################################################
MAIN_TEX = main.tex# Fichier principal.
MAIN_TEMP = temp.tex# Fichier temporaire.
OUT_DIR = build# Répertoire de construction.
SIMPLE_DIR = tmp# Répertoire temporaire.
LUALATEX_FLAGS = -halt-on-error -interaction=nonstopmode -shell-escape
LATEX_PROCESSOR = pdflatex

ALL_TEX := $(shell find $(SOURCEDIR) -name '*.tex')
ALL_IMG := $(shell find $(SOURCEDIR) -name '*.png' -o -name '*.png')
ALL_BK := $(shell find $(SOURCEDIR) -name '*.bak*')

# Toutes les constructions. ###################################################
# Créer le fichier final.
all: pdf post_clean

# Supprime les constructions.
clean: bak_clean post_clean
	@rm -rf $(OUT_DIR)

# Créer un pdf.
pdf: create_out_dir
	$(LATEX_PROCESSOR) --output-directory=$(OUT_DIR) \
	$(LUALATEX_FLAGS) $(MAIN_TEX)
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
	@tar -zcvf $(shell date +%Y_%m_%d)_thesis.tar.gz $(ALL_TEX) $(ALL_IMG)