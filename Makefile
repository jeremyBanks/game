.DEFAULT_GOAL := run-game
.PHONY : install-deno-stable install-deno-nightly

% :: %.ts *.ts .deno-nightly
	deno --unstable compile $@.ts

run-game: game
	./game

.deno-stable :
	rm -f .deno .deno-nightly
	deno upgrade || curl -fsSL https://deno.land/x/install/install.sh | sh
	deno --version > .deno-stable

.deno-nightly :
	rm -f .deno .deno-nightly
	curl -fsSL https://denonightly.now.sh/sh | sh
	deno --version > .deno-nightly
