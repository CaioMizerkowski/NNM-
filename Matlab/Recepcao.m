function [] = Recepcao(pesos_str)
    %%%
    %Fun��o de ativa��o: 2./(1+exp(-2x))-1;
    %Diff ~~ 1 - (2./(1+exp(-2x))-1)^2
    %Aproxima��o de Tanh, mais r�pida de ser calculada;
    %%%
    try
        load(pesos_str);
    catch
        Pesos = Criar_Pesos_Random;
        save(pesos_str,'Pesos');
    end
    
    Ciclos = 1;
    Ciclo_Max = 100;
    Erro_Novo = 0;
    Dif_Erro = 1;
    Erro_Min = 0.01;

    while (Ciclos<=Ciclo_Max) || (Dif_Erro>=Erro_Min)
        %%%
        %Extrair os valores de entrada e sa�da interna na rede
        %E extrair o Erro
        Erro = Treinamento(Pesos);
        %%%
        
        %%%
        %Determinar os valores para ajustar na �ltima camada
        Pesos = Ajuste_Camada(Pesos);
        %Aquele sigma grego
        %%%
        
        %%%
        %Fun��es de parada
        Dif_Erro = abs(Erro-Erro_Novo);
        Erro_Novo = Erro;
        Ciclos = Ciclos + 1;
        %%%
    end
    save(pesos_str,'Pesos')
end