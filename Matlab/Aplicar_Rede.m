function [SaidaY] = Aplicar_Rede(Entrada,Struct_Pesos)
    %Ter que salvar em cada fase os valores de entrada e sa�da dos
    %neuronios, acho que no final vai ser melhorar tornar essa fun��o de
    %uma entrada e uma sa�da, que puxa os valores dos pesos por string e
    %criar uma fun��o acima desta que reprodu��o a quantidade de vezes que
    %eu preciso...
    %Passar a receber uma strutc de pesos
    
    %[C,N]=[C,E+1]*[E+1,N]
    [SaidaY] = Multi_Matriz(Entrada,Struct_Pesos.Pesos1,true,'Dados/Camada_Hidden1.mat');
    %[C,S]=[C,N+1]*[N+1,S]
    [SaidaY] = Multi_Matriz(SaidaY,Struct_Pesos.Pesos2,true,'Dados/Camada_Final.mat');
    save('Dados/SaidaY.mat','SaidaY')
end