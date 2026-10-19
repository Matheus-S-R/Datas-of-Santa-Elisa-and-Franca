 function v=plota_PsdSec3(A,icol,Amin,Amax,Siz,Zf)

Np=length(A(:,1));

for k=1:Np

    cx=(A(k,2)+A(k,4))/2;

    cz=(A(k,4)-A(k,1))/2;

    Vc=RgbColor(A(k,icol),Amin,Amax);

    fill([cx-Siz cx+Siz cx+Siz cx-Siz],[cz-Siz cz-Siz cz+Siz cz+Siz],Vc,'EdgeColor',Vc);

    text(cx,cz,num2str(round(A(k,icol))));

    if k==1 hold on;end   

    plot(A(k,1:4),zeros(4,1),'vk','MarkerFaceColor','k')

end

hold off

ww=axis;axis([ww(1:2) 0 Zf]);

axis ij;axis image

v=1;

return



function Cout=RgbColor(Vin,Vmin,Vmax) 
% blue-cyan-green-yellow-red-magenta-white

Vc=[0 0 0.5;...      % azul escuro
    0 0 1;...        % azul
    0 1 1;...        % ciano
    0 1 0;... % verde
    0 1 1;...
    1 1 0;...        % amarelo
    1 0 0];        % vermelho

Nc=8;                % número de cores
dc=(Vmax-Vmin)/(Nc-1);
vv=Vmin:dc:Vmax;
Cout=[0 0 0];

for k=1:Nc-1
    if Vin >= vv(k) && Vin <= vv(k+1)  % <= para incluir o último valor
        vi=Vc(k,:);
        vf=Vc(k+1,:);
        cz=(Vin-vv(k))/dc;
        Cout=cz*vf + (1-cz)*vi;  % interpolação corrigida
    end
end