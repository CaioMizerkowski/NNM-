function [Saida] = Aplicar_Rede(Entrada,Vetor_Pesos)
    [Matriz_Pesos,Matriz_Pesos2] = Vetor_2_Matriz(Vetor_Pesos);
    clear Vetor_Pesos
    %[Q,E+1] -> Adicionado o vetor de Bias
   Entrada = [Entrada,ones(size(Entrada,1),1)];
    
    %[C,N]=[C,E+1]*[E+1,N] -> Multiplicação e Soma
    Y = Entrada*Matriz_Pesos;
    clear Entrada Matriz_Pesos
    
    %[C,N+1] -> Função de Ativação e Bias
    Y = 2./(1+exp(-2*Y))-1;
    Y(:,end+1) = 1;

    %[C,S]=[C,N+1]*[N+1,S]
    Saida = Y*Matriz_Pesos2;
    Saida = 2./(1+exp(-2*Saida))-1;
end

