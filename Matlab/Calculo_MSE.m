function [Erro] = Calculo_MSE(Saida)
    load('Dados.mat','Dados_Saida');
    load('complex.mat','complex')
    if complex==1
        Esperado = imag(Dados_Saida);
    else
        Esperado = real(Dados_Saida);
    end
    N = size(Saida,1)*size(Saida,2);
    Erro = sum(sum(abs(Saida-Esperado).^2))/N;
end