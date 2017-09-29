function [Mvalores] = Ajuste(Entrada_Complexa,M)
% Autor: Caio Mizerkowski
% Função: Ajustar os parametros entregues para a rede neural
    
    Vetor_Absoluto = abs(Entrada_Complexa(2:end));
    Fase_Complexa = angle(Entrada_Complexa);
    
% %     Vetor_Real = real(Entrada_Complexa);
% %     Vetor_Imag = imag(Entrada_Complexa);
    clear Entrada_Complexa
    
    n = 2:1:length(Fase_Complexa);
    Variacao_Fase = Fase_Complexa(n) - Fase_Complexa(n-1);
    
% %     Variacao_Real = Vetor_Real(n) - Vetor_Real(n-1);
% %     Variacao_Imag = Vetor_Imag(n) - Vetor_Imag(n-1);
    clear Fase_Complexa n
    
    Vetor_Cossenos = cos(Variacao_Fase);
    Vetor_Senos = sin(Variacao_Fase);
    clear Variacao_Fase
    
    VA = zeros(length(Vetor_Absoluto)-M,M+1);
    VC = zeros(length(Vetor_Absoluto)-M,M+1);
    VS = zeros(length(Vetor_Absoluto)-M,M+1);
    
% %     DR = zeros(length(Vetor_Absoluto)-M,M+1);
% %     DI = zeros(length(Vetor_Absoluto)-M,M+1);
% %     VR = zeros(length(Vetor_Absoluto)-M,M+1);
% %     VI = zeros(length(Vetor_Absoluto)-M,M+1);
    for k = 0:M
        VA(:,1+k) = Vetor_Absoluto(k+1:end+k-M);
        VC(:,1+k) = Vetor_Cossenos(k+1:end+k-M);
        VS(:,1+k) = Vetor_Senos(k+1:end+k-M);
        
% %         DR(:,M+1-k) = Variacao_Real(k+1:end-M+k);
% %         DI(:,M+1-k) = Variacao_Imag(k+1:end-M+k);
% %         VR(:,M+1-k) = Vetor_Real(k+1:end-M+k-1);
% %         VI(:,M+1-k) = Vetor_Imag(k+1:end-M+k-1);
    end
    
    Mvalores = [VA,VC(:,2:end),VS(:,2:end)];
    %,VR,VI,DR(:,1:end-1),DI(:,1:end-1)
end