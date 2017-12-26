function [Erro,Vetor_Erro] = Comparar(val_or_ext)
    load('Entradas_Estimadas.mat')
    load('data_LDMOS.mat',['out_',val_or_ext])
    eval(['out = out_',val_or_ext]);
    out = out(1:length(Entradas_Estimadas));
    Vetor_Erro = Entradas_Estimadas - out;
    Erro = abs(Vetor_Erro);
    a=1;b =1;c=1;d=1;e=1;
    for k=1:length(Entradas_Estimadas)
        if Erro(k)<0.0001
            a(end+1) = k;
        elseif Erro(k)<0.001
            b(end+1) = k;
        elseif Erro(k)<0.01
            c(end+1) = k;
        elseif Erro(k)<0.1
            d(end+1) = k;
        else
            e(end+1) = k;
        end
    end
    a=a(2:end);b=b(2:end);c=c(2:end);d=d(2:end);e=e(2:end);
    Erro = struct('Erro104',a,'Erro103',b,'Erro_102',c,'Erro_101',d,'Erro100',e);
end

