include mkpm.mk
ifneq (,$(MKPM_READY))
include $(MKPM)/gnu
include $(MKPM)/dotenv
include shared.mk

.PHONY: work
work:
	@docker run -it --volume $(CURDIR)/work:/work --workdir /work --rm --entrypoint /bin/sh debian:bullseye /work/work.sh

.PHONY: fix-permissions
fix-permissions: | sudo
	@$(SUDO) $(CHOWN) -R $(USER):$(USER) .

%/build:
	@$(MAKE) -sC $* build ARGS=$(ARGS)

%/pull:
	@$(MAKE) -sC $* pull ARGS=$(ARGS)

%/push:
	@$(MAKE) -sC $* push ARGS=$(ARGS)

%/work:
	@$(MAKE) -sC $* work ARGS=$(ARGS)

endif
