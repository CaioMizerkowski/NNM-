function[] = Plotagens
    load('Dados/Dados.mat','Dados_Saida');
    load('Dados/Saida.mat');
%     Saida_c = real(Saida_r + Saida_j);
    
    Real_Out = real(Dados_Saida);
    Imag_Out = imag(Dados_Saida);
    figure(1)
        hold on
        plot(Saida_r(1:500))
        plot(Real_Out(1:500),'ro')
        hold off
end