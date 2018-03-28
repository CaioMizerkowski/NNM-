function [] = Salvando_Infos_Uso_Futuro
    %%%
    %Carrega os dados originarios do PA-LDMOS, troca a entrada pela saída e
    %faz o ajuste necessario para o funcionamento da rede neural com um
    %conjunto de dados complexo, incluindo alteração na fase da saída da
    %rede neural!
    %Corresponde a inversa do PA, neste caso, da PoD, ou seja, Pós-Inversa!
    %Também salva constantes a serem usadas durante o resto do projeto,
    %como o valor M e o número de neuronios e os salva num arquivo .mat.

    Data = load('data_LDMOS.mat','in_extraction','out_extraction');
    M = 2;
    Dados_Saida = Data.in_extraction(M+1:end).*exp(-1i*wrapTo2Pi...
        (angle(Data.out_extraction(M+1:end))));
    %ajustar os dados de saida
    Dados_Entrada = Ajuste(Data.out_extraction,M);
    %%%
    
    %%%
    %Valores a serem usados
    global Num_Neuronios;
    Num_Saidas = size(Dados_Saida,2);
    Num_Entradas = size(Dados_Entrada,2);
    save('Dados.mat','Num_Entradas','Num_Saidas','Num_Neuronios',...
    'Dados_Entrada','Dados_Saida','-v6','M');
end