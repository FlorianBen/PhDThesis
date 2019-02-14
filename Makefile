###############################################################################
#                            Makefile pour la thèse                           #
###############################################################################

# Variables de construction ###################################################
MAIN_TEX = 'main.tex' # Fichier principal.
MAIN_TEMP = 'temp.tex' # Fichier temporaire.
OUT_DIR = thesis # Répertoire de construction.
SIMPLE_DIR = tmp # Répertoire temporaire.
LUALATEX_FLAGS = --halt-on-error 

ALL_TEX := $(shell find $(SOURCEDIR) -name '*.tex')
ALL_IMG := $(shell find $(SOURCEDIR) -name '*.png' -o -name '*.png')
ALL_BK := $(shell find $(SOURCEDIR) -name '*.bak*')

# Toutes les constructions ####################################################
# Créer le fichier final.
all: pdf

# Créer un pdf.
pdf: create_out_dir
	lualatex $(LUALATEX_FLAGS) --output-directory=$(OUT_DIR) \
	$(MAIN_TEX)

# Créer le pdf du dossier temp.
pdf_temp: create_out_dir
	lualatex $(LUALATEX_FLAGS) --output-directory=$(OUT_DIR) \
	TEMP/$(MAIN_TEMP)

# Créer la bibliographie.
biber:
	biber $(OUT_DIR)/$(basename $(MAIN_TEX))

# Ajuste automatiquement les indentations de tous les fichiers tex.
format:
	@$(foreach tex,$(ALL_TEX), latexindent -w $(tex);)

# Save
save:
	@tar -zcvf $(shell date +%Y_%m_%d)_thesis.tar.gz $(ALL_TEX) $(ALL_IMG)

# Supprimer les fichier backup de latexindent.
bak_clean:
	@rm $(ALL_BK)
	@rm indent.log

# Créer le répertoire de sortie.
create_out_dir:
	if [ ! -d $(OUT_DIR) ]; then mkdir $(OUT_DIR); fi

# Supprime les constructions ##################################################
clean:
	rm -r $(OUT_DIR)

