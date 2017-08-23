function [Erro] = Calculo_MSE(Saida)
    load('Dados.mat','Dados_Saida');
    %%Vou ter que me livrar da dependecia desse l.mat, para as coisas
    %%funcionarem direito!
    l = 0;
    if l == 0
        Esperado = real(Dados_Saida);
    else
        Esperado = imag(Dados_Saida);
    end
    N = size(Saida,1)*size(Saida,2);
    Erro = sum(sum(abs(Saida-Esperado).^2))/N;
end