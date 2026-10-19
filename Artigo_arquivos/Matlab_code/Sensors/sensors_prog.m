% Umidade do solo prof.15 cm a 6m;
% Conduvitivade eletrica;
% Umidade do solo prof.15 cm a 9m;
% Conduvitivade eletrica;
% Umidade do solo prof. 40 cm a 6m;
% Conduvitivade eletrica;
% Umidade do solo prof.40 cm a 9m
% Conduvitivade eletrica
% col 1 Data Hora 
% z= 15cm, x=6m
% col 2 mü/mü Water Content; 
% col 3 øC Soil Temperature; 
% col 4 mS/cm Bulk EC; 
%
% z= 15cm, x=9m
% col 4 mü/mü Water Content; 
% col 5 øC Soil Temperature; 
% col 6 mS/cm Bulk EC; 
%
% z= 40cm, x=6m
% col 7 mü/mü Water Content; 
% col 8 øC Soil Temperature; 
% col 9 mS/cm Bulk EC; 
%
%
% z= 40cm, x=9m
% col 10 mü/mü Water Content; 
% col 11 øC Soil Temperature; 
% col 12 mS/cm Bulk EC; 
%
clear
[A,Txt,Raw] = xlsread('Teros12.xlsx');
formatIn = 'dd/mm/yyyy HH:MM:SS';
Ti=datenum('24/06/2024 14:45:00',formatIn);
Tf=datenum('02/07/2024 10:40:00',formatIn);
x=Txt(5:end,1);
N=length(x);
for k=1:N;DD(k,1)=datenum(x(k,1),formatIn);end
%
%
figure
subplot(311)
plot(DD,A(:,1),'-r',DD,A(:,7),'-.k','LineWidth',1.5)
legend('z1=15 cm','z2=30 cm')
ylabel('WVC (m^3/m^3)')
ww=axis;ww(3:4)=[0.22 0.32];axis(ww);hold on
xticks=get(gca,'Xtick');
set(gca,'xticklabel',datestr(xticks,'mmm/DD'))
title('Sensor 1 (x1)')
pause(2)
%
%subplot(312)
%A(:,3) =1./A(:,3)*10;
%A(:,6) =1./A(:,6)*10;
%A(:,9) =1./A(:,9)*10;
%A(:,12)=1./A(:,12)*10;
%plot(DD,A(:,3),'-r',DD,A(:,9),'-k','LineWidth',1.5)
%ylabel('Resistivity (ohm.m)')
%xticks=get(gca,'Xtick');
%set(gca,'xticklabel',datestr(xticks,'mmm/DD'))
%
subplot(312)
plot(DD,A(:,2),'-r',DD,A(:,8),'-.k','LineWidth',1.5)
legend('z1=15 cm','z2=30 cm')
ylabel(['Soil Temperature (' char(176) 'C)'])
ww=axis;ww(3:4)=[15 28];axis(ww);
xticks=get(gca,'Xtick');
set(gca,'xticklabel',datestr(xticks,'mmm/DD'))
pause(2)
%
figure
subplot(311)
plot(DD,A(:,4),'-r',DD,A(:,10),'-.k','LineWidth',1.5)
legend('z2=15 cm','z2=30 cm')
ylabel('WVC (m^3/m^3)')
ww=axis;ww(3:4)=[0.22 0.32];axis(ww);hold on
xticks=get(gca,'Xtick');
set(gca,'xticklabel',datestr(xticks,'mmm/DD'))
title('Sensor 2 (x2)')
%
%subplot(312)
%A(:,3) =1./A(:,3)*10;
%A(:,6) =1./A(:,6)*10;
%A(:,9) =1./A(:,9)*10;
%A(:,12)=1./A(:,12)*10;
%plot(DD,A(:,6),'-r',DD,A(:,12),'-k','LineWidth',1.5)
%ylabel('Resistivity (ohm.m)')
%ww=axis;hold on
%xticks=get(gca,'Xtick');
%set(gca,'xticklabel',datestr(xticks,'mmm/DD'))
%
subplot(312)
plot(DD,A(:,5),'-r',DD,A(:,11),'-.k','LineWidth',1.5)
legend('z1=15 cm','z2=30 cm')
ylabel(['Soil Temperature (' char(176) 'C)'])
ww=axis;ww(3:4)=[15 28];axis(ww);
xticks=get(gca,'Xtick');
set(gca,'xticklabel',datestr(xticks,'mmm/DD'))
pause(2)

%
figure
subplot(311)
plot(DD,A(:,1),'-r',DD,A(:,7),'--r',DD,A(:,4),'-k',DD,A(:,10),'--k','LineWidth',1.5)
legend('z1=15 cm','z1=30 cm','z2=15 cm','z2=30 cm')
ylabel('WVC (m^3/m^3)')
ww=axis;ww(3:4)=[0.22 0.32];axis(ww);hold on
% plot([Ti Ti],ww(3:4),'-c',[Tf Tf],ww(3:4),'-c','LineWidth',1.5)
xticks=get(gca,'Xtick');
set(gca,'xticklabel',datestr(xticks,'mmm/DD'))
%
subplot(312)
A(:,3) =1./A(:,3)*10;
A(:,6) =1./A(:,6)*10;
A(:,9) =1./A(:,9)*10;
A(:,12)=1./A(:,12)*10;
plot(DD,A(:,3),'-r',DD,A(:,9),'--r',DD,A(:,6),'-k',DD,A(:,12),'--k','LineWidth',1.5)
legend('z1=15 cm','z1=30 cm','z2=15 cm','z2=30 cm')
ylabel('Resistivity (ohm.m)')
ww=axis;hold on
% semilogy([Ti Ti],ww(3:4),'-c',[Tf Tf],ww(3:4),'-c','LineWidth',1.5)
xticks=get(gca,'Xtick');
set(gca,'xticklabel',datestr(xticks,'mmm/DD'))
%
%
subplot(313)
plot(DD,A(:,2),'-r',DD,A(:,8),'--r',DD,A(:,5),'-k',DD,A(:,11),'--k','LineWidth',1.5)
legend('z1=15 cm','z2=15 cm','z1=30 cm','z2=30 cm')
ylabel(['Soil Temperature (' char(176) 'C)'])
ww=axis;ww(3:4)=[15 25];axis(ww);
% plot([Ti Ti],ww(3:4),'-c',[Tf Tf],ww(3:4),'-c','LineWidth',1.5)
xticks=get(gca,'Xtick');
set(gca,'xticklabel',datestr(xticks,'mmm/DD'))
