function [] = Recepcao
    %%%
    %Fun��o de ativa��o: 2./(1+exp(-2x))-1;
    %Aproxima��o de Tanh, mais r�pida de ser calculada;
    %%%
    try
        Pesos0 = load('PESOS.mat');
        Pesos0 = Pesos0.Pesos;
    catch
        [Pesos0] = Criar_Pesos_Random;
    end
    while condicao1 || condicao2 || condicao3
        %%%
        %Extrair os valores de entrada e sa�da interna na rede
        %E extrair o Erro
        Treinamento
        %%%
        
        %%%
        %Determinar os valores para ajustar na �ltima camada
        Ajuste_Camada
        %Aquele sigma grego
        %%%
        
        %%%
        %Ajustar o valor dos pesos, encontrar a nova saida
        %Na camada oculta
        Ajuste_Camada
        %O segundo sigma
        %%%
        
        %%%
        %Fun��es de parada
        %%%
    end
end