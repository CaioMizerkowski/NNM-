function [] = Recepcao(pesos_str)
    %%%
    %Fun��o que recebe os dados para ser realizado o treinamento da parte
    %real e da parte imaginaria da fun��o. Recebe uma string que define os
    %pesos e bias a serem usados e carrega um valor internamente para
    %definir se os dados a serem usados para o treinamento s�o reais ou
    %imaginarios.
    %Tamb�m chega se os pessos funciona e se a fun��o de treinamento n�o da
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