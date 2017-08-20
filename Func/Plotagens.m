function[] = Plotagens
    load('Dados.mat','Dados_Saida');
    load('Saida');
    Saida_c = Saida_r + 1i*Saida_j;
    
    Real_Out = real(Dados_Saida);
    Imag_Out = imag(Dados_Saida);
    figure(1)
        plot(Saida_r,Real_Out,'k.')
    figure(2)
        plot(Saida_j,Imag_Out,'k.')
        
        Aout = abs(Dados_Saida);
        Ard = abs(Saida_c);
        Phout = angle(Dados_Saida);
        Phrd = angle(Saida_c);
    figure(3)
        plot(Aout,Ard,'k.')
        xlabel('Abs Out')
        ylabel('Abs Rede')
    figure(4)
        plot(Phout,Phrd,'r.')
        xlabel('Phase Out')
        ylabel('Phase Rede')
end

