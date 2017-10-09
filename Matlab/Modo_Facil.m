close
clear

%%
var1=500;
var2=0;

Salvando2_Infos_Uso_Futuro;
load('Dados.mat','Num_Neuronios','Dados_Entrada','Dados_Saida');
Parte_Real = feedforwardnet(Num_Neuronios);
Parte_Real = train(Parte_Real,Dados_Entrada',real(Dados_Saida)');

load('data_LDMOS.mat','in_validation','out_validation');
load('Dados.mat','M');
Dados_Saida = in_validation(1:end);
Dados_Entrada = [real(out_validation),imag(out_validation),abs(out_validation),angle(out_validation)];
y = Parte_Real(Dados_Entrada');

figure(1)
hold on
plot(real(Dados_Saida(end-var1-var2:end-var2)),'b.-');
plot(y(end-var1-var2:end-var2),'ro');
grid
legend('Original','Rede')
title('Toolbox')
ylabel('Parte Real')
xlabel('Amostra')
hold off
clear

%%
var1=500;
var2=0;

Salvando2_Infos_Uso_Futuro;
load('Dados.mat','Num_Neuronios','Dados_Entrada','Dados_Saida');
Parte_Imag = feedforwardnet(Num_Neuronios);
Parte_Imag = train(Parte_Imag,Dados_Entrada',imag(Dados_Saida)');

load('data_LDMOS.mat','in_validation','out_validation');
load('Dados.mat','M');
Dados_Saida = in_validation(1:end);
Dados_Entrada = [real(out_validation),imag(out_validation),abs(out_validation),angle(out_validation)];
y = Parte_Imag(Dados_Entrada');

figure(2)
hold on
plot(imag(Dados_Saida(end-var1-var2:end-var2)),'b.-');
plot(y(end-var1-var2:end-var2),'ro');
grid
legend('Original','Rede')
title('Toolbox')
ylabel('Parte Imaginaria')
xlabel('Amostra')
hold off
clear