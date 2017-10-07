function [] = Salvando2_Infos_Uso_Futuro
    Data = load('data_LDMOS.mat','in_extraction','out_extraction');
    M = 2;
    Dados_Saida = Data.out_extraction;
    Dados_Entrada = [real(Data.in_extraction),imag(Data.in_extraction),abs(Data.in_extraction),angle(Data.in_extraction)];
    %%%
    
    %%%
    %Valores a serem usados
    Num_Neuronios = 10;
    Num_Saidas = size(Dados_Saida,2);
    Num_Entradas = size(Dados_Entrada,2);
    save('Dados.mat','Num_Entradas','Num_Saidas','Num_Neuronios',...
    'Dados_Entrada','Dados_Saida','-v6','M');
end