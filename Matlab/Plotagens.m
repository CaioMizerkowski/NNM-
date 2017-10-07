function[] = Plotagens
    load('Dados.mat','Dados_Entrada','Dados_Saida');
    load('Saida');

    abs_ent = abs(Dados_Entrada(:,1));
    abs_out = real(Dados_Saida);
    abs_sai = real(Saida_r+1i*Saida_j);
    plot(abs_out,'.');
    hold on
    plot(abs_sai,'o');
    legend('Real','Rede')
end