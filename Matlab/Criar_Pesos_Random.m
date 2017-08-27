function [Struct_Pesos] = Criar_Pesos_Random
    load('Dados/Dados.mat','Num_Entradas','Num_Neuronios','Num_Saidas')

    %Criação das matrices de pesos sinapticos
    
    %[E+1,N] -> Antes da função de ativiação
    Pesos1 = 2*rand(Num_Entradas+1,Num_Neuronios)-1;
    
    %[N+1,S] -> Depois da função de ativação
    Pesos2 = 2*rand(Num_Neuronios+1,Num_Saidas)-1;
    
    clear Num_Entradas Num_Neuronios Num_Saidas
    Struct_Pesos = struct('Pesos1',Pesos1,'Pesos2',Pesos2);
end

