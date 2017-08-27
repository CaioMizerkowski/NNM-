function [] = Recepcao(pesos_str)
    %%%
    %Fun��o de ativa��o: 2./(1+exp(-2x))-1;
    %Diff ~~ 1 - (2./(1+exp(-2x))-1)^2
    %Aproxima��o de Tanh, mais r�pida de ser calculada;
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
% % %         %Extrair os valores de entrada e sa�da interna na rede
% % %         %E extrair o Erro
% % %         Erro = Treinamento(Pesos);
% % %         %%%
% % %         
% % %         %%%
% % %         %Determinar os valores para ajustar na �ltima camada
% % %         %Ajuste_Camada(Pesos);
% % %         %Aquele sigma grego
% % %         %%%
% % %         
% % %         %%%
% % %         %Fun��es de parada
% % %         Dif_Erro = abs(Erro-Erro_Novo);
% % %         Erro_Novo = Erro;
% % %         Ciclos = Ciclos + 1;
% % %         %%%
% % %     end
end