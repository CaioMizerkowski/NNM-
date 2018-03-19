function [] = Inversa_Rede_Neural(val_or_ext)
    global M;
    M=2;
    load('data_LDMOS.mat',['out_',val_or_ext]);
    eval(['out = out_',val_or_ext,';']);
    Entradas_Estimadas = out(1:M);
    save('Entradas_Estimadas.mat','Entradas_Estimadas','-v6');
    clear ['out_',val_or_ext]

    xc = [0.5 0.5];
    Rede_Comp_P = @(x,in,Entradas_Estimadas,Pesos_r,Pesos_j)...
             Rede_C(x,in,Entradas_Estimadas,Pesos_r,Pesos_j);

    load('PESOS.mat');Pesos_r=Pesos;load('PESOS_j.mat');Pesos_j=Pesos;
    load('data_LDMOS.mat',['in_',val_or_ext]);
    eval(['in = in_',val_or_ext,';']);
    clear ['in_',val_or_ext]
    
    options = optimoptions('fsolve','Display','off','Algorithm','levenberg-marquardt',...
        'FunctionTolerance',1e-12,'StepTolerance',1e-12,'CheckGradients',true);%
    
     t = 1;
    for Am = 1:length(out)-M
%         tic
        Rede_Comp = @(x) Rede_Comp_P(x,in(Am:Am+M),Entradas_Estimadas(Am:Am+M-1),Pesos_r,Pesos_j);
        [x_c,res] = fsolve(Rede_Comp,xc,options);
        
        p = 0;%x_t = x_t*exp(0.7i);
        if(res(1)>0.001 || res(2)>0.001)
            x_t = in(Am+M);
            [x_c,res] = fsolve(Rede_Comp,[real(x_t),imag(x_t)],options);
            
            t = t+1;
            p = p+1;
        end
        while(res(1)>0.001 && res(2)>0.001)
            x_t = x_t*exp(0.1i);
            [x_c,res] = fsolve(Rede_Comp,[real(x_t),imag(x_t)],options);
            
            disp([num2str(t),' e ',num2str(p),' e ', num2str(Am)]);
            t = t+1;
            p = p+1;
            if(p==10)
                pause
            end
        end

        x_t=x_c(1)+1i*x_c(2);
        xc=x_c;
        Entradas_Estimadas(Am+M) = x_t;
%         t = t + toc;
    end
%     t = t/(length(out)-M);
    save('Entradas_Estimadas.mat','Entradas_Estimadas','-v6');
    disp('cascata')
    NMSE(out,Entradas_Estimadas);
    
    %[Erro,Vetor_Erro] = Comparar(val_or_ext);
    Validar(val_or_ext);
    Plotagens(val_or_ext);
    
   %delete('Entradas_Estimadas.mat','Saida_complexa.mat','Dados.mat')
end