all: fmt lint

fmt:
	shfmt --keep-padding -s -i 2 -w git-smart-pull git-smart-push

lint:
	shellcheck git-smart-pull git-smart-push
