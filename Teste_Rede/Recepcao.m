function [] = Recepcao(pesos_str)
    %%%
    %Função de ativação: 2./(1+exp(-2x))-1;
    %Diff ~~ 1 - (2./(1+exp(-2x))-1)^2
    %Aproximação de Tanh, mais rápida de ser calculada;
    %%%
    try
        Pesos = load(pesos_str);
        Pesos0 = Pesos.Pesos;
    catch
        [Pesos0] = Criar_Pesos_Random;
    end
    
        num = 1e4;
    k = 1;
    save('k.mat','k');

    options = optimoptions(@lsqnonlin,'Algorithm','levenberg-marquardt',...
        'MaxIterations',num,'MaxFunctionEvaluations',num);
    Pesos = lsqnonlin(@Treinamento,Pesos0,[],[],options);
    save(pesos_str,'Pesos');
    clear;
    
% % %     Ciclos = 1;
% % %     Ciclo_Max = 10;
% % %     Erro_Novo = 0;
% % %     Dif_Erro = 1;
% % %     Erro_Min = 0.01;
% % % 
% % %     while (Ciclos<=Ciclo_Max) || (Dif_Erro>=Erro_Min)
% % %         %%%
% % %         %Extrair os valores de entrada e saída interna na rede
% % %         %E extrair o Erro
% % %         Erro = Treinamento(Pesos);
% % %         %%%
% % %         
% % %         %%%
% % %         %Determinar os valores para ajustar na última camada
% % %         %Ajuste_Camada(Pesos);
% % %         %Aquele sigma grego
% % %         %%%
% % %         
% % %         %%%
% % %         %Funções de parada
% % %         Dif_Erro = abs(Erro-Erro_Novo);
% % %         Erro_Novo = Erro;
% % %         Ciclos = Ciclos + 1;
% % %         %%%
% % %     end
end