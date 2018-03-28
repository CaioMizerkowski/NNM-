function [] = Salvamento()
    global Num_Neuronios;
    
    load('data_LDMOS.mat','in_validation','out_validation');
    
    load('PESOS.mat');
    [pesos_reais1,pesos_reais2]= Vetor_2_Matriz(Pesos);
    
    load('PESOS_j.mat');
    [pesos_imaginarios1,pesos_imaginarios2]= Vetor_2_Matriz(Pesos);
    
    load('Saida.mat','Saida_complexa')
    out_estimado = Saida_complexa;
    clear Pesos Saida_complexa
    

    save(['NN_0',num2str(Num_Neuronios),'.mat']);
end