function [] = Validar
    load('data_LDMOS.mat','in_validation','out_validation');
    M=2;
    Num_Neuronios=8;
    %%%
    %Ajuste dos Dados
    Dados_Saida = in_validation(M+1:end).*exp(-1i*wrapTo2Pi(angle(out_validation(M+1:end))));
    %ajustar os dados de saida
    Dados_Entrada = Ajuste(out_validation,M);
    %%%
    
    %%%
    %Valores a serem usados
    Num_Saidas = size(Dados_Saida,2);
    Num_Entradas = size(Dados_Entrada,2);

    save('Dados.mat','Num_Entradas','Num_Saidas','Num_Neuronios','Dados_Entrada','Dados_Saida','M','-v6');
    clear
    %%%
    M=2;
    load('Entradas_Estimadas.mat');    
    Dados_Entrada = Ajuste(Entradas_Estimadas,M);
    
    load('PESOS.mat');
    Saida_r = Aplicar_Rede(Dados_Entrada,Pesos);
    
    load('PESOS_j.mat');   
    Saida_j = Aplicar_Rede(Dados_Entrada,Pesos);
    
    load('data_LDMOS.mat','in_validation');
    Saida_complexa = (Saida_r+1i*Saida_j);
    save('Saida.mat','Saida_complexa');
    
    complex = false;
    save('complex.mat','complex')
    Erro_r = Calculo_MSE(real(Saida_complexa));
    
    complex = true;
    save('complex.mat','complex')
    Erro_j = Calculo_MSE(imag(Saida_complexa));
    
    disp(['Erro: ',num2str(sum(abs(Erro_r)),'%e'),10,'Erro_j: ',num2str(sum(abs(Erro_j)),'%e')])
end

