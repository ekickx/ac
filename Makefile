.PHONY: test prepare macos-prepare download-img

prepare:
	@if [ ! -d "./vendor/plenary.nvim" ]; then \
		mkdir -p vendor; \
		git clone --depth=1 https://github.com/nvim-lua/plenary.nvim vendor/plenary.nvim; \
	fi

download-img:
	@curl -fLo test/expected.png https://link.ekickx.vercel.app/clipboard-image.nvim/test_expected.png

macos-prepare: download-img
	brew update && \
	brew install pngpaste && \
	./test/macos-copy-file test/expected.png

test: prepare
	@nvim \
		--headless \
		--noplugin \
		-u test/minimal_init.vim \
		-c "PlenaryBustedDirectory test/ { minimal_init = './test/minimal_init.vim' }"
