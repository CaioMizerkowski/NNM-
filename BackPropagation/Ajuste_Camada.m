function [] = Ajuste_Camada
    rate = 0.5;
    Pesos = Pesos + rate*sigma.*Saida;
end