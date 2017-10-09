function [Vetor_Pesos] = Criar_Pesos_Random
    load('Dados.mat','Num_Entradas','Num_Neuronios','Num_Saidas')

    %Cria��o das matrices de pesos sinapticos
    %[E+1,N] -> Antes da fun��o de ativia��o
    Matriz_Pesos = rand(Num_Entradas+1,Num_Neuronios);
    Matriz_Pesos = (Matriz_Pesos(:));
    %[N+1,S] -> Depois da fun��o de ativa��o
    %%Matriz_Pesos2 = 2*rand(Num_Neuronios+1,Num_Saidas)-1;
    Matriz_Pesos2 = rand(Num_Neuronios+1,Num_Saidas);
    Matriz_Pesos2 = (Matriz_Pesos2(:));
    Vetor_Pesos = [Matriz_Pesos;Matriz_Pesos2];
end

