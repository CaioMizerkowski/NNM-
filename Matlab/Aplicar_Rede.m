function [Saida] = Aplicar_Rede(Entrada,Vetor_Pesos)
    [Matriz_Pesos,Matriz_Pesos2] = Vetor_2_Matriz(Vetor_Pesos);
    clear Vetor_Pesos
    %[C,N]=[C,E+1]*[E+1,N]
    [Saida] = Multi_Matriz(Matriz_Pesos,Entrada,true);
    %[C,S]=[C,N+1]*[N+1,S]
    Saida = Multi_Matriz(Matriz_Pesos2,Saida,true);
end