function [] = Funcao_Rede_Geral
    %%%
    Salvando_Infos_Uso_Futuro;
    %Salvando2_Infos_Uso_Futuro;
    %%%

    %%%
    %Aplicando a rede pros Reais
    pesos = 'PESOS.mat';
    k = 1;
    save('k.mat','k')
    complex = 0;
    save('complex.mat','complex')
    Recepcao(pesos);
    if ~exist('PESOS.mat')
        return;
    end
    %Aplicando a rede pros Reais
    pesos = 'PESOS_j.mat';
    k = 1;
    save('k.mat','k')
    complex = 1;
    save('complex.mat','complex')
    Recepcao(pesos);
    
    %Etapa de Validação
    Validar;
    %Validar2;
    %%%
    
    %%%
    %Plotagens para verificação
    Plotagens;
    %%%
    
    %%%
    %Usando os Pesos para reconstruir os valores
    delete('Dados.mat','Saida.mat','complex.mat','k.mat');
    %%%
end