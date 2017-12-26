function [] = Validar(val_or_trei)
    %%%
    %Recebe uma string e calcula o NMSE dos dados da validação e do
    %treinamento.
    
    Data = load('data_LDMOS.mat',...
        ['in_',val_or_trei],['out_',val_or_trei]);
    load('Dados.mat','M','Num_Neuronios');
    eval(['Data.in = Data.in_',val_or_trei,';','Data.out = Data.out_',val_or_trei,';']);
    
    %%%
    %Ajuste dos Dados
    Dados_Saida = Data.in(M+1:end)...
        .*exp(-1i*wrapTo2Pi(angle(Data.out(M+1:end))));
    %ajustar os dados de saida
    Dados_Entrada = Ajuste(Data.out,M);
    %%%
    
    %%%
    %Valores a serem usados
    Num_Saidas = size(Dados_Saida,2);
    Num_Entradas = size(Dados_Entrada,2);

    save('Dados.mat','Num_Entradas','Num_Saidas','Num_Neuronios',...
        'Dados_Entrada','Dados_Saida','M','-v6');
    clear
    %%%
    
    load('Dados.mat','Dados_Entrada','Dados_Saida')
    load('PESOS.mat');
    Saida_r = Aplicar_Rede(Dados_Entrada,Pesos);
    
    load('PESOS_j.mat');
    Saida_j = Aplicar_Rede(Dados_Entrada,Pesos);
    
    Saida_complexa = (Saida_r+1i*Saida_j);
    save('Saida.mat','Saida_complexa');
    
    NMSE(Dados_Saida,Saida_complexa);
end