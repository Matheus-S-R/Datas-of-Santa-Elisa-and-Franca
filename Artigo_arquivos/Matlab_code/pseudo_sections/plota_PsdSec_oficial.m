function v=plota_PsdSec_oficial(A,icol,Amin,Amax,Siz,Zf)
Np=length(A(:,1));

% Configurar a escala de cores DO MATLAB para Jet
caxis([Amin, Amax]);

for k=1:Np
    %cx=(A(k,4)+A(k,1))/2;
    cx=(A(k,2)+A(k,4))/2;
    cz=(A(k,4)-A(k,1))/2;
    
    % Usar o sistema de cores do MATLAB com paleta Jet
    normalized_value = (A(k,icol) - Amin) / (Amax - Amin);
    normalized_value = max(0, min(1, normalized_value));  % Limitar entre 0-1
    
    % Obter cor da paleta Jet
    jet_map = jet(9);  
    color_idx = round(1 + normalized_value * 8);
    Vc = jet_map(color_idx, :);
    
    fill([cx-Siz cx+Siz cx+Siz cx-Siz],[cz-Siz cz-Siz cz+Siz cz+Siz],Vc,'EdgeColor',Vc);
    text(cx,cz,num2str(round(A(k,icol))));
    if k==1 
        hold on;
    end   
    plot(A(k,1:4),zeros(4,1),'vk','MarkerFaceColor','k')
end
hold off
ww=axis;axis([ww(1:2) 0 Zf]);
axis ij;axis image

% Manter a escala de cores configurada
caxis([Amin, Amax]);

v=1;
return