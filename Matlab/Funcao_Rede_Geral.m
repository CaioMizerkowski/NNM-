function [] = Funcao_Rede_Geral
    %%%
    Salvando_Infos_Uso_Futuro;
    %Salvando_Infos_Uso_Futuro2;
    %%%

    %%%
    %Aplicando a rede pros Reais
    pesos = 'PESOS.mat';
    k = 1;
    save('k.mat','k')
    complex = 0;
    save('complex.mat','complex')
    Recepcao(pesos);
    
    %Aplicando a rede pros Reais
    pesos = 'PESOS_j.mat';
    k = 1;
    save('k.mat','k')
    complex = 1;
    save('complex.mat','complex')
    Recepcao(pesos);
    
    %Etapa de Jun��o dos Dados
    
    
    %Etapa de Valida��o
    Validar;
    %Validar2;
    %%%
    
    %%%
    %Plotagens para verifica��o
    Plotagens;
    %%%
    
    %%%
    %Usando os Pesos para reconstruir os valores
    delete('Dados.mat','Saida.mat','complex.mat','k.mat');
    %%%
end