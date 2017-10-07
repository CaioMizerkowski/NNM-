function[] = Plotagens
    load('Dados.mat','Dados_Entrada','Dados_Saida');
    load('Saida');

    abs_ent = abs(Dados_Entrada(:,1));
    abs_out = abs(Dados_Saida);
    abs_sai = abs(Saida_r+1i*Saida_j);
    plot(abs_out(1:200),'.');
    hold on
    plot(abs_sai(1:200),'o');
    legend('Real','Rede')
end