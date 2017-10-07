function [Matrix_Valores] = Ajuste(Entrada_Complexa,M)
    Amplitude = abs(Entrada_Complexa);
    Fase = angle(Entrada_Complexa);
    clear Entrada_Complexa
    
    tamanho = length(Fase);
    n = 2:tamanho;
    Delta_Fase = Fase(n) - Fase(n-1);
    clear n
    
    Cossenos = cos(Delta_Fase);    
    Senos = sin(Delta_Fase);
    clear Delta_Fase
    
    VA = zeros(tamanho-M,M+1);
    VC = zeros(tamanho-M,M);
    VS = zeros(tamanho-M,M);
    
    for k = 0:M
        VA(:,M+1-k) = Amplitude(k+1:end+k-M);
        if k<M
            VC(:,M-k) = Cossenos(k+1:end+k-M+1);
            VS(:,M-k) = Senos(k+1:end+k-M+1);
        end
    end
    Matrix_Valores = [VA,VC,VS];
end