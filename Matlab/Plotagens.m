function[] = Plotagens
    close
    var1=500;
    var2=0;
    
    load('Dados.mat','Dados_Entrada','Dados_Saida');
    load('Saida');
    
    figure(1)
        real_out = real(Dados_Saida);
        real_sai = real(Saida_complexa);
        
        plot(real_out(end-var1-var2:end-var2),'.-b');
        hold on
        plot(real_sai(end-var1-var2:end-var2),'or');
        
        legend('Real','Rede')
        title('lsqnonlin')
        ylabel('Real')
        xlabel('Amostra')
        grid
    
    figure(2)
    
        imag_out = imag(Dados_Saida);
        imag_sai = imag(Saida_complexa);

        plot(imag_out(end-var1-var2:end-var2),'.-b');
        hold on
        plot(imag_sai(end-var1-var2:end-var2),'or');

        legend('Imaginario','Rede')
        title('lsqnonlin')
        ylabel('Imaginario')
        xlabel('Amostra')
        grid
end