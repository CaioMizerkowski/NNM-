function [Erro] = Comparar
    load('Entradas_Estimadas.mat')
    load('data_LDMOS.mat','out_validation')
    out_validation = out_validation(1:length(Entradas_Estimadas));
    Vetor_Erro = Entradas_Estimadas - out_validation;
    Erro = mean((abs(real(Vetor_Erro)))+ 1i*mean(abs(imag(Vetor_Erro))));
    disp(num2str(Erro))
end

