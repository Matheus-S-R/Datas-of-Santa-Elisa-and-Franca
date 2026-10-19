clear
a=1.0; % Size of cubes
A= readmatrix('linha1c.csv', 'Delimiter', ';');%L1
B= readmatrix('linha2c.csv', 'Delimiter', ';');%L2
C= readmatrix('l3.csv', 'Delimiter', ';');%L3
%    'Spa.1'    'Spa.2'    'Spa.3'    'Spa.4'    'Rho '    'Dev.'    ' M  '    'Sp  '    'Rs-Check'
%
figure 
zMx=4;
Np=length(A(:,1));
for k=1:Np
    ax=(A(k,2)+A(k,4))/2;ay=(A(k,4)-A(k,1))/2;
    bx=(B(k,2)+B(k,4))/2;by=(B(k,4)-B(k,1))/2;
    cx=(C(k,2)+C(k,4))/2;cy=(C(k,4)-C(k,1))/2;
    plot(ax,ay,'sk',bx,by,'or',cx,cy,'+b');
    if k==1 hold on;end
    %pause(1)    
end
hold off
ww=axis;axis([ww(1:2) 0 5]);axis ij;axis image
title('Checking whether the datasets have the same structure')
%
icol=5;rnge=1000;
%
%-----------------------------sections L1,L2,L3 rho-app
figure
colormap('jet')
rngL=140;rngH=500;
% subplots
subplot(311);
v1=plota_PsdSec3(A,icol,rngL,rngH,a/10,10);
title('L01');ylabel('Depth (m)')

subplot(312);
v2=plota_PsdSec3(B,icol,rngL,rngH,a/10,10);
title('L02');ylabel('Depth (m)')

subplot(313);
v3=plota_PsdSec3(C,icol,rngL,rngH,a/10,10);
title('L03');xlabel('Distance (m)');ylabel('Depth (m)')

% Colorbar 
cb= colorbar('Position', [0.75 0.15 0.02 0.7]);
xlabel(cb, 'Apparent resistivity (\Omega-m)');
clim([rngL, rngH]);
pause(2)

%
%--------------Difference between resistivity values (%)
rngeM=20;
BA1=A;BA1(:,icol)=B(:,icol)-A(:,icol);BA1(:,icol)=round(abs(100*[BA1(:,icol)./A(:,icol)]));
CA1=A;CA1(:,icol)=C(:,icol)-A(:,icol);CA1(:,icol)=round(abs(100*[CA1(:,icol)./A(:,icol)]));

B1=B.* 0.949;
C1=C.* 0.9298;
BA2=A;BA2(:,icol)=B1(:,icol)-A(:,icol);BA2(:,icol)=round(abs(100*[BA2(:,icol)./A(:,icol)]));
CA2=A;CA2(:,icol)=C1(:,icol)-A(:,icol);CA2(:,icol)=round(abs(100*[CA2(:,icol)./A(:,icol)]));
figure
colormap('jet')
subplot(221);v4=plota_PsdSec_oficial(BA1,icol,0,rngeM,a/10,10);title('');ylabel('Depth (m)')
subplot(223);v5=plota_PsdSec_oficial(CA1,icol,0,rngeM,a/10,10);title('');xlabel('Distance (m)');ylabel('Depth (m)')
subplot(222);v6=plota_PsdSec_oficial(BA2,icol,0,rngeM,a/10,10);title('');ylabel('Depth (m)')
subplot(224);v6_1=plota_PsdSec_oficial(CA2,icol,0,rngeM,a/10,10);title('');xlabel('Distance (m)');ylabel('Depth (m)')
% limits of colorbar
cb = colorbar('Position', [0.75 0.15 0.02 0.7]);
ylabel(cb, 'Difference between resistivity values (%)');
pause(2)

%-------------Experimental Error(%)
min=0;maax=20;
icol=6;
BA=B;BA(:,icol)=max(A(:,icol),B(:,icol));
CA=C;CA(:,icol)=max(A(:,icol),C(:,icol));
%AA=A;AA(:,icol)=max(A(:,icol),A(:,icol));
figure
colormap('jet')
%subplot(311);v6=plota_PsdSec(AA,icol,-rnge,rnge,a/10,10);title('Erro Experimental L1 (%)'); xlabel('Metros (m)');ylabel('Depth (m)')
subplot(312);v7=plota_PsdSec_oficial(BA,icol,min,maax,a/10,10);title('Experimental Error L2 (%)');ylabel('Depth (m)')
subplot(313);v8=plota_PsdSec_oficial(CA,icol,min,maax,a/10,10);title('Experimental Error L3 (%)');xlabel('Distance (m)');ylabel('Depth (m)')
clim([min,maax]);
cb = colorbar('Position', [0.75 0.15 0.02 0.5]);
ylabel(cb, 'Experimental Error (%)');

%--------------Standard Deviation
mini=1;maxi=50;
%CA2=A;CA2(:,icol)=C1(:,icol)-A(:,icol)
ba2=B;ba2(:,icol) = B(:, 5) .* (max(A(:, 6), B(:, 6)) / 100);
ca2=C;ca2(:,icol) = C(:, 5) .* (max(A(:, 6), C(:, 6)) / 100);
figure
colormap('jet')
subplot(312);v9=plota_PsdSec_oficial(ba2,icol,mini,maxi,a/10,10);title('Standard deviation L2');ylabel('Depth (m)')
subplot(313);v10=plota_PsdSec_oficial(ca2,icol,mini,maxi,a/10,10);title('Standard deviation L3');xlabel('Distance (m)');ylabel('Depth (m)')
caxis([mini,maxi]);
cb = colorbar('Position', [0.75 0.15 0.02 0.5]);
ylabel(cb, 'Standard deviation (\Omega-m)');

%------Difference of sections
BA_=B;BA_(:,icol)=B(:,icol)-A(:,icol);
CA_=C;CA_(:,icol)=C(:,icol)-A(:,icol);
figure
colormap('jet')
subplot(312);v11=plota_PsdSec_oficial(BA_,icol,-5,15,a/10,10);title('');ylabel('Depth (m)')
subplot(313);v12=plota_PsdSec_oficial(CA_,icol,-5,15,a/10,10);title('');xlabel('Distance (m)');ylabel('Depth (m)')
caxis([-5,15]);
cb1= colorbar('Position', [0.75 0.15 0.02 0.5]);
ylabel(cb1,'Difference between resistivity values (\Omega-m)');