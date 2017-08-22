function [Pesos,sigma] = Ajuste_Camada(Pesos,sigma)
    %%Sigma é um vetor ou uma matriz, vou ter que ver com calma.
    %%Saida é uma matriz, com certeza, considerando todos os pesos.
    %%E no final isso vai ter que dar uma matriz do tamanho da matriz de
    %%pesos, para bater tudo certo e fazer sentido
    rate = 0.5;
    Pesos = Pesos + rate*sigma.*Saida;
end