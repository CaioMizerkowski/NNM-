function [Mvalores] = Ajuste(Entrada_Complexa)
% Autor: Caio Mizerkowski
% Função: Ajustar os parametros entregues para a rede neural
    M = 2;
    
    Vetor_Absoluto = abs(Entrada_Complexa(2:end));
    Vetor_Real = real(Entrada_Complexa(2:end-2));
    Vetor_Imag = imag(Entrada_Complexa(2:end-2));
    Fase_Complexa = angle(Entrada_Complexa);
    clear Entrada_Complexa
    
    n = 2:1:length(Fase_Complexa);
    Variacao_Fase = Fase_Complexa(n) - Fase_Complexa(n-1);
    clear Fase_Complexa n
    
    Vetor_Cossenos = cos(Variacao_Fase);
    Vetor_Senos = sin(Variacao_Fase);
    clear Variacao_Fase
    
    VA = zeros(length(Vetor_Absoluto)-M,M+1);
    VC = zeros(length(Vetor_Absoluto)-M,M+1);
    VS = zeros(length(Vetor_Absoluto)-M,M+1);
        k =0;
    for k = 0:M
        VA(:,M+1-k) = Vetor_Absoluto(k+1:end-M+k);
        VC(:,M+1-k) = Vetor_Cossenos(k+1:end-M+k);
        VS(:,M+1-k) = Vetor_Senos(k+1:end-M+k);
    end
    Mvalores = [VA,VC(:,1:end-1),VS(:,1:end-1),Vetor_Real,Vetor_Imag];
end