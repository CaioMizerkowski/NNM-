function [] = Funcao_Rede_Geral
    %%%
    Salvando_Infos_Uso_Futuro;
    %%%

    %%%
    %Aplicando a rede pros Reais
    pesos = 'PESOS.mat';
    complex = 0;
    save('complex.mat','complex')
    Recepcao(pesos);
    Data = load('data_LDMOS.mat','in_extraction','out_extraction');
    
    %Aplicando a rede pros Reais
    pesos = 'PESOS_j.mat';
    complex = 1;
    save('complex.mat','complex')
    Recepcao(pesos);
    Data = load('data_LDMOS.mat','in_extraction','out_extraction');
    
    %Etapa de Validação
    Validar;
    %%%
    
    %%%
    %Plotagens para verificação
    Plotagens;
    %%%
    
    %%%
    %Usando os Pesos para reconstruir os valores
    delete('Dados.mat','Saida.mat','complex.mat');
    %%%
end