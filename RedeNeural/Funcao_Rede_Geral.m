function [] = Funcao_Rede_Geral
    %%%
    Salvando_Infos_Uso_Futuro;
    %%%

    %%%
    %Aplicando a rede pros Reais
    pesos = 'PESOS.mat';
    k = 1;
    save('k.mat','k')
    complex = 0;
    save('complex.mat','complex')
    Recepcao(pesos);
    %%%
    
    %%%
    %Verificando erros
    if ~exist('PESOS.mat')
        disp('Pesos invalidos!')
        Funcao_Rede_Geral;
        return;
    end
    %%%
    
    %%%
    %Aplicando a rede pros Reais
    pesos = 'PESOS_j.mat';
    k = 1;
    save('k.mat','k')
    complex = 1;
    save('complex.mat','complex')
    Recepcao(pesos);
    %%%
    
    %%%
    %Tirar NMSE do treinamento
    Validar('extraction');
    %
    
    %%%
    %Etapa de Validação
    Validar('validation');
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