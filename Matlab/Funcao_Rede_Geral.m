function [] = Funcao_Rede_Geral
    %%%
    %Ajuste dos Dados
    Salvando_Infos_Uso_Futuro;
    %%%

    %%%
    %Aplicando a rede pros Reais
    pesos = 'PESOS.mat';
    complex = 0;
    save('complex.mat','complex')
    Recepcao(pesos);
    %%%
    
    %%%
    %Aplicando a rede pros Imaginarios
    pesos = 'PESOS_j.mat';
    complex = 1;
    save('complex.mat','complex')
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
    
    delete('Dados.mat','Saida.mat');
end