###############################################################################
#                            Makefile pour la thèse                           #
###############################################################################

# Variables de construction ###################################################
MAIN_TEX = 'main.tex' # Fichier principal
OUT_DIR = thesis # Répertoire de construction
SIMPLE_DIR = tmp # Répertoire temporaire
LUALATEX_FLAGS = --halt-on-error 

# Toutes les constructions ####################################################
all: create_out_dir
	lualatex $(LUALATEX_FLAGS) --output-directory=$(OUT_DIR) \
	$(MAIN_TEX)

biber:
	biber $(OUT_DIR)/$(basename $(MAIN_TEX))

create_out_dir:
	if [ ! -d $(OUT_DIR) ]; then mkdir $(OUT_DIR); fi

# Supprime les constructions ##################################################
clean:
	rm -r $(OUT_DIR)

