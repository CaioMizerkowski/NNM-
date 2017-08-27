function [] = Validar
    Data = load('data.mat','xv','yv');

    %%%
    %Ajuste dos Dados
    M = 2;
    Dados_Saida = Data.yv;
    Dados_Entrada = Data.xv;
    %%%

    %%%
    %Valores a serem usados
    Num_Neuronios = 8;
    Num_Saidas = size(Dados_Saida,2);
    Num_Entradas = size(Dados_Entrada,2);

    save('Dados.mat','Num_Entradas','Num_Saidas','Num_Neuronios','Dados_Entrada','Dados_Saida','-v6');
    clear
    %%%

    complex = 0;
    save('complex.mat','complex')
    load('PESOS.mat');
    load('Dados.mat','Dados_Entrada')
    Saida_r = Aplicar_Rede(Dados_Entrada,Pesos);
    Erro_r = Calculo_MSE(Saida_r);
    save('Saida','Saida_r');
    clear Saida_r

%     complex = 1;
%     save('complex.mat','complex')
%     load('PESOS_j.mat');
%     Saida_j = Aplicar_Rede(Dados_Entrada,Pesos);
%     Erro_j = Calculo_MSE(Saida_j);
%     save('Saida','Saida_j','-append');
%     disp(['Erro: ',num2str(sum(Erro_r)),10,'Erro_j: ',num2str(sum(Erro_j))])
end