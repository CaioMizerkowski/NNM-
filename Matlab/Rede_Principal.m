function [Saida] = Rede_Principal(Mvalores)
    [Pesos] = Criar_Pesos_Random(Mvalores);
    [Saida] = Aplicar_Rede(Mvalores,Pesos);
end