.DEFAULT_GOAL := help
.DENO := .deno-stable
.PHONY := help install-deno-stable install-deno-nightly

help : $(.DENO)
	@echo "You may want to run:"
	@echo
	@echo "    make game"
	@echo
	@echo "to compile game.ts, then run the result:"
	@echo
	@echo "    ./game"
	@echo
	@echo "Here's a single line for you to copy-paste:"
	@echo
	@echo "    make game && ./game"
	@echo

% :: %.ts *.ts *.js $(.DENO)
	@deno fmt
	@deno install --quiet --force --root=. --allow-all $@.ts >/dev/null
	@mv ./bin/$$(basename $@) $@
	@rm -r ./bin

% :: %.js *.ts *.js $(.DENO)
	@deno fmt
	@deno install --quiet --force --root=. --allow-all $@.js >/dev/null
	@mv ./bin/$$(basename $@) $@
	@rm -r ./bin

.deno-stable :
	@rm -f .deno-*
	deno upgrade || curl -fsSL https://deno.land/x/install/install.sh | sh
	@deno --version > .deno-stable

.deno-nightly :
	@rm -f .deno-*
	curl -fsSL https://denonightly.now.sh/sh | sh
	@deno --version > .deno-nightly
