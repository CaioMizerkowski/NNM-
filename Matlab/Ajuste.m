function [Mvalores] = Ajuste(Entrada_Complexa)
% Autor: Caio Mizerkowski
% Função: Ajustar os parametros entregues para a rede neural
    M = 2;
    
    Vetor_Absoluto = abs(Entrada_Complexa);
    Fase_Complexa = angle(Entrada_Complexa);
    clear Entrada_Complexa
    
    n = 2:1:length(Fase_Complexa);
    Variacao_Fase = zeros(length(Fase_Complexa),1);
    Variacao_Fase(1) = Fase_Complexa(1);
    Variacao_Fase(n) = Fase_Complexa(n) - Fase_Complexa(n-1);
    clear Fase_Complexa n
    
    Vetor_Cossenos = cos(Variacao_Fase);
    Vetor_Senos = sin(Variacao_Fase);
    clear Variacao_Fase
    VA = zeros(length(Vetor_Absoluto)-M,M+1);
    VC = zeros(length(Vetor_Absoluto)-M,M+1);
    VS = zeros(length(Vetor_Absoluto)-M,M+1);
    for k = 0:M
        VA(:,k+1) = Vetor_Absoluto(k+1:end-M+k);
        VC(:,k+1) = Vetor_Cossenos(k+1:end-M+k);
        VS(:,k+1) = Vetor_Senos(k+1:end-M+k);
    end
    Mvalores = [VA,VC,VS];
end