function [Erro] = Calculo_MSE(Saida)
    load('Dados.mat','Dados_Saida');
<<<<<<< HEAD
    load('l.mat','l');
    if l == 0
        Dados_Saida = real(Dados_Saida);
    else
        Dados_Saida = imag(Dados_Saida);
=======
    load('complex.mat','complex')
    if complex==1
        Esperado = imag(Dados_Saida);
    else
        Esperado = real(Dados_Saida);
>>>>>>> backf_adicionada
    end
    N = size(Saida,1)*size(Saida,2);
    Erro = abs(Saida-Dados_Saida).^2/N;
end