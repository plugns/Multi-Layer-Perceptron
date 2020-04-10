% Script de Treinamento da Rede PMC
clear all
clc
%Dados de treinamento
X1=[0.8799 0.7998  0.3972; 0.5700  0.5111  0.2418; 0.6796  0.4117  0.3370; 0.3567  0.2967  0.6037; 0.3866  0.8390  0.0232; 0.0271  0.7788  0.7445; 0.8174  0.8422  0.3229; 0.6027  0.1468  0.3759; 0.1203  0.3260  0.5419; 0.1325  0.2082  0.4934; 0.6950  1.0000  0.4321; 0.0036  0.1940  0.3274;
0.2650  0.0161  0.5947; 0.5849  0.6019  0.4376; 0.0108  0.3538  0.1810;
0.9008  0.7264  0.9184; 0.0023  0.9659  0.3182; 0.1366  0.6357  0.6967;
0.8621  0.7353  0.2742; 0.0682  0.9624  0.4211; 0.6112  0.6014  0.5254;
0.0030  0.7585  0.8928; 0.7644  0.5964  0.0407; 0.6441  0.2097  0.5847;
0.0803  0.3799  0.6020; 0.1908  0.8046  0.5402; 0.6937  0.3967  0.6055;
0.2591  0.0582  0.3978; 0.4241  0.1850  0.9066; 0.3332  0.9303  0.2475;
0.3625  0.1592  0.9981; 0.9259  0.0960  0.1645; 0.8606  0.6779  0.0033;
0.0838  0.5472  0.3758; 0.0303  0.9191  0.7233; 0.9293  0.8319  0.9664;
0.7268  0.1440  0.9753; 0.2888  0.6593  0.4078; 0.5515  0.1364  0.2894;
0.7683  0.0067  0.5546; 0.6462  0.6761  0.8340; 0.3694  0.2212  0.1233;
0.2706  0.3222  0.9996; 0.6282  0.1404  0.8474; 0.5861  0.6693  0.3818;
0.6057  0.9901  0.5141; 0.5915  0.5588  0.3055; 0.8359  0.4145  0.5016;
0.5497  0.6319  0.8382; 0.7072  0.1721  0.3812; 0.1185  0.5084  0.8376;
0.6365  0.5562  0.4965; 0.4145  0.5797  0.8599; 0.2575  0.5358  0.4028;
0.2026  0.3300  0.3054; 0.3385  0.0476  0.5941; 0.4094  0.1726  0.7803;
0.1261  0.6181  0.4927; 0.1224  0.4662  0.2146; 0.6793  0.6774  1.0000;
0.8176  0.0358  0.2506; 0.6937  0.6685  0.5075; 0.2404  0.5411  0.8754;
0.6553  0.2609  0.1188; 0.8886  0.0288  0.2604; 0.3974  0.5275  0.6457;
0.2108  0.4910  0.5432; 0.8675  0.5571  0.1849; 0.5693  0.0242  0.9293;
0.8439  0.4631  0.6345; 0.3644  0.2948  0.3937; 0.2014  0.6326  0.9782;
0.4039  0.0645  0.4629; 0.7137  0.0670  0.2359; 0.4277  0.9555  0.0000;
0.0259  0.7634  0.2889; 0.1871  0.7682  0.9697; 0.3216  0.5420  0.0677;
0.2524  0.7688  0.9523; 0.3621  0.5295  0.2521; 0.2942  0.1625  0.2745;
0.8180  0.0023  0.1439; 0.8429  0.1704  0.5251; 0.9612  0.6898  0.6630;
0.1009  0.4190  0.0826; 0.7071  0.7704  0.8328; 0.3371  0.7819  0.0959;
0.1555  0.5599  0.9221; 0.7318  0.1877  0.3311; 0.1665  0.7449  0.0997;
0.8762  0.2498  0.9167; 0.9885  0.6229  0.2085; 0.0461  0.7745  0.5632;
0.3209  0.6229  0.5233; 0.9189  0.5930  0.7288; 0.0382  0.5515  0.8818;
0.3726  0.9988  0.3814; 0.4211  0.2668  0.3307; 0.2378  0.0817  0.3574;
0.9893  0.7637  0.2526; 0.8203  0.0682  0.4260; 0.6226  0.2146  0.1021;
0.4589  0.3147  0.2236; 0.3471  0.8889  0.1564; 0.5762  0.8292  0.4116;
0.9053  0.6245  0.5264; 0.2860  0.0793  0.0549; 0.9567  0.3034  0.4425;
0.5170  0.9266  0.1565; 0.8149  0.0396  0.6227; 0.3710  0.3554  0.5633;
0.8702  0.3185  0.2762; 0.1016  0.6382  0.3173; 0.3890  0.2369  0.0083;
0.2702  0.8617  0.1218; 0.7473  0.6507  0.5582; 0.9108  0.2139  0.4641;
0.4343  0.6028  0.1344; 0.6847  0.4062  0.9318; 0.8657  0.9448  0.9900;
0.4011  0.4138  0.8715; 0.5949  0.2600  0.0810; 0.1845  0.7906  0.9725;
0.3438  0.6725  0.9821; 0.8398  0.1360  0.9119; 0.2245  0.0971  0.6136;
0.3742  0.9668  0.8194; 0.9572  0.9836  0.3793; 0.7496  0.0410  0.1360;
0.9123  0.3510  0.0682; 0.6954  0.5500  0.6801; 0.5252  0.6529  0.5729;
0.3156  0.3851  0.5983; 0.1460  0.1637  0.0249; 0.7780  0.4491  0.4614;
0.5959  0.8647  0.8601; 0.2204  0.1785  0.4607; 0.7355  0.8264  0.7015;
0.9931  0.6727  0.3139; 0.9123  0.0000  0.1106; 0.2858  0.9688  0.2262;
0.7931  0.8993  0.9028; 0.7841  0.0778  0.9012; 0.1380  0.5881  0.2367;
0.6345  0.5165  0.7139; 0.2453  0.5888  0.1559; 0.1174  0.5436  0.3657;
0.3667  0.3228  0.6952; 0.9532  0.6949  0.4451; 0.7954  0.8346  0.0449;
0.1427  0.0480  0.6267; 0.1516  0.9824  0.0827; 0.4868  0.6223  0.7462;
0.3408  0.5115  0.0783; 0.8146  0.6378  0.5837; 0.2820  0.5409  0.7256;
0.5716  0.2958  0.5477; 0.9323  0.0229  0.4797; 0.2907  0.7245  0.5165;
0.0068  0.0545  0.0861; 0.2636  0.9885  0.2175; 0.0350  0.3653  0.7801;
0.9670  0.3031  0.7127; 0.0000  0.7763  0.8735; 0.4395  0.0501  0.9761;
0.9359  0.0366  0.9514; 0.0173  0.9548  0.4289; 0.6112  0.9070  0.6286;
0.2010  0.9573  0.6791; 0.8914  0.9144  0.2641; 0.0061  0.0802  0.8621;
0.2212  0.4664  0.3821; 0.2401  0.6964  0.0751; 0.7881  0.9833  0.3038;
0.2435  0.0794  0.5551; 0.2752  0.8414  0.2797; 0.7616  0.4698  0.5337;
0.3395  0.0022  0.0087; 0.7849  0.9981  0.4449; 0.8312  0.0961  0.2129;
0.9763  0.1102  0.6227; 0.8597  0.3284  0.6932; 0.9295  0.3275  0.7536;
0.2435  0.2163  0.7625; 0.9281  0.8356  0.5285; 0.8313  0.7566  0.6192;
0.1712  0.0545  0.5033; 0.0609  0.1702  0.4306; 0.5899  0.9408  0.0369;
0.7858  0.5115  0.0916; 1.0000  0.1653  0.7103; 0.2007  0.1163  0.3431;
0.2306  0.0330  0.0293; 0.8477  0.6378  0.4623; 0.9677  0.7895  0.9467;
0.0339  0.4669  0.1526; 0.0080  0.8988  0.4201; 0.9955  0.8897  0.6175;
0.7408  0.5351  0.2732; 0.6843  0.3737  0.1562];

