function [Erro,Vetor_Erro] = Inversa_Rede_Neural
    global M;
    M=2;
    load('data_LDMOS.mat','out_validation');
    Entradas_Estimadas = out_validation(1:M);
    save('Entradas_Estimadas.mat','Entradas_Estimadas','-v6');
    clear out_validation

    xc = [0.5 0.5];
    Rede_Comp_P = @(x,Amostra,in_validation,Entradas_Estimadas,Pesos_r,Pesos_j)...
             Rede_C(x,Amostra,in_validation,Entradas_Estimadas,Pesos_r,Pesos_j);

    load('PESOS.mat');Pesos_r=Pesos;load('PESOS_j.mat');Pesos_j=Pesos;
    load('data_LDMOS.mat','in_validation');
    
    options = optimoptions('fsolve','Display','off','Algorithm','levenberg-marquardt',...
        'FunctionTolerance',1e-12,'StepTolerance',1e-12,'CheckGradients',true);
    
    t = 0;
    for Amostra = 1:8499
        tic
        Rede_Comp = @(x) Rede_Comp_P(x,Amostra,in_validation,Entradas_Estimadas,Pesos_r,Pesos_j);
        [x_c,res] = fsolve(Rede_Comp,xc,options);
        
        while(res(1)>0.001 || res(2)>0.001)
            [x_c,res] = fsolve(Rede_Comp,rand(1,2),options);
        end
        
        x_t=x_c(1)+1i*x_c(2);
        xc=x_c;
        Entradas_Estimadas(Amostra+M) = x_t;
        t = t + toc;
    end
    t = t/8499;
    save('Entradas_Estimadas.mat','Entradas_Estimadas','-v6');
    Validar;
    [Erro,Vetor_Erro] = Comparar;
    Plotagens;
   delete('Entradas_Estimadas.mat','Saida_complexa.mat','Dados.mat')
end