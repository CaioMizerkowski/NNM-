function [Saida] = Aplicar_Rede(Entrada,Vetor_Pesos)
    %Ter que salvar em cada fase os valores de entrada e saída dos
    %neuronios, acho que no final vai ser melhorar tornar essa função de
    %uma entrada e uma saída, que puxa os valores dos pesos por string e
    %criar uma função acima desta que reprodução a quantidade de vezes que
    %eu preciso...
    %Passar a receber uma strutc de pesos

    [Pesos1,Pesos2] = Vetor_2_Matriz(Vetor_Pesos);
    clear Vetor_Pesos
    %[C,N]=[C,E+1]*[E+1,N]
    [Saida] = Multi_Matriz(Pesos1,Entrada,true);
    %[C,S]=[C,N+1]*[N+1,S]
    [Saida] = Multi_Matriz(Pesos2,Saida,true);
end