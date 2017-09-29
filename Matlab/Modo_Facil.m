close
clear
M=8;
var1=50;
var2=0;

Salvando_Infos_Uso_Futuro('Dados/data_LDMOS.mat','in_extraction','out_extraction',M);
load('Dados/Dados.mat','Num_Neuronios','Dados_Entrada','Dados_Saida');
net = feedforwardnet(Num_Neuronios);
net = train(net,Dados_Entrada,real(Dados_Saida));
y = net(Dados_Entrada);

figure()
subplot(2,1,1)
hold on
plot(real(Dados_Saida(end-var1-var2:end-var2)),'b.-');
plot(y(end-var1-var2:end-var2),'ro');
grid
hold off

Salvando_Infos_Uso_Futuro('Dados/data_LDMOS.mat','out_validation','in_validation',M);
load('Dados/Dados.mat','Num_Neuronios','Dados_Entrada','Dados_Saida');
y = net(Dados_Entrada);

subplot(2,1,2)
hold on
plot(real(Dados_Saida(end-var1-var2:end-var2)),'b.-');
plot(y(end-var1-var2:end-var2),'ro');
grid
hold off
IW = net.IW;
LW = net.LW;
b = net.b;
clear