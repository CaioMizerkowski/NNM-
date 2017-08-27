function [] = Funcao_Rede_Geral
    %%%
    Salvando_Infos_Uso_Futuro('Dados/data_LDMOS.mat','in_extraction','out_extraction');
    %%%

    %%%
    %Aplicando a rede pros Reais
    pesos = 'Dados/PESOS.mat';
    complex = 0;
    save('Dados/complex.mat','complex')
    Recepcao(pesos);
    %%%
    
    %%%
    %Aplicando a rede pros Imaginarios
    pesos = 'Dados/PESOS_j.mat';
    complex = 1;
    save('Dados/complex.mat','complex')
    Recepcao(pesos);
    %%%
    
    %%%
    %Etapa de Validação
    Validar;
    %%%
    
    %%%
    %Plotagens para verificação
    Plotagens;
    %%%
    
    %%%
    %Usando os Pesos para reconstruir os valores
    %%%   
    delete('Dados/Dados.mat','Dados/Saida.mat','Dados/complex.mat','Dados/Camada_Final.mat','Dados/Camada_Hidden1.mat');
end