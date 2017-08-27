function[] = Plotagens
    load('Dados.mat','Dados_Saida');
    load('Saida');
    figure(1)
        hold on
        plot(Saida_r,'k.')
        plot(Dados_Saida,'ro')
        hold off
end