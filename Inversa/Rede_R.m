function [Minimizar] = Rede_R(x,Amostra,in_validation,Entradas_Estimadas,Pesos)
    M=2;

    in_validation = in_validation(Amostra:Amostra+M);   
    out_validation = Entradas_Estimadas(Amostra:Amostra+M-1);
    out_validation = [out_validation;x];
    
    %Ajuste dos Dados
    Dados_Entrada = Ajuste(out_validation,M);
    Dados_Saida = in_validation(M+1:end)...
        .*exp(-1i*angle(out_validation(M+1:end)));
    
    Saida = Aplicar_Rede(Dados_Entrada,Pesos);
    Minimizar = Saida - real(Dados_Saida);
end