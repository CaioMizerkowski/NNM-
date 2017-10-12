function [] = Validar
    Dados_Validation = load('data_LDMOS.mat','in_validation','out_validation');
    load('Dados.mat','M','Num_Neuronios');
    
    %%%
    %Ajuste dos Dados
    Dados_Saida = Dados_Validation.in_validation(M+1:end).*exp(-1i*wrapTo2Pi(angle(Dados_Validation.out_validation(M+1:end))));
    %ajustar os dados de saida
    Dados_Entrada = Ajuste(Dados_Validation.out_validation,M);
    %%%
    
    %%%
    %Valores a serem usados
    Num_Saidas = size(Dados_Saida,2);
    Num_Entradas = size(Dados_Entrada,2);

    save('Dados.mat','Num_Entradas','Num_Saidas','Num_Neuronios','Dados_Entrada','Dados_Saida','M','-v6');
    clear
    %%%
    
    load('Dados.mat','Dados_Entrada')
    load('Dados.mat','M')
    complex = false;
    save('complex.mat','complex')
    load('PESOS.mat');
    Saida_r = Aplicar_Rede(Dados_Entrada,Pesos);
    
    complex = true;
    save('complex.mat','complex')
    load('PESOS_j.mat');   
    Saida_j = Aplicar_Rede(Dados_Entrada,Pesos);
    
    load('data_LDMOS.mat','in_validation');
    Fase = angle(in_validation(M+1:end));
    Saida_complexa = (Saida_r+1i*Saida_j);%.*exp(1i*Fase);
    save('Saida.mat','Saida_complexa');
    
    complex = false;
    save('complex.mat','complex')
    Erro_r = Calculo_MSE(real(Saida_complexa));
    
    complex = true;
    save('complex.mat','complex')
    Erro_j = Calculo_MSE(imag(Saida_complexa));
    
    disp(['Erro: ',num2str(sum(abs(Erro_r)),'%e'),10,'Erro_j: ',num2str(sum(abs(Erro_j)),'%e')])
end