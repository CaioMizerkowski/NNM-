clear
close all
% if ~exist('contador','var')
%     contador = 0;
%     contador_no_Sin = 0;
%     contador_Sin = 0;
%     contador_rand = 0;
    x1 = (-5:0.1:5)'; x2 = x1;
    ativar_falso = @(pes,ent) floor(heaviside(pes(1) + pes(2)*ent(:,1).*ent(:,2)+pes(3)*ent(:,2)));
    ativar = @(pes,ent) floor(heaviside(pes(1) + pes(2)*ent(:,1)+pes(3)*ent(:,2)));
    l = 1500;
%     fail_no_sin = 0;
%     fail_sin = 0;
%     fail_rand = 0;
% end

% while contador<1e10
    w1 = (2*rand(1,3)-1)*10;%Criação
    w2 = rand(1,3);%Inicio
    in = 10*rand(l,2)-5;
    out = ativar_falso(w1,in);
    %out = ativar(w1,in);
    figure('units','pixels','position',[0 0 1920 1080],'ToolBar','none','MenuBar','none')
    %set(gca,'CLim',[0 1],'position',[0 0 1 1])
    ylim([-5,5]);
    xlim([-5,5]);
    
    hold
    in_ativo = in(out>0,:);
    plot(in_ativo(:,1),in_ativo(:,2),'ro')
    in_inativo = in(out<1,:);
    plot(in_inativo(:,1),in_inativo(:,2),'b+')
    axis manual
    Mo_Perc = getframe(gcf);
    %%%%
    %Com Seno
    w = w2;
    wP = w;
    soma = 1;
    k = 0;
    while(sum(abs(soma))~=0 && k<=100)
        k = k+1;
        ativa = ativar(w,in);soma = [ones(l,1),in]';
        
        disp([num2str(sum(abs(ativa-out))),' ',num2str(k)])
        plot(x2,-(w(1)+w(2)*x1)/w(3),'k-')

        lgd = legend({'Valores 0','Valores 1','Perceptron'},'FontSize',24);
        title(lgd,'Graficos','FontSize',24);
        title('\fontsize{30}Superficie Não-linearmente Separável')
        for x = 1:l
            if ativa(x) == out(x);soma(:,x) = 0;
            elseif ativa(x) < out(x);soma(:,x) = soma(:,x);
            elseif ativa(x) > out(x);soma(:,x) = -soma(:,x);
            end
        end
        soma = sum(soma,2)';
        w = w +0.75*soma;
        wP = [wP;w];
        Mo_Perc(end+1) = getframe(gcf);
    end
%     contador = contador + k;
%     contador_Sin = contador_Sin + k;
%     if k>=9999
%         fail_sin = fail_sin + 1;
%     end

    %%%%
    %Sem seno
% %     w = w2;
% %     soma = 1;
% %     k = 0;
% %     while(sum(abs(soma))~=0 && k<=10000)
% %         k = k+1;
% %         ativa = ativar(w,in);soma = [ones(l,1),in]';
% %         for x = 1:l
% %             if ativa(x) == out(x);soma(:,x) = 0;
% %             elseif ativa(x) < out(x);soma(:,x) = soma(:,x);
% %             elseif ativa(x) > out(x);soma(:,x) = -soma(:,x);
% %             end
% %         end
% %         soma = sum(soma,2)';
% %         w = w +0.5*soma;
% %     end
% %     contador = contador + k;
% %     contador_no_Sin = contador_no_Sin + k;
% %     if k>=9999
% %         fail_no_sin = fail_no_sin + 1;
% %     end
% % 
% %     %%%%
% %     %random
% %     w = w2;
% %     soma = 1;
% %     k = 0;
% %     while(sum(abs(soma))~=0 && k<=10000)
% %         k = k+1;
% %         ativa = ativar(w,in);soma = [ones(l,1),in]';
% %         for x = 1:l
% %             if ativa(x) == out(x);soma(:,x) = 0;
% %             elseif ativa(x) < out(x);soma(:,x) = soma(:,x);
% %             elseif ativa(x) > out(x);soma(:,x) = -soma(:,x);
% %             end
% %         end
% %         soma = sum(soma,2)';
% %         w = w +0.5*rand(1)*soma;
% %     end
% %     contador = contador + k;
% %     contador_rand = contador_rand + k;
% %     if k>=9999
% %         fail_rand = fail_rand + 1;
% %     end
% end


%%
% if contador<1e10
%     Untitled;
% else
% % % %     figure('units','pixels','position',[0 0 1920 1080],'ToolBar','none','MenuBar','none')
% % % %     %set(gca,'CLim',[0 1],'position',[0 0 1 1])
% % % %     grid
% % % %     hold on
% % % %     plot3(wP(:,1),wP(:,2),wP(:,3),'r.-')%Todos
% % % %     plot3(wP(1,1),wP(1,2),wP(1,3),'mo')%Inicial
% % % %     plot3(wP(end,1),wP(end,2),wP(end,3),'go')%Final
% % % %     plot3(w1(1),w1(2),w1(3),'bo')%Criação
% % % %     lgd = legend({'Trajetoria','Pesos Iniciais','Pesos Finais','Valores para Gerar'},'FontSize',24);
% % % %     title(lgd,'Graficos','FontSize',24);
% % % %     xlabel('Peso 1')
% % % %     ylabel('Peso 2')
% % % %     zlabel('Peso 3')
% % % %     
% % % %     view([-45 45])
% % % %     sum(abs(ativa-out))
    %Mo_Perc(end+1) = getframe(gcf);
% end
myVideo = VideoWriter('perceptronfail');
open(myVideo);
writeVideo(myVideo,Mo_Perc);
close(myVideo);

clear