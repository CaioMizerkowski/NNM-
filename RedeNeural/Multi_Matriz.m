function [Saida] = Multi_Matriz(Pesos,Entrada,ativar)
    Entrada = [Entrada,ones(size(Entrada,1),1)];%Bias
    Saida = Entrada*Pesos;%Pesos
    if ativar
        Saida = 2./(1+exp(-2*Saida))-1;%Ativação
    end
end