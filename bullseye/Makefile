include ../mkpm.mk
ifneq (,$(MKPM_READY))
include $(MKPM)/gnu
include $(PROJECT_ROOT)/shared.mk

export NAME ?= bullseye
export VERSION ?= 0.0.1

include $(MKPM)/docker

.PHONY: work
work:
	@$(DOCKER) run -it --rm --workdir /tmp/debs -v $(PROJECT_ROOT)/debs:/tmp/debs $(IMAGE):latest

endif