limiar=[-1];
for i=1:200
    X(:,i)=[-1 X1(i,:)];
end
X=X'
%Conjunto de dados de saída desejada para o treinamento
D=[0.8399 0.6258 0.6622 0.5969 0.5316 0.6335 0.8068 0.5342 0.4768 0.4105 0.8404 0.2697 0.4125 0.7464 0.2800 0.9602 0.4986 0.6459 0.7718 0.5764 0.7868 0.6388 0.6055 0.6545 0.4991 0.6665 0.7595 0.3604 0.6298 0.6287 0.5948 0.4716 0.6242 0.4835 0.6491 0.9840 0.7096 0.6328  0.4745 0.5708 0.8933 0.3658 0.6310 0.6733 0.7433 0.8466 0.6787 0.7597 0.8521 0.5772 0.6211 0.7693 0.7878 0.5777 0.4261 0.4625 0.6015 0.5739 0.4007 0.9141 0.4707 0.8220 0.6980 0.4851 0.4802 0.7215 0.5913 0.6805 0.6033 0.8226 0.5240 0.7143 0.4547 0.4602 0.5477 0.4738 0.7397 0.4526 0.7711 0.5571 0.3759 0.4018 0.6563 0.9128 0.3055 0.9298 0.5377 0.6663 0.5689 0.4508 0.7829 0.7200 0.5949 0.6810 0.8989 0.5999 0.7086 0.5080 0.3452 0.7755 0.5643 0.4452 0.4962 0.5875 0.7853 0.8506 0.2224 0.6993 0.6594 0.6165 0.6171 0.6287 0.4957 0.3235 0.5319 0.8464 0.6625 0.5546 0.8204 0.9904 0.7222 0.4480 0.7425 0.7926 0.7222 0.4402 0.8371 0.8556 0.4059 0.5455 0.8388 0.7893 0.6161 0.1813 0.7498 0.9176 0.4276 0.9214 0.7829 0.3944 0.5988 0.9728 0.6832 0.4622 0.8191 0.4765 0.4953 0.6376 0.8426 0.6676 0.3780 0.4627 0.8116 0.4559 0.8628 0.6939 0.6619 0.5731 0.6911 0.0851 0.5847 0.5117 0.7836 0.6388 0.5712 0.6826 0.5527 0.8803 0.7283 0.7966 0.3711 0.5260 0.4637 0.8049 0.4223 0.6079 0.7809 0.1836 0.8641 0.4857 0.6667 0.7829 .8016 0.5449 0.8991 0.9047 0.3561 0.3310 0.6245 0.6066 0.7172 0.3385 0.1590 0.8254 0.9782 0.3250 0.5404 0.9360 0.6949 0.5625]
D=D';

