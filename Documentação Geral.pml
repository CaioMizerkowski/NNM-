Perceptron du Mal:
#Testes envolvendo o uso de um único perceptron de modo visual

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
---Calcula o erro MSE da parte real e da parte imaginaria.

#Plotagem
-Plota e salva.

Inversa:
#Tudo leva a crer que é a inversa, com muitas funções anonimas.
-As entradas_estimadas são o out.
-Carrega os pesos já calculados.
-Calcula amostra por amostra:
--Utiliza o !fsolve!
---Minimiza a diferença entre as saídas da rede por meio dos valores da entrada.
---Ou seja, descobre a entrada da rede que resulta em valores da saída. !Inversa!
---Utiliza as entradas passadas para encontrar a entrada atual, ao lado da saída atual.
---Os dados são ajustados conforme o esperado, tanto a entrada como a saída.
--Realiza a validação do resultados.
---Utiliza as entradas_estimadas para conseguir um conjunto de saídas.
---#Aqui se compara as saídas conseguidas com as reais.
--Plota.