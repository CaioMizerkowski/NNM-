function [Erro_r] = Validar
    Data = load('data.mat','xv','yv');
    
    %%%
    %Ajuste dos Dados
    Dados_Saida = Data.yv';
    Dados_Entrada = Data.xv';
    %%%
    
    %%%
    %Valores a serem usados
    Num_Neuronios = 20;
    Num_Saidas = size(Dados_Saida,2);
    Num_Entradas = size(Dados_Entrada,2);

    save('Dados.mat','Num_Entradas','Num_Saidas','Num_Neuronios','Dados_Entrada','Dados_Saida','-v6');
    %%%
   
%     load('PESOS_j.mat');
    load('PESOS.mat');
    load('Dados.mat','Dados_Entrada')
    l = 0;
    save('l.mat','l');
    Saida = Aplicar_Rede(Dados_Entrada,Pesos);
    Erro_r = Calculo_MSE(Saida);
    hold on
    plot(Dados_Entrada,Saida)
    plot(Dados_Entrada,Dados_Saida)
    pause
    clear Saida
    
%     l = 1;
%     save('l.mat','l');
%     Saida = Aplicar_Rede(Dados_Entrada,Pesos_j);
%     Erro_j = Calculo_MSE(Saida);
end