#!/bin/bash
# \file select-product.sh
# \brief Script to select a project to do the further treatments
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

# Get product directory
if [ -z "$PRODUCTNAME" ] && [ -n "$1" ]; then
  PRODUCTNAME=`basename $1`
fi

if [ -n "$PRODUCTNAME" ] && [ -d "/opt/$PRODUCTNAME" ]; then
  cd /opt/$PRODUCTNAME
else
  cd /opt
fi

if [ -z "$PARALLEL" ]; then
  PARALLEL=4
fi


# End of script
