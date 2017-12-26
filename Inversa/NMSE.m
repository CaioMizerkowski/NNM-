function [] = NMSE(saida_referencia,saida_teste)   
    NMSE = 10*log10((sum(abs(saida_teste-saida_referencia).^2))...
        /(sum(abs(saida_referencia).^2)));
    
    disp(['NMSE: ',num2str(NMSE)])
end

