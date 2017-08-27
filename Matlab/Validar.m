function [] = Validar
<<<<<<< HEAD
    %%%
    Salvando_Infos_Uso_Futuro('Dados/data_LDMOS.mat','in_validation','out_validation');
    %%%

    complex = false;
    save('Dados/complex.mat','complex')
    load('Dados/PESOS.mat');
    load('Dados/Dados.mat','Dados_Entrada')
=======
    Data = load('data_LDMOS.mat','in_validation','out_validation');
    
    %%%
    %Ajuste dos Dados
    M = 2;
    Dados_Saida = Data.out_validation(1:end-M-1);
    Dados_Entrada = Ajuste(Data.in_validation);
    %%%
    
    %%%
    %Valores a serem usados
    Num_Neuronios = 8;
    Num_Saidas = size(Dados_Saida,2);
    Num_Entradas = size(Dados_Entrada,2);

    save('Dados.mat','Num_Entradas','Num_Saidas','Num_Neuronios','Dados_Entrada','Dados_Saida','-v6');
    clear
    %%%
    
    load('PESOS_j.mat');
    load('PESOS.mat');
    load('Dados.mat','Dados_Entrada')
    l = 0;
    save('l.mat','l');
>>>>>>> parent of 0dae647... Merge branch 'backf_adicionada'
    Saida_r = Aplicar_Rede(Dados_Entrada,Pesos);
    Erro_r = Calculo_MSE(Saida_r);
    save('Dados/Saida','Saida_r');
    clear Saida_r
<<<<<<< HEAD

    complex = true;
    save('Dados/complex.mat','complex')
    load('Dados/PESOS_j.mat');
    Saida_j = Aplicar_Rede(Dados_Entrada,Pesos);
=======
    
    l = 1;
    save('l.mat','l');
    Saida_j = Aplicar_Rede(Dados_Entrada,Pesos_j);
>>>>>>> parent of 0dae647... Merge branch 'backf_adicionada'
    Erro_j = Calculo_MSE(Saida_j);
    save('Dados/Saida','Saida_j','-append');
    disp(['Erro: ',num2str(sum(Erro_r)),10,'Erro_j: ',num2str(sum(Erro_j))])
end