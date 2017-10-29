function[] = Plotagens
    close all
    var1=500;
    var2=0;
    passo1=1;
    global M;
    
    load('Dados.mat','Dados_Entrada','Dados_Saida');
    load('Entradas_Estimadas.mat');
    load('Saida_complexa.mat');
    load('data_LDMOS.mat','in_validation','out_validation');
    Fase = angle(in_validation(M+1:end)); %#ok<COLND>
    
for h=1
    figure('units','pixels','position',[0 0 1920 1080],'ToolBar','none','MenuBar','none')
        subplot(2,1,1)
        hold off
        real_out = real(Dados_Saida.*exp(1i*Fase));
        real_sai = real(Saida_complexa.*exp(1i*Fase));
        
        plot(real_out(1:end),'.-b');
        hold on
        plot(real_sai(1:end),'or');
        
        xlim([var2,var1]);
        ylim([-1,1]);
        legend('Original','Estimado')
        title('Parte Real dos Dados')
        ylabel('Parte Real')
        xlabel('Amostra')
        grid
%     figure(2)        
        subplot(2,1,2)    

        hold off
        imag_out = imag(Dados_Saida.*exp(1i*Fase));
        imag_sai = imag(Saida_complexa.*exp(1i*Fase));

        plot(imag_out(1:end),'.-b');
        hold on
        plot(imag_sai(1:end),'or');

        xlim([var2,var1]);
        legend('Original','Estimado')
        title('Parte Imaginaria dos Dados')
        ylabel('Parte Imaginaria')
        xlabel('Amostra')
        grid
%         print('Figura1_inv','-depsc');
end

%%Suprimido
for h=1
    figure('units','pixels','position',[0 0 1920 1080],'ToolBar','none','MenuBar','none')
    %Valores
        subplot(2,2,1)
        real_sai = real(Dados_Saida);
        abs_in = Dados_Entrada(:,1); %#ok<NODEF>
        real_out = real(Saida_complexa);
        plot(abs_in(1:passo1:end),real_out(1:passo1:end),'ok','MarkerFaceColor','k');
        hold on
        plot(abs_in(1:passo1:end),real_sai(1:passo1:end),'xr');
        
        legend('Estimado','Original','Location','northwest')
        title('Input pela Amplitude')
        ylabel('R_{s}')
        xlabel('A_{x}')
        grid

%     figure(4)
        subplot(2,2,2)
        imag_sai = imag(Dados_Saida);
        abs_in = Dados_Entrada(:,1);
        imag_out = imag(Saida_complexa);
        plot(abs_in(1:passo1:end),imag_out(1:passo1:end),'ok','MarkerFaceColor','k'); hold on
        plot(abs_in(1:passo1:end),imag_sai(1:passo1:end),'xr');

        legend('Estimado','Original','Location','northwest')
        title('')
        ylabel('I_{s}')
        xlabel('A_{x}')
        grid
        
%     figure(5)
        subplot(2,2,4)
        phas_sai = angle(Dados_Saida);
        abs_in = Dados_Entrada(:,1);
        phas_out = angle(Saida_complexa);
        plot(abs_in(1:passo1:end),phas_out(1:passo1:end),'ok','MarkerFaceColor','k');
        hold on
        plot(abs_in(1:passo1:end),phas_sai(1:passo1:end),'xr');
        
        legend('Estimado','Original')
        title('')
        ylabel('F_{s}')
        xlabel('A_{x}')
        grid
        
%     figure(6)
        subplot(2,2,3)
        abs_sai = abs(Dados_Saida);
        abs_in = Dados_Entrada(:,1);
        abs_out = abs(Saida_complexa);
        plot(abs_in(1:passo1:end),abs_out(1:passo1:end),'ok','MarkerFaceColor','k');
        hold on
        plot(abs_in(1:passo1:end),abs_sai(1:passo1:end),'xr');
        
        legend('Estimado','Original','Location','northwest')
        title('')
        ylabel('A_{s}')
        xlabel('A_{x}')
        grid
%         print('Figura2_inv','-depsc');
end

for h=1
    figure('units','pixels','position',[0 0 1920 1080],'ToolBar','none','MenuBar','none')
        subplot(2,2,1)
        estim_abs = abs(Entradas_Estimadas);
        origi_abs = abs(out_validation);
        plot(estim_abs(1:passo1:end),origi_abs(1:passo1:end),'.k');
        
        title('Valor da Amplitude')
        xlabel('Estimado')
        ylabel('Original')
        grid

        subplot(2,2,2)
        estim_real = real(Entradas_Estimadas);
        origi_real = real(out_validation);
        plot(estim_real(1:passo1:end),origi_real(1:passo1:end),'.k');
        
        title('Valor Real')
        xlabel('Estimado')
        ylabel('Original')
        grid
        
        subplot(2,2,3)
        estim_imag = imag(Entradas_Estimadas);
        origi_imag = imag(out_validation);
        plot(estim_imag(1:passo1:end),origi_imag(1:passo1:end),'.k');
        
        title('Valor Imaginario')
        xlabel('Estimado')
        ylabel('Original')
        grid
        
        subplot(2,2,4)
        dif_fase = angle(Dados_Saida) - angle(Saida_complexa);
        plot(abs_in(1:passo1:end),dif_fase(1:passo1:end),'.k');
        
        title('Diferença de Fase')
        xlabel('Amplitude de Entrada')
        ylabel('Diferença de Fase')
        grid
%         print('Figura2_inv','-depsc');
end


end