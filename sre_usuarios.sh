#!/bin/bash

# Utilizando AWK para imprimir linhas com prefixo "sre_" do arquivo /etc/passwd
awk -F: '/^sre_/ {print}' /etc/passwd