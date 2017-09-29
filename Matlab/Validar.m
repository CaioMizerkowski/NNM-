function [] = Validar
    %%%
    Salvando_Infos_Uso_Futuro('Dados/data.mat','xv','yv');
    %%%

    complex = 0;
    save('Dados/complex.mat','complex')
    load('Dados/PESOS.mat');
    load('Dados/Dados.mat','Dados_Entrada')

    Saida_r = Aplicar_Rede(Dados_Entrada,Pesos);
    Erro_r = Calculo_MSE(Saida_r);
    save('Dados/Saida','Saida_r');
    clear Saida_r
    disp(['Erro: ',num2str(sum(Erro_r))])
%     complex = 1;
%     save('Dados/complex.mat','complex')
%     load('Dados/PESOS_j.mat');
%     Saida_j = Aplicar_Rede(Dados_Entrada,Pesos);
%     Erro_j = Calculo_MSE(Saida_j);
%     save('Dados/Saida','Saida_j','-append');
%     
%     disp(['Erro: ',num2str(sum(Erro_r)),10,'Erro_j: ',num2str(sum(Erro_j))])
end