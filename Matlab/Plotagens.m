function[] = Plotagens
    load('Dados.mat','Dados_Saida');
    load('Saida');
    Saida_c = abs(Saida_r + Saida_j);
    
    Real_Out = abs(Dados_Saida);
    Imag_Out = imag(Dados_Saida);
    figure(1)
        hold on
        plot(Saida_c(1:500))
        plot(Real_Out(1:500),'ro')
        hold off
end