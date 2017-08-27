function [] = Funcao_Rede_Geral
    close all
    Data = load('data.mat','x','y');
    
    %%%
    %Ajuste dos Dados
    Dados_Saida = Data.y;
    Dados_Entrada = Data.x;
    %%%
    
    %%%
    %Valores a serem usados
    Num_Neuronios = 100;
    Num_Saidas = size(Dados_Saida,2);
    Num_Entradas = size(Dados_Entrada,2);

    save('Dados.mat','Num_Entradas','Num_Saidas','Num_Neuronios',...
        'Dados_Entrada','Dados_Saida','-v6');
    clear
    %%%
    
    %%%
    %Aplicando a rede pros Reais
    l = 0;
    save('l.mat','l');
    k = 1;
    save('k.mat','k');
    try
        Pesos0 = load('PESOS.mat');
        Pesos0 = Pesos0.Pesos;
    catch
        [Pesos0] = Criar_Pesos_Random;
    end
    options = optimoptions(@lsqnonlin,'Algorithm','levenberg-marquardt',...
        'MaxIterations',1e4,'MaxFunctionEvaluations',1e4,...
        'StepTolerance',1e-1000,'FunctionTolerance',1e-1000);
    Pesos = lsqnonlin(@Treinamento,Pesos0,[],[],options);
    save('PESOS.mat','Pesos');
    clear;
    %%%
    
    %%%
    %Aplicando a rede pros Imaginarios
%     l = 1;
%     save('l.mat','l');
% %     k = 1;
% %     save('k.mat','k');
%     [Pesos0] = Criar_Pesos_Random;
%     options = optimoptions(@fminunc,'MaxIterations',1000,'MaxFunctionEvaluations',1000);
%     Pesos_j = fminunc(@Treinamento,Pesos0,options);
%     save('PESOS_j.mat','Pesos_j');
%     clear;
    %%%
    
    %%%
    %Etapa de Valida��o
    [Erro] = Validar;
    disp(['Erro: ',num2str(sum(Erro)),10,'Erro_j: ',num2str(0)])
    %%%
    
    %%%
    %Usando os Pesos para reconstruir os valores
    %%%
    
    %%%
    %Plotagens para conferir de forma grafica
    %%%
    
    delete('Dados.mat');
end