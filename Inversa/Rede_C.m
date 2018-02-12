function [Minimizar] = Rede_C(x,Amostra,in_validation,Entradas_Estimadas,Pesos_r,Pesos_j)
    global M;
    x = x(1)+1i*x(2);
    in_validation = in_validation(Amostra:Amostra+M);
    out_validation = Entradas_Estimadas(Amostra:Amostra+M-1);
    out_validation = [out_validation;x];
    
    %Ajuste dos Dados
    Dados_Entrada = Ajuste(out_validation,M);
    Dados_Saida = in_validation(M+1:end)...
        .*exp(-1i*angle(out_validation(M+1:end)));
    
    Saida_r = Aplicar_Rede(Dados_Entrada,Pesos_r);
    Minimizar(1) = (Saida_r - real(Dados_Saida));
    
    Saida_j = Aplicar_Rede(Dados_Entrada,Pesos_j);
    Minimizar(2) = (Saida_j - imag(Dados_Saida));
end

