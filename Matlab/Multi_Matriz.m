function [Saida] = Multi_Matriz(Entrada,Pesos,ativar,camada)
    Entrada = [Entrada,ones(size(Entrada,1),1)];%Bias
    %[C,S] = [C,E+1]*[E+1,S]
    Saida = Entrada*Pesos;%Pesos
    if ativar
        Saida = 2./(1+exp(-2*Saida))-1;%Ativação
    end
    save(camada,'Entrada','Saida');
end