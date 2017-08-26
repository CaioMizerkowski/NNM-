function [Erro] = Calculo_MSE(Saida)
    load('Dados.mat','Dados_Saida');
    load('l.mat','l');
    if l == 0
        Dados_Saida = real(Dados_Saida);
    else
        Dados_Saida = imag(Dados_Saida);
    end
    N = size(Saida,1)*size(Saida,2);
    Erro = abs(Saida-Dados_Saida).^2/N;
end