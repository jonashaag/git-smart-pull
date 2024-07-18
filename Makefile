all: fmt lint

fmt:
	shfmt --keep-padding -s -i 2 -w git-smart-pull

lint:
	shellcheck git-smart-pull
