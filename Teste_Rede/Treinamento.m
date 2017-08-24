function [Erro] = Treinamento(Pesos)
    load('Dados.mat','Dados_Entrada');
    load('k.mat','k');
    Saida = Aplicar_Rede(Dados_Entrada,Pesos);
    clear Dados_Entrada;
    Erro = Calculo_MSE(Saida);
    %%%
    disp(['Erro: ',num2str(Erro),' Loop: ',num2str(k)])
    k=k+1;
    save('k.mat','k');
end