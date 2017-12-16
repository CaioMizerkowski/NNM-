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
%     k = 1;
%     save('k.mat','k');
try
    options = optimoptions(@lsqnonlin,'Algorithm','levenberg-marquardt'...
        ,'MaxIterations',num,'MaxFunctionEvaluations',num,...
        'StepTolerance',1e-12,'FunctionTolerance',1e-12);
    Pesos = lsqnonlin(@Treinamento,Pesos0,[],[],options);
    save(pesos_str,'Pesos');
    clear;
catch
    delete('PESOS.mat','PESOS_j.mat');
    return;
end
end