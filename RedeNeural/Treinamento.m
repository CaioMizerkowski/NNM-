function [Erro] = Treinamento(Pesos)
    load('Dados.mat','Dados_Entrada');
    Saida = Aplicar_Rede(Dados_Entrada,Pesos);
    clear Dados_Entrada;
    Erro = Calculo_MSE(Saida);
    %GRAVACAO;
end