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