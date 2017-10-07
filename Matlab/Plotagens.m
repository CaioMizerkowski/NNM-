function[] = Plotagens
    load('Dados.mat','Dados_Entrada','Dados_Saida');
    load('Saida');

    Abs_In = abs(Dados_Entrada(:,1));
    Re_Out = imag(Dados_Saida);
    plot(Abs_In,Re_Out,'.');
end