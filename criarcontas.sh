#!/bin/bash

# Verifica se o arquivo de dados existe
arquivo_dados="/tmp/suporte/novosusuarios"
if [ ! -f "$arquivo_dados" ]; then
    echo "Erro: O arquivo de dados '$arquivo_dados' não foi encontrado."
    exit 1
fi

# Lê o arquivo de dados e cria contas de usuário
while IFS=":" read -r nome senha
do
    # Adiciona prefixo "sre_" ao nome do usuário
    nome_usuario="sre_$nome"

    # Cria a conta de usuário
    sudo useradd -m -p "$(openssl passwd -1 $senha)" "$nome_usuario"

    # Adiciona permissões de sudo para o usuário
    echo "$nome_usuario ALL=(ALL:ALL) ALL" | sudo tee -a /etc/sudoers

    echo "Conta de usuário '$nome_usuario' criada com sucesso."
done < "$arquivo_dados"

echo "Processo de criação de contas concluído."
