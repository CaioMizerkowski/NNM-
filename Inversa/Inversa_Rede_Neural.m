function [] = Inversa_Rede_Neural(val_or_ext)
    global M;
    M=2;
    load('data_LDMOS.mat',['out_',val_or_ext]);
    eval(['out = out_',val_or_ext,';']);
    Entradas_Estimadas = out(1:M);
    save('Entradas_Estimadas.mat','Entradas_Estimadas','-v6');
    clear ['out_',val_or_ext]

    xc = [0.5 0.5];
    Rede_Comp_P = @(x,Amostra,in,Entradas_Estimadas,Pesos_r,Pesos_j)...
             Rede_C(x,Amostra,in,Entradas_Estimadas,Pesos_r,Pesos_j);

    load('PESOS.mat');Pesos_r=Pesos;load('PESOS_j.mat');Pesos_j=Pesos;
    load('data_LDMOS.mat',['in_',val_or_ext]);
    eval(['in = in_',val_or_ext,';']);
    clear ['in_',val_or_ext]
    
    options = optimoptions('fsolve','Display','off','Algorithm','levenberg-marquardt',...
        'FunctionTolerance',1e-12,'StepTolerance',1e-12,'CheckGradients',true);
    
    t = 0;
    for Amostra = 1:length(out)-M
%         tic
        Rede_Comp = @(x) Rede_Comp_P(x,Amostra,in,Entradas_Estimadas,Pesos_r,Pesos_j);
        [x_c,res] = fsolve(Rede_Comp,xc,options);
        
        while(res(1)>0.001 || res(2)>0.001)
            [x_c,res] = fsolve(Rede_Comp,rand(1,2),options);
        end
        
        x_t=x_c(1)+1i*x_c(2);
        xc=x_c;
        Entradas_Estimadas(Amostra+M) = x_t;
%         t = t + toc;
    end
%     t = t/(length(out)-M);
    save('Entradas_Estimadas.mat','Entradas_Estimadas','-v6');
    NMSE(out,Entradas_Estimadas);
    
    %[Erro,Vetor_Erro] = Comparar(val_or_ext);
    Validar(val_or_ext);
    Plotagens(val_or_ext);
    
   delete('Entradas_Estimadas.mat','Saida_complexa.mat','Dados.mat')
end