##
# \file Makefile
# \brief Makefile to create overware ovbuilder
# \author Jeremy HERGAULT (reneca)
# \version 1.0
# \date 2019-02-17
#
# This file is part of OVBuilder, which is builder for overware programs.
# Copyright (C) 2019  HERGAULT Jeremy, Alexandre, Thierry ( reneca )
#
# OVBuilder is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# OVBuilder is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with OVCloud. If not, see <http://www.gnu.org/licenses/>.
##

IMG_NAME=overware/ovbuilder

.PHONY: all debian centos run-debian run-centos clean-debian clean-centos clean


all: debian centos ## Make debian and centos builder

help:
	@grep -hE '(^[\.a-zA-Z_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[32m%-16s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'

debian: ## Make debian builder
	if ! echo "$(shell docker images $(IMG_NAME):debian)" | grep -q $(IMG_NAME); then docker build -f Dockerfile-debian -t $(IMG_NAME):debian .; fi

centos: ## Make centos builder
	if ! echo "$(shell docker images $(IMG_NAME):centos)" | grep -q $(IMG_NAME); then docker build -f Dockerfile-centos -t $(IMG_NAME):centos .; fi

run-debian: ## Try to run the debian builder
	docker run -ti --rm -h dev-build --name dev-build --entrypoint bash $(IMG_NAME):debian bash

run-centos: ## Try to run the centos builder
	docker run -ti --rm -h dev-build --name dev-build --entrypoint bash $(IMG_NAME):centos bash

clean-debian: ## Remove debian builder
	if echo "$(shell docker images $(IMG_NAME):debian)" | grep -q $(IMG_NAME); then docker rmi -f $(IMG_NAME):debian; fi

clean-centos: ## Remove centos builder
	if echo "$(shell docker images $(IMG_NAME):centos)" | grep -q $(IMG_NAME); then docker rmi -f $(IMG_NAME):centos; fi

clean: clean-debian clean-centos ## Remove debian and centos builder


# End of file
