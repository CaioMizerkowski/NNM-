function [] = Validar(val_or_ext)
    in=['in_',val_or_ext];
    out=['out_',val_or_ext];
    load('data_LDMOS.mat',in,out);
    
    eval(['in=in_',val_or_ext,';']);
    eval(['out=out_',val_or_ext,';']);
    global M
    %%%
    %Ajuste dos Dados
    Dados_Saida = in(M+1:end).*exp(-1i*wrapTo2Pi(angle(out(M+1:end)))); %#ok<COLND,NASGU>
    %ajustar os dados de saida
    Dados_Entrada = Ajuste(out,M); %#ok<NASGU>
    %%%

    save('Dados.mat','Dados_Entrada','Dados_Saida','-v6');
    clear in out Dados_Entrada
    
    %%%
    %Aqui se realiza a cascata
    %Aplica as entradas estimadas na rede neural
    %rede neural que simula a pré-inversa
    load('Entradas_Estimadas.mat');    
    Dados_Entrada = Ajuste(Entradas_Estimadas,M);
    
    load('PESOS.mat');
    Saida_r = Aplicar_Rede(Dados_Entrada,Pesos);
    
    load('PESOS_j.mat');   
    Saida_j = Aplicar_Rede(Dados_Entrada,Pesos);
    
    Saida_complexa = (Saida_r+1i*Saida_j); %#ok<NASGU>
    save('Saida_complexa.mat','Saida_complexa');
    disp(['cascata'])
    NMSE(Saida_complexa,Dados_Saida);
end

