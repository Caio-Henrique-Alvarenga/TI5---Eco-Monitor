# Eco Monitor

Trabalho dos alunos do curso de Ciência da Computação da PUC Minas para a disciplina "Trabalho Interdisciplinar V: Sistemas Computacionais".

## Integrantes

Barbara Luciano Araujo, Caio Henrique Alvarenga Gonçalves, Daniel da Silveira Moreira, Luisa Nogueira Campos Silva Souza e Ricardo Henrique Guedes Furiati

## Sobre o Sistema
O sistema é composto por um microcontrolador Arduino que faz a leitura de sensores de temperatura, umidade e raios UV e transfere os dados para um módulo wi-fi ESP01. Através do ESP01, os valores lidos pelo arduino são transferidos para um Real Time Database hospedado na plataforma Firebase.
Um app flutter se conecta ao banco de dados, faz a leitura dos valores e os mostrta de forma dinâmica para que o usuário possa monitorar as condições de suas plantas.
