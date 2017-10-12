function[] = Plotagens
    close all
    var1=1500;
    var2=1000;
    
    load('Dados.mat','Dados_Entrada','Dados_Saida','M');
    load('Saida');
    load('data_LDMOS.mat','in_validation');
    Fase = angle(in_validation(M+1:end));

    figure(1)
        real_out = real(Dados_Saida.*exp(1i*Fase));
        real_sai = real(Saida_complexa.*exp(1i*Fase));
        
        plot(real_out(end-var1-var2:end-var2),'.-b');
        hold on
        plot(real_sai(end-var1-var2:end-var2),'or');
        
        legend('Real','Rede')
        title('Parte Real dos Dados')
        ylabel('Real')
        xlabel('Amostra')
        grid
    
    figure(2)
        imag_out = imag(Dados_Saida.*exp(1i*Fase));
        imag_sai = imag(Saida_complexa.*exp(1i*Fase));

        plot(imag_out(end-var1-var2:end-var2),'.-b');
        hold on
        plot(imag_sai(end-var1-var2:end-var2),'or');

        legend('Imaginario','Rede')
        title('Parte Imaginaria dos Dados')
        ylabel('Imaginario')
        xlabel('Amostra')
        grid
        
    figure(3)
        abs_sai = real(Saida_complexa);
        abs_in = Dados_Entrada(:,1);
        abs_out = real(Saida_complexa);
        plot(abs_in(1:end),abs_sai(1:end),'*k');
        hold on
        plot(abs_in(1:end),abs_out(1:end),'xr');

%         legend('Imaginario')
        title('')
        ylabel('Real_{s}')
        xlabel('A_{x}')
        grid
        
    figure(4)
        imag_sai = imag(Saida_complexa);
        abs_in = Dados_Entrada(:,1);
        imag_out = imag(Saida_complexa);
        plot(abs_in(1:end),imag_sai(1:end),'*k');
        hold on
        plot(abs_in(1:end),imag_out(1:end),'xr');

%         legend('Imaginario')
        title('')
        ylabel('Imag_{s}')
        xlabel('A_{x}')
        grid
        
    figure(5)
        imag_sai = angle(Saida_complexa);
        abs_in = Dados_Entrada(:,1);
        imag_out = angle(Saida_complexa);
        plot(abs_in(1:end),imag_sai(1:end),'*k');
        hold on
        plot(abs_in(1:end),imag_out(1:end),'xr');

%         legend('Imaginario')
        title('')
        ylabel('F_{s}')
        xlabel('A_{x}')
        grid
        
    figure(6)
        abs_sai = abs(Saida_complexa);
        abs_in = Dados_Entrada(:,1);
        abs_out = abs(Saida_complexa);
        plot(abs_in(1:end),abs_sai(1:end),'*k');
        hold on
        plot(abs_in(1:end),abs_out(1:end),'xr');

%         legend('Imaginario')
        title('')
        ylabel('A_{s}')
        xlabel('A_{x}')
        grid
end