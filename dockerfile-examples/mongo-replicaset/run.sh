#!/bin/sh
#
# Program: run mongod service
#
# History: zhezhang	2017/06/07
#

# Pre Set
set -e

# Set Var
MgoHome=/home/mgo
Config=${MgoHome}/mongod.conf
Options="--quiet --config ${Config}"
CMD=/usr/bin/mongod

# Run
${CMD} ${Options}