W1=[rand(1,4);rand(1,4);rand(1,4);rand(1,4);rand(1,4);rand(1,4);rand(1,4);rand(1,4);rand(1,4);rand(1,4)] %Inicialização randomica da matriz de pesos 1

W2=rand(1,11) %Inicialização randomica da matriz de pesos 2

n=0.1; %Taxa de aprendizado
n_epoca=2000; %Número de épocas de treinamento
e=0.000001; %Precisão
%inicialização das variáveis
epocas_executadas=0;
k=1;
Eqm=0;
n_padroes=200;
Eq=0;
for i=1:200
    u1=W1*X(i,:)';
    y1=[-1 (logsig(u1))']';
    u2=W2*y1;
    y2=logsig(u2);
    Eq=Eq+((D(i)-y2)^2)/2;
end
E_anterior=Eq/n_padroes;
E=1;
while (k<n_epoca)
    epocas_executadas=epocas_executadas+1;
    for i=1:200
        u1=W1*X(i,:)';
        y1=[-1 (logsig(u1))']';
        u2=W2*y1;
        y2=logsig(u2);
        Delta2=(D(i)-y2)*(y2*(1-y2));
        W2=W2+n*Delta2*y1';
        Delta1=Delta2*W2*(y1'*(1-y1));
        for j=1:10
            W1(j,:)=W1(j,:)+n*Delta1(j)*X(i,:);
            j=j+1;
        end
    end
    Eq=0;
    for i=1:200
        u1=W1*X(i,:)';
        y1=[-1 (logsig(u1))']';
        u2=W2*y1;
        y2=logsig(u2);
        Eq=Eq+((D(i)-y2)^2)/2;
    end
    E_atual=Eq/n_padroes;
    E=abs(E_atual-E_anterior);
    E_anterior=E_atual;
    EPOCAS(epocas_executadas)=epocas_executadas;
    EPSILON(epocas_executadas)=E;
    plot(EPOCAS,EPSILON)
    E
    if (E<e)
        E
        epocas_executadas
        W1
        W2
        k=n_epoca;
        
        for i=1:200
            u1=W1*X(i,:)';
            y1=[-1 (logsig(u1))']';
            u2=W2*y1;
            y2(i)=logsig(u2);            
            
        end
    end
    k=k+1;
end
 
z=1:200;
y2=y2';
L=0
for q=1:200
    L=L+D(q)-y2(q);
end
L=L/200
figure;
plot(z,y2,z,D)
