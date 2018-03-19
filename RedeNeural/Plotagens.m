function[] = Plotagens
    close all
    var1=500;
    var2=0;
    passo1=1;
    
    load('Dados.mat','Dados_Entrada','Dados_Saida','M');
    load('Saida');
    load('data_LDMOS.mat','in_validation');
    Fase = angle(in_validation(M+1:end));
for h=1    
%     figure('units','pixels','position',[0 0 1920 1080],'ToolBar','none','MenuBar','none')
%         subplot(2,1,1)
%         
%         real_out = real(Dados_Saida.*exp(1i*Fase));
%         real_sai = real(Saida_complexa.*exp(1i*Fase));
%         
%         plot(real_out(1:end),'.-b');
%         hold on
%         plot(real_sai(1:end),'or');
%         
%         xlim([var2,var1]);
%         ylim([-1,1]);
%         legend('Measured','Estimado')
%         title('Parte Real dos Dados')
%         ylabel('Parte Real')
%         xlabel('Amostra')
%         grid
% %     figure(2)        
%         subplot(2,1,2)    
% 
%         imag_out = imag(Dados_Saida.*exp(1i*Fase));
%         imag_sai = imag(Saida_complexa.*exp(1i*Fase));
% 
%         plot(imag_out(1:end),'.-b');
%         hold on
%         plot(imag_sai(1:end),'or');
% 
%         xlim([var2,var1]);
%         legend('Measured','Estimado')
%         title('Parte Imaginaria dos Dados')
%         ylabel('Parte Imaginaria')
%         xlabel('Amostra')
%         grid
%         %print('Figura1','-depsc');

%    figure('units','pixels','position',[0 0 1920 1080],'ToolBar','none','MenuBar','none')
%         subplot(2,2,1)
%         real_sai = real(Dados_Saida);
%         abs_in = Dados_Entrada(:,1);
%         real_out = real(Saida_complexa);
%         plot(abs_in(1:passo1:end),real_out(1:passo1:end),'ok','MarkerFaceColor', 'k');
%         hold on
%         plot(abs_in(1:passo1:end),real_sai(1:passo1:end),'xr');
%         
%         legend('Estimado','Measured','Location','northwest')
%         title('')
%         ylabel('R_{s}')
%         xlabel('A_{x}')
%         grid
%         
% %     figure(4)
%         subplot(2,2,2)
%         imag_sai = imag(Dados_Saida);
%         abs_in = Dados_Entrada(:,1);
%         imag_out = imag(Saida_complexa);
%         plot(abs_in(1:passo1:end),imag_out(1:passo1:end),'ok','MarkerFaceColor', 'k');
%         hold on
%         plot(abs_in(1:passo1:end),imag_sai(1:passo1:end),'xr');
% 
%         legend('Estimado','Measured')
%         title('')
%         ylabel('I_{s}')
%         xlabel('A_{x}')
%         grid
end        
%     figure(5)
    figure('units','pixels','position',[0 0 350 200],'ToolBar','none','MenuBar','none')
        %subplot(2,2,3)
        abs_sai = abs(Dados_Saida);
        abs_in = Dados_Entrada(:,1);
        abs_out = abs(Saida_complexa);
        plot(abs_in(1:passo1:end),abs_out(1:passo1:end),'ok','MarkerFaceColor', 'k');
        hold on
        plot(abs_in(1:passo1:end),abs_sai(1:passo1:end),'xr');
        
        legend('Estimated','Measured','Location','northwest')
        title('')
        ylabel('|Output| (V/V)')
        xlabel('|Input| (V/V)')
        grid
        print('amplitude_dpd','-depsc');
        
%     figure(6)
    figure('units','pixels','position',[0 0 350 200],'ToolBar','none','MenuBar','none')
        %subplot(2,2,4)
        phas_sai = angle(Dados_Saida);
        abs_in = Dados_Entrada(:,1);
        phas_out = angle(Saida_complexa);
        plot(abs_in(1:passo1:end),phas_out(1:passo1:end),'ok','MarkerFaceColor', 'k');
        hold on
        plot(abs_in(1:passo1:end),phas_sai(1:passo1:end),'xr');
        
        legend('Estimated','Measured')
        title('')
        ylabel('Phase difference (rad)')
        xlabel('|Input| (V/V)')
        grid
        print('phase_dpd','-depsc');
end