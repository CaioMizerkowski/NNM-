function [Pesos,Sigma] = Ajuste_Camada(Pesos)
    %%Sigma é um vetor ou uma matriz, vou ter que ver com calma.
    %%Saida é uma matriz, com certeza, considerando todos os pesos.
    %%E no final isso vai ter que dar uma matriz do tamanho da matriz de
    %%pesos, para bater tudo certo e fazer sentido
    load('Dados/Dados.mat','Dados_Saida');
    load('Dados/SaidaY.mat','SaidaY')
    load('Dados/complex.mat','complex')
    if complex == 0
        Dados_Saida = real(Dados_Saida);
    else
        Dados_Saida = imag(Dados_Saida);
    end
    rate = 0.5;
    
    %Camada Final
    load('Dados/Camada_Final.mat','Saida','Entrada');
    %[C,S] = ([C,S]-[C,S]).*[C,S]
    Sigma = (Dados_Saida - SaidaY).*(4*exp(-2*Saida)./(1+exp(-2*Saida)).^2);
    %[N+1,S] = [N+1,C]*[C,S]
    Pesos.Pesos2 = Pesos.Pesos2 + rate*Entrada'*Sigma;
    
    %Camada Oculta n
    load('Dados/Camada_Hidden1.mat','Saida','Entrada')
    %[C,N] = [C,S]*[S,N].*[C,N]
    Sigma = -Sigma*(Pesos.Pesos2)'.*(4*exp(-2*Saida)./(1+exp(-2*Saida)).^2);
    %[E+1,N] = [E+1,C]*[C,N]
    Pesos.Pesos1 = Pesos.Pesos1 + rate*Entrada'*Sigma;
    
    %Camada Oculta n-1...
end