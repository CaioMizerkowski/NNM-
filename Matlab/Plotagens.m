function[] = Plotagens
    load('Dados.mat','Dados_Saida');
    load('Saida');
    Saida_c = Saida_r.*exp(1i*Saida_j);
    
    Real_Out = abs(Dados_Saida);
    Imag_Out = imag(Dados_Saida);
    figure(1)
        hold on
        plot(Saida_r(1:500),'k+')
        plot(Real_Out(1:500),'ro')
        hold off
end