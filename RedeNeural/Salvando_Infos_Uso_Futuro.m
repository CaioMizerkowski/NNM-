function [] = Salvando_Infos_Uso_Futuro
    Data = load('data_LDMOS.mat','in_extraction','out_extraction');
    M = 2;
    Dados_Saida = Data.in_extraction(M+1:end).*exp(-1i*wrapTo2Pi...
        (angle(Data.out_extraction(M+1:end))));
    %ajustar os dados de saida
    Dados_Entrada = Ajuste(Data.out_extraction,M);
    %%%
    
    %%%
    %Valores a serem usados
    Num_Neuronios = 8;
    Num_Saidas = size(Dados_Saida,2);
    Num_Entradas = size(Dados_Entrada,2);
    save('Dados.mat','Num_Entradas','Num_Saidas','Num_Neuronios',...
    'Dados_Entrada','Dados_Saida','-v6','M');
end