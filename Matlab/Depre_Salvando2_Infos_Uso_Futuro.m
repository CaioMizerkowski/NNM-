function [] = Salvando2_Infos_Uso_Futuro
    Data = load('data_LDMOS.mat','in_extraction','out_extraction');
    M = 2;
    Dados_Saida = Data.in_extraction;
    Dados_Entrada = [real(Data.out_extraction),imag(Data.out_extraction),abs(Data.out_extraction),angle(Data.out_extraction)];
    %%%
    
    %%%
    %Valores a serem usados
    Num_Neuronios = 10;
    Num_Saidas = size(Dados_Saida,2);
    Num_Entradas = size(Dados_Entrada,2);
    save('Dados.mat','Num_Entradas','Num_Saidas','Num_Neuronios',...
    'Dados_Entrada','Dados_Saida','-v6','M');
end