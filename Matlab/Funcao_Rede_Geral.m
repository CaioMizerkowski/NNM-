function [] = Funcao_Rede_Geral
    Data = load('data_LDMOS.mat','in_extraction','out_extraction');
    
    %%%
    %Ajuste dos Dados
    M = 2;
    Dados_Saida = Data.in_extraction(1:end-M);
    Dados_Entrada = Ajuste(Data.out_extraction);
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
    pesos = 'PESOS.mat';
    Recepcao(pesos);
    %%%
    
    %%%
    %Aplicando a rede pros Imaginarios
    pesos = 'PESOS_j.mat';
    Recepcao(pesos);
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
    
    delete('Dados.mat','Saida.mat');
end