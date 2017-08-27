function [Erro] = Treinamento(Pesos)
    load('Dados.mat','Dados_Entrada');
    Saida = Aplicar_Rede(Dados_Entrada,Pesos);
    clear Dados_Entrada;
    Erro = Calculo_MSE(Saida);
    load('k.mat')
    disp([num2str(k)])
    k = k+1;
    save('k.mat','k')
end