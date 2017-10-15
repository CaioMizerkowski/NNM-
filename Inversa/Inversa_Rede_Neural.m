function [] = Inversa_Rede_Neural
%     delete('Entradas_Estimadas.mat');
    M=2;
    load('data_LDMOS.mat','out_validation');
    Entradas_Estimadas = out_validation(1:M);
    save('Entradas_Estimadas.mat','Entradas_Estimadas','-v6');
    clear out_validation
    
%     xr = 1;
%     xj = 1;
%     Rede_Real_P = @(x,Amostra,in_validation,Entradas_Estimadas,Pesos_r)...
%              Rede_R(x,Amostra,in_validation,Entradas_Estimadas,Pesos_r);
%     Rede_Imag_P = @(x,Amostra,in_validation,Entradas_Estimadas,Pesos_j)...
%              Rede_J(x,Amostra,in_validation,Entradas_Estimadas,Pesos_j);

    xc = [0.5 0.5];
    Rede_Comp_P = @(x,Amostra,in_validation,Entradas_Estimadas,Pesos_r,Pesos_j)...
             Rede_C(x,Amostra,in_validation,Entradas_Estimadas,Pesos_r,Pesos_j);
         
    load('PESOS.mat');
    Pesos_r=Pesos;
    load('PESOS_j.mat');
    Pesos_j=Pesos;
    load('data_LDMOS.mat','in_validation');
    options = optimset('Display','off','Algorithm','levenberg-marquardt');
    
    for Amostra = 1:8499
%         Rede_Real = @(x) Rede_Real_P(x,Amostra,in_validation,Entradas_Estimadas,Pesos_r);
%         Rede_Imag = @(x) Rede_Imag_P(x,Amostra,in_validation,Entradas_Estimadas,Pesos_j);
%         [x_r,Minimizar(1)] = fsolve(Rede_Real,xr,options);
%         [x_j,Minimizar(2)] = fsolve(Rede_Imag,xj,options);
%         xr=x_r;xj=x_j;x_t=x_r+1i*x_j;

        Rede_Comp = @(x) Rede_Comp_P(x,Amostra,in_validation,Entradas_Estimadas,Pesos_r,Pesos_j);
        [x_c,Minimizar] = fsolve(Rede_Comp,xc,options);
        x_t=x_c(1)+1i*x_c(2);xc=x_c;
        
        Entradas_Estimadas(Amostra+M) = x_t;
%         disp(['Minimizar Real: ',num2str(abs(Minimizar(1))),...
%            10,'Minimizar Imag: ',num2str(abs(Minimizar(2)))]);

    end
    save('Entradas_Estimadas.mat','Entradas_Estimadas','-v6');
    Comparar;
    Validar;
    Plotagens;
    delete('Saida.mat','complex.mat','Entradas_Estimadas.mat','Dados.mat')
end