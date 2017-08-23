function [] = Salvando_Infos_Uso_Futuro
    Data = load('data_LDMOS.mat','in_extraction','out_extraction');
    M = 2;
    Dados_Saida = Data.in_extraction(1:end-M);
    Dados_Entrada = Ajuste(Data.out_extraction);
    %%%
    
    %%%
    %Valores a serem usados
    Num_Neuronios = 20;
    Num_Saidas = size(Dados_Saida,2);
    Num_Entradas = size(Dados_Entrada,2);
    Rede_Tipo = [Num_Entradas, Num_Neuronios, Num_Saidas];
    save('Dados.mat','Num_Entradas','Num_Saidas','Num_Neuronios','Dados_Entrada','Dados_Saida','-v6');
end

