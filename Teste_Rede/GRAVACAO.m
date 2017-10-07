load('k.mat','k')
k = k+1;
save('k.mat','k')
<<<<<<< HEAD
n = 2;
if mod(k,n) == 0
    close all
    figure('units','pixels','position',[0 0 1920 1080],'ToolBar','none','MenuBar','none')
    %set(gca,'CLim',[0 1],'position',[0 0 1 1])
    ylim([-1,1]);
    xlim([0,500]);
    
=======
if mod(k,10) == 0
    drawnow;
>>>>>>> parent of 0b46fd4... add
    load('Dados.mat','Dados_Saida');
    load('complex.mat','complex');
    Real_Out = real(Dados_Saida);
    Imag_Out = imag(Dados_Saida);
    if complex == 0
        figure(1)
            plot(Saida(1:100),'b-')
            hold on
            plot(Real_Out(1:100),'k.')
            hold off
<<<<<<< HEAD
            lgd = legend({'Rede Neural','Função Original'},'FontSize',24);
            title(lgd,'Graficos','FontSize',24);
            title('\fontsize{30}Parte Real');
            grid on
            if exist('video\Movie_r.mat','file')
                zeeros = int2str(zeros(1,5 - numel(num2str(k/n))));
                zeeros = zeeros(~isspace(zeeros));
                moviee = ['Movie_r',zeeros,int2str(k/n)];
                eval([moviee,' = getframe(gcf);']);
                save('video\Movie_r.mat',moviee,'-v6','-append');
            else
                Movie_r00001 = getframe(gcf);
                save('video\Movie_r.mat','Movie_r00001');
=======
            ylim([-1,1]);
            if exist('Movier.mat','file')
                load('Movier.mat','Movier');
                Movier(end+1) = getframe(gcf);
                save('Movier.mat','Movier','-v6')
            else
                Movier = struct('cdata',[],'colormap',[]);
                Movier(1) = getframe(gcf);
                save('Movier.mat','Movier','-v6')
>>>>>>> parent of 0b46fd4... add
            end
    else
        figure(2)
            plot(Saida(1:500),'b-')
            hold on
            plot(Imag_Out(1:500),'k.')
            hold off
<<<<<<< HEAD
            lgd = legend({'Rede Neural','Função Original'},'FontSize',24);
            title(lgd,'Graficos','FontSize',24);
            title('\fontsize{30}Parte Imaginaria')
            grid on;
            if exist('video\Movie_j.mat','file')
                zeeros = int2str(zeros(1,5 - numel(num2str(k/n))));
                zeeros = zeeros(~isspace(zeeros));
                moviee = ['Movie_j',zeeros,int2str(k/n)];
                eval([moviee,' = getframe(gcf);']);
                save('video\Movie_j.mat',moviee,'-v6','-append');
            else
                Movie_j00001 = getframe(gcf);
                save('video\Movie_j.mat','Movie_j00001');
=======
            ylim([-1,1])
            if exist('MovieI.mat','file')
                load('MovieI.mat','MovieI');
                MovierI(end+1) = getframe(gcf);
                save('MovieI.mat','MovieI','-v6')
            else
                MovieI = struct('cdata',[],'colormap',[]);
                MovieI(1) = getframe(gcf);
                save('MovieI.mat','MovieI','-v6')
>>>>>>> parent of 0b46fd4... add
            end
    end
end