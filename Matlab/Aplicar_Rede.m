function [SaidaY] = Aplicar_Rede(Entrada,Struct_Pesos)
    %Ter que salvar em cada fase os valores de entrada e saída dos
    %neuronios, acho que no final vai ser melhorar tornar essa função de
    %uma entrada e uma saída, que puxa os valores dos pesos por string e
    %criar uma função acima desta que reprodução a quantidade de vezes que
    %eu preciso...
    %Passar a receber uma strutc de pesos
    
    %[C,N]=[C,E+1]*[E+1,N]
    [SaidaY] = Multi_Matriz(Entrada,Struct_Pesos.Pesos1,true,'Dados/Camada_Hidden1.mat');
    %[C,S]=[C,N+1]*[N+1,S]
    [SaidaY] = Multi_Matriz(SaidaY,Struct_Pesos.Pesos2,true,'Dados/Camada_Final.mat');
    save('Dados/SaidaY.mat','SaidaY')
end