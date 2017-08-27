function [SaidaY] = Multi_Matriz(Entrada,Pesos,ativar,camada)
    Entrada = [Entrada,ones(size(Entrada,1),1)];%Bias
    Saida = Entrada*Pesos;%Pesos
    if ativar
        SaidaY = 2./(1+exp(-2*Saida))-1;%Ativa��o
    end
    save(camada,'Entrada','Saida');
end