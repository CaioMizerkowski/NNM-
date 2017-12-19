function [NMSE] = Erro_NMSE()

    load('Dados.mat','Dados_Saida','M')
    load('Saida.mat','Saida_complexa')
    load('data_LDMOS.mat','in_validation')
    
    saida_referencia = Dados_Saida;
    saida_teste = Saida_complexa;
    
    NMSE = 10*log10((sum(abs(saida_teste-saida_referencia).^2))...
        /(sum(abs(saida_referencia).^2)));
    
    disp(['NMSE validação: ',num2str(NMSE)])
end

