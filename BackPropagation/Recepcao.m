function [] = Recepcao(pesos_str)
    %%%
    %Fun��o de ativa��o: 2./(1+exp(-2x))-1;
    %Aproxima��o de Tanh, mais r�pida de ser calculada;
    %%%
    try
        Pesos = load(pesos_str);
        Pesos = Pesos.Pesos;
    catch
        [Pesos] = Criar_Pesos_Random;
    end
    
    Ciclos = 1;
    Erro_Novo = 0;
    Dif_Erro = 10;
    while (Ciclos<=1e3) || (Dif_Erro>=0.05) || condicao3
        %%%
        %Extrair os valores de entrada e sa�da interna na rede
        %E extrair o Erro
        Erro = Treinamento;
        %%%
        
        %%%
        %Determinar os valores para ajustar na �ltima camada
        Ajuste_Camada(Pesos,Y1,Y2,I1);
        %Aquele sigma grego
        %%%
        
        %%%
        %Fun��es de parada
        Dif_Erro = abs(Erro-Erro_Novo);
        Erro_Novo = Erro;
        Ciclos = Ciclos + 1;
        %%%
    end
end