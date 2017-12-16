RedeNeural:
#É a rede neural, eu presumo.

#Salvando Infos
-Ajusta os dados complexos para a arquitetura da rede.
--Considera in como a saída da rede e out como a entrada da rede.

#Parte Real
-Recebe os dados e aplica a função lsqnonlin para encontrar os pesos que melhor se ajustem a rede.
--Entra na função treinamento, que procura os melhores pesos.
---Aplicar rede aos dados de entrada e calcula o MSE.
---#Função de Gravação ativa aqui.
---Treinamento em vários epochs.
----Encontra os melhores pesos.

#Parte Imaginaria
-Recebe os dados e aplica a função lsqnonlin para encontrar os pesos que melhor se ajustem a rede.
--Entra na função treinamento, que procura os melhores pesos.
---Aplicar rede aos dados de entrada e calcula o MSE.
---#Função de Gravação ativa aqui.
---Treinamento em vários epochs.
----Encontra os melhores pesos.

#Validar
-Ajusta os dados de validação.
--Considera in como a saída e out como a entrada.
--Aplica a rede com os pesos adquiridos aos dados para validação.
---Encontra a saída da rede neural dos dados da validação e compara com os valores esperados.
---Caldula o erro MSE da parte real e da parte imaginaria.

#Plotagem
-Plota e salva.