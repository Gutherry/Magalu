#!/bin/bash

# Utilizando AWK para imprimir linhas com caracteres alfabéticos e espaços em branco
awk '/^[[:alpha:][:space:]]+$/ {print}' /usr/share/doc/gcc/README.Debian
