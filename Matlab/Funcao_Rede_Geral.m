function [] = Funcao_Rede_Geral
    Data = load('data_LDMOS.mat','in_extraction','out_extraction');
    
    %%%
    %Ajuste dos Dados
    M = 2;
    Dados_Saida = Data.out_extraction(1:end-M-1);
    Dados_Entrada = Ajuste(Data.in_extraction);
    %%%
    
    %%%
    %Valores a serem usados
    Num_Neuronios = 8;
    Num_Saidas = size(Dados_Saida,2);
    Num_Entradas = size(Dados_Entrada,2);

    save('Dados.mat','Num_Entradas','Num_Saidas','Num_Neuronios',...
        'Dados_Entrada','Dados_Saida','-v6');
    clear
    %%%
    
    %%%
    %Aplicando a rede pros Reais
    num = 1e5;
    l = 0;
    save('l.mat','l');
%     k = 1;
%     save('k.mat','k');
    try
        Pesos0 = load('PESOS.mat');
        Pesos0 = Pesos0.Pesos;
%         if size(Pesos0) == [N(S+E+1)+S,1]
%         else
%             [Pesos0] = Criar_Pesos_Random;
%         end
    catch
        [Pesos0] = Criar_Pesos_Random;
    end
    
    options = optimoptions(@lsqnonlin,'Algorithm','levenberg-marquardt',...
        'MaxIterations',num,'MaxFunctionEvaluations',num);
    Pesos = lsqnonlin(@Treinamento,Pesos0,[],[],options);
    save('PESOS.mat','Pesos');
    clear;
    %%%
    
    %%%
    %Aplicando a rede pros Imaginarios
    num = 1e5;
    l = 1;
    save('l.mat','l');
%     k = 1;
%     save('k.mat','k');    
    try
        Pesos0 = load('PESOS_j.mat');
        Pesos0 = Pesos0.Pesos_j;
    catch
        [Pesos0] = Criar_Pesos_Random;
    end
    options = optimoptions(@lsqnonlin,'Algorithm','levenberg-marquardt',...
        'MaxIterations',num,'MaxFunctionEvaluations',num);
    Pesos_j = lsqnonlin(@Treinamento,Pesos0,[],[],options);
    save('PESOS_j.mat','Pesos_j');
    clear;
    %%%
    
    %%%
    %Etapa de Validação
    Validar;
    %%%
    
    %%%
    %Plotagens para verificação
    Plotagens;
    %%%
    
    %%%
    %Usando os Pesos para reconstruir os valores
    %%%
    delete('Dados.mat','l.mat','Saida.mat');
    
end