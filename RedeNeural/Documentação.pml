RedeNeural:
#� a rede neural, eu presumo.

#Salvando Infos
-Ajusta os dados complexos para a arquitetura da rede.
--Considera in como a sa�da da rede e out como a entrada da rede.

#Parte Real
-Recebe os dados e aplica a fun��o lsqnonlin para encontrar os pesos que melhor se ajustem a rede.
--Entra na fun��o treinamento, que procura os melhores pesos.
---Aplicar rede aos dados de entrada e calcula o MSE.
---#Fun��o de Grava��o ativa aqui.
---Treinamento em v�rios epochs.
----Encontra os melhores pesos.

#Parte Imaginaria
-Recebe os dados e aplica a fun��o lsqnonlin para encontrar os pesos que melhor se ajustem a rede.
--Entra na fun��o treinamento, que procura os melhores pesos.
---Aplicar rede aos dados de entrada e calcula o MSE.
---#Fun��o de Grava��o ativa aqui.
---Treinamento em v�rios epochs.
----Encontra os melhores pesos.

#Validar
-Ajusta os dados de valida��o.
--Considera in como a sa�da e out como a entrada.
--Aplica a rede com os pesos adquiridos aos dados para valida��o.
---Encontra a sa�da da rede neural dos dados da valida��o e compara com os valores esperados.
---Caldula o erro MSE da parte real e da parte imaginaria.

#Plotagem
-Plota e salva.