#!/usr/bin/env bash

echo "Limpando diretório de dados." | log debug data_compiler
rm -rf $MANUTENCAO_DATA_DIR/*
mkdir -p $MANUTENCAO_DATA_DIR/manutencao
echo "Parando serviços caso já estejam rodando." | log debug data_compiler
docker-compose down

cd scripts

run manutencao.sh

echo "Serviço configurado com sucesso!" | log info data_compiler
