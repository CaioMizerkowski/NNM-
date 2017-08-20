function [Erro] = Calculo_MSE(Saida)
    load('Dados.mat','Dados_Saida');
    load('l.mat','l');
    M = 0;
    if l == 0
        Esperado = real(Dados_Saida(1:end-M));
    else
        Esperado = imag(Dados_Saida(1:end-M));
    end
    N = size(Saida,1)*size(Saida,2);
    Erro = sum(sum(abs(Saida-Esperado).^2))/N;
end