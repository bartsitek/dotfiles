#!/bin/bash

SHELL        = /bin/bash
export PATH := bin:$(PATH)

start:
	@bash -c "./bin/install.sh";

install:
	@bash -c "./bin/install.sh";
