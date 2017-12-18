function [NMSE] = Erro_NMSE()
    load('Entradas_Estimadas.mat','Entradas_Estimadas')
    load('data_LDMOS.mat','out_validation')
    
    saida_referencia = out_validation;
    saida_teste = Entradas_Estimadas;
    
    NMSE = 10*log10((sum(abs(saida_teste-saida_referencia).^2))...
        /(sum(abs(saida_referencia).^2)));
end

