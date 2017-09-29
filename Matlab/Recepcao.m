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
    
        num = 1e1;
%     k = 1;
%     save('k.mat','k');

    options = optimoptions(@lsqnonlin,'Algorithm','levenberg-marquardt',...
        'MaxIterations',num,'MaxFunctionEvaluations',num);
    Pesos = lsqnonlin(@Treinamento,Pesos0,[],[],options);
    save(pesos_str,'Pesos');
    clear;
end