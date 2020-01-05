#!/bin/bash

# Makefile *requires* tabs for indentations
# https://stackoverflow.com/a/16945143/2054772

SHELL        = /bin/bash
export PATH := bin:$(PATH)

start:
	@bash -c "./bin/install.sh";

install:
	@bash -c "./bin/install.sh";

setup:
	@bash -c "./bin/setup.sh";
