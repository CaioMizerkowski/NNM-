function [] = Salvando_Infos_Uso_Futuro(arquivo,entrada,saida,M)
    Data = load(arquivo,entrada,saida); %#ok<NASGU>
    Dados_Entrada = Ajuste(eval(strcat('Data.',entrada)),M)';
    Dados_Saida = eval(strcat('Data.',saida,'(2:end-M)'))';
%     Dados_Entrada = (eval(strcat('Data.',entrada)))';
%     Dados_Saida = eval(strcat('Data.',saida))';
    %%%
    
    %%%
    %Valores a serem usados
    Num_Neuronios = 8;
    Num_Saidas = size(Dados_Saida,2);
    Num_Entradas = size(Dados_Entrada,2);
%     Rede_Tipo = [Num_Entradas, Num_Neuronios, Num_Saidas];
    save('Dados/Dados.mat','Num_Entradas','Num_Saidas','Num_Neuronios',...
    'Dados_Entrada','Dados_Saida','-v6');
end