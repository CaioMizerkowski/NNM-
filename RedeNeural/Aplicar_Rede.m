function [Saida] = Aplicar_Rede(Entrada,Vetor_Pesos)
    %Ter que salvar em cada fase os valores de entrada e sa�da dos
    %neuronios, acho que no final vai ser melhorar tornar essa fun��o de
    %uma entrada e uma sa�da, que puxa os valores dos pesos por string e
    %criar uma fun��o acima desta que reprodu��o a quantidade de vezes que
    %eu preciso...
    %Passar a receber uma strutc de pesos

    [Pesos1,Pesos2] = Vetor_2_Matriz(Vetor_Pesos);
    clear Vetor_Pesos
    %[C,N]=[C,E+1]*[E+1,N]
    [Saida] = Multi_Matriz(Pesos1,Entrada,true);
    %[C,S]=[C,N+1]*[N+1,S]
    [Saida] = Multi_Matriz(Pesos2,Saida,true);
end