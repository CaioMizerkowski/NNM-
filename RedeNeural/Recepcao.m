function [] = Recepcao(pesos_str)
    %%%
    %Função que recebe os dados para ser realizado o treinamento da parte
    %real e da parte imaginaria da função. Recebe uma string que define os
    %pesos e bias a serem usados e carrega um valor internamente para
    %definir se os dados a serem usados para o treinamento são reais ou
    %imaginarios.
    %Também chega se os pessos funciona e se a função de treinamento não da
    %nenhum erro.
    
    %%%
    try
        Pesos = load(pesos_str);
        Pesos0 = Pesos.Pesos;
    catch
        [Pesos0] = Criar_Pesos_Random;
    end
    
        num = 1e4;
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