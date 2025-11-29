#!/bin/bash

# ----------------------------------------------------------------------------------
# 1. CRIAÇÃO DE GRUPOS
# ----------------------------------------------------------------------------------
echo "Criando grupos de usuários..."

# A opção -f (force) garante que o comando não falhe se o grupo já existir.
groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

echo "Grupos criados com sucesso."
echo "----------------------------------------------------------------------------------"


# ----------------------------------------------------------------------------------
# 2. CRIAÇÃO DE DIRETÓRIOS
# ----------------------------------------------------------------------------------
echo "Criando diretórios..."

mkdir /publico
mkdir /adm
mkdir /ven
mkdir /sec

echo "Diretórios criados com sucesso."
echo "----------------------------------------------------------------------------------"


# ----------------------------------------------------------------------------------
# 3. ATRIBUIÇÃO DE PROPRIETÁRIO E PERMISSÕES
# ----------------------------------------------------------------------------------
echo "Atribuindo proprietário e definindo permissões..."

# Definindo o usuário 'root' como proprietário de todos os diretórios
chown root:root /publico
chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

# Permissões:
# - /publico: Acesso total para todos (777).
# - /adm, /ven, /sec:
#   - Proprietário (root): Leitura, Escrita, Execução (rwx -> 7)
#   - Grupo (GRP_X): Leitura, Escrita, Execução (rwx -> 7)
#   - Outros: Nenhuma permissão (--- -> 0)
chmod 777 /publico
chmod 770 /adm
chmod 770 /ven
chmod 770 /sec

echo "Permissões definidas com sucesso."
echo "----------------------------------------------------------------------------------"


# ----------------------------------------------------------------------------------
# 4. CRIAÇÃO DE USUÁRIOS
# ----------------------------------------------------------------------------------
echo "Criando usuários e atribuindo-os aos grupos..."

# Opções do useradd:
# -m: Cria o diretório home do usuário
# -s /bin/bash: Define o shell de login
# -p $(openssl passwd -1 Senha123): Define a senha criptografada (Use uma senha mais forte!)
# -G GRUPO: Adiciona o usuário ao grupo especificado

# --- Usuários ADM (Grupo GRP_ADM) ---
useradd carlos -m -s /bin/bash -p $(openssl passwd -1 Senha123) -G GRP_ADM
useradd maria -m -s /bin/bash -p $(openssl passwd -1 Senha123) -G GRP_ADM
useradd joao -m -s /bin/bash -p $(openssl passwd -1 Senha123) -G GRP_ADM

# --- Usuários VEN (Grupo GRP_VEN) ---
useradd debora -m -s /bin/bash -p $(openssl passwd -1 Senha123) -G GRP_VEN
useradd sebastiana -m -s /bin/bash -p $(openssl passwd -1 Senha123) -G GRP_VEN
useradd roberto -m -s /bin/bash -p $(openssl passwd -1 Senha123) -G GRP_VEN

# --- Usuários SEC (Grupo GRP_SEC) ---
useradd josefina -m -s /bin/bash -p $(openssl passwd -1 Senha123) -G GRP_SEC
useradd amanda -m -s /bin/bash -p $(openssl passwd -1 Senha123) -G GRP_SEC
useradd rogerio -m -s /bin/bash -p $(openssl passwd -1 Senha123) -G GRP_SEC

echo "Usuários criados e atribuídos com sucesso."
echo "----------------------------------------------------------------------------------"

echo "✅ Fim da configuração da infraestrutura!"
