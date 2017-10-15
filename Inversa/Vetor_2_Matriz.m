function [Matriz_Pesos,Matriz_Pesos2] = Vetor_2_Matriz(Vetor_Coluna)
    Num_Neuronios = 8;
    Num_Saidas = 1;
    Num_Entradas = 7;
    
    Matriz_Pesos = reshape(Vetor_Coluna(1:(Num_Entradas+1)*Num_Neuronios)...
        ,[Num_Entradas+1,Num_Neuronios]);
    Matriz_Pesos2 = reshape(Vetor_Coluna((Num_Entradas+1)*Num_Neuronios+1:end)...
        ,[Num_Neuronios+1,Num_Saidas]);
end