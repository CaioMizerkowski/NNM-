function [Minimizar] = Rede_C(x,in_validation,Entradas_Estimadas,Pesos_r,Pesos_j)
    global M;
    x = x(1)+1i*x(2);
    Entradas_Estimadas = [Entradas_Estimadas;x];
    
    %Ajuste dos Dados
    Dados_Entrada = Ajuste(Entradas_Estimadas,M);
    Dados_Saida = in_validation(M+1:end)...
        .*exp(-1i*angle(Entradas_Estimadas(M+1:end)));
    
    Saida_r = Aplicar_Rede(Dados_Entrada,Pesos_r);
    Minimizar(1) = (Saida_r - real(Dados_Saida));
    
    Saida_j = Aplicar_Rede(Dados_Entrada,Pesos_j);
    Minimizar(2) = (Saida_j - imag(Dados_Saida));
end

