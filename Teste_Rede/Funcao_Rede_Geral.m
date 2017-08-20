function [] = Funcao_Rede_Geral
    Data = load('dados.mat','in_extraction','out_extraction');
    
    %%%
    %Ajuste dos Dados
    Dados_Saida = Data.out_extraction;
    Dados_Entrada = Data.in_extraction;
    %%%
    
    %%%
    %Valores a serem usados
    Num_Neuronios = 20;
    Num_Saidas = size(Dados_Saida,2);
    Num_Entradas = size(Dados_Entrada,2);

    save('Dados.mat','Num_Entradas','Num_Saidas','Num_Neuronios','Dados_Entrada','Dados_Saida','-v6');
    clear
    %%%
    
    %%%
    %Aplicando a rede pros Reais
    l = 0;
    save('l.mat','l');
%     k = 1;
%     save('k.mat','k');
    [Pesos0] = Criar_Pesos_Random;
    options = optimoptions(@fminunc,'MaxIterations',1e7,'MaxFunctionEvaluations',1e7);
    Pesos = fminunc(@Treinamento,Pesos0,options);
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
    %Etapa de Validação
    [Erro] = Validar;
    disp(['Erro: ',num2str(Erro),10,'Erro_j: ',num2str(0)])
    %%%
    
    %%%
    %Usando os Pesos para reconstruir os valores
    %%%
    
    %%%
    %Plotagens para conferir de forma grafica
    %%%
    
    delete('Dados.mat','l.mat');
end