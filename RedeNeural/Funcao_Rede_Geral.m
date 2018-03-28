function [] = Funcao_Rede_Geral(n)

    global Num_Neuronios;
    Num_Neuronios = n;
    disp([num2str(Num_Neuronios)]);
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
        Funcao_Rede_Geral(n);
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
    %Plotagens;
    %%%
    
    Salvamento();
    
    %%%
    %Usando os Pesos para reconstruir os valores
    delete('Dados.mat','Saida.mat','complex.mat','k.mat');
    %%%
end