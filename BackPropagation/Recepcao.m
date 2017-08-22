function [] = Recepcao(pesos_str)
    %%%
    %Função de ativação: 2./(1+exp(-2x))-1;
    %Aproximação de Tanh, mais rápida de ser calculada;
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
        %Extrair os valores de entrada e saída interna na rede
        %E extrair o Erro
        Erro = Treinamento;
        %%%
        
        %%%
        %Determinar os valores para ajustar na última camada
        Ajuste_Camada(Pesos,Y1,Y2,I1);
        %Aquele sigma grego
        %%%
        
        %%%
        %Funções de parada
        Dif_Erro = abs(Erro-Erro_Novo);
        Erro_Novo = Erro;
        Ciclos = Ciclos + 1;
        %%%
    end
end