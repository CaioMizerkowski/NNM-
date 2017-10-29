function [] = Validar
    load('data_LDMOS.mat','in_validation','out_validation');
    global M
    %%%
    %Ajuste dos Dados
    Dados_Saida = in_validation(M+1:end).*exp(-1i*wrapTo2Pi(angle(out_validation(M+1:end)))); %#ok<COLND,NASGU>
    %ajustar os dados de saida
    Dados_Entrada = Ajuste(out_validation,M); %#ok<NASGU>
    %%%

    save('Dados.mat','Dados_Entrada','Dados_Saida','-v6');
    clear in_validation out_validation Dados_Saida Dados_Entrada
    
    %%%
    load('Entradas_Estimadas.mat');    
    Dados_Entrada = Ajuste(Entradas_Estimadas,M);
    
    load('PESOS.mat');
    Saida_r = Aplicar_Rede(Dados_Entrada,Pesos);
    
    load('PESOS_j.mat');   
    Saida_j = Aplicar_Rede(Dados_Entrada,Pesos);
    
    Saida_complexa = (Saida_r+1i*Saida_j); %#ok<NASGU>
    save('Saida_complexa.mat','Saida_complexa');
end

