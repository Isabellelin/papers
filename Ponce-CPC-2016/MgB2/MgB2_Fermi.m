% Plot a2F

%  figure('Units', 'pixels', ...
%      'Position', [100 100 1300 950]);

SpecfunID = fopen('MgB2.imag_aniso_gap_FS_15.00');
data = textscan(SpecfunID,'%f %f %f %f %f %f\n','CommentStyle','#','CollectOutput',true);
BS = cell2mat(data);
fclose(SpecfunID);

x1=[];
y1=[];
z1=[];
d1=[];
x2=[];
y2=[];
z2=[];
d2=[];

for ii = 1:length(BS(:,1))
    % First band
    if (BS(ii,4)) == 1
        x1 = [x1 BS(ii,1)];
        y1 = [y1 BS(ii,2)];
        z1 = [z1 BS(ii,3)];
        d1 = [d1 BS(ii,6)];
    end
    if BS(ii,4) == 2
        x2 = [x2 BS(ii,1)];
        y2 = [y2 BS(ii,2)];
        z2 = [z2 BS(ii,3)];
        d2 = [d2 BS(ii,6)];
    end
end


x = rand(100,1)*16 - 8;
y = rand(100,1)*16 - 8;
z = rand(100,1)*16 - 8;
d = rand(100,1)*16 - 8;

% 
% S = scatteredInterpolant(x,y,z);
% xrange = linspace(min(x), max(x), 1000);
% yrange = linspace(min(y), max(y), 1000);
% [xq, yq] = meshgrid(xrange, yrange);
% znew = S(xq,yq);
% S = scatteredInterpolant(x,y,z,d);
% dnew = S(xq, yq, znew);
% h = surf(xq, yq, znew,'CData', dnew);
% set(h,'LineStyle','none')

%scatterinterpolate requires columns format
x1 = transpose(x1);
y1 = transpose(y1);
z1 = transpose(z1);
d1 = transpose(d1);

% First interpolate for z
S = scatteredInterpolant(x1,y1,z1);

xrange = linspace(min(x1), max(x1), 1000);
yrange = linspace(min(y1), max(y1), 1000);

[xq, yq] = meshgrid(xrange, yrange);

% These are now the interpolated z values (height of surface)
znew = S(xq,yq);

% Now we want to use x,y,z to interpolate d at the new grid points
S = scatteredInterpolant(x1,y1,z1,d1);

% Interpolate d at the new points
dnew = S(xq, yq, znew);

h = surf(xq, yq, znew, 'CData', dnew);
set(h,'LineStyle','none')

% WORKS
%Scatter3, size 5, color based on zz
% scatter3(x1,y1,z1,5,d1);
% 
% % colomap and bar
% colormap(jet);
% colorbar;

%%%%%%%%%%%%%%%%%%%%%%%%

% figure

% Scatter3, size 5, color based on zz
% scatter3(x2,y2,z2,5,d2);
% 
% % colomap and bar
% colormap(jet);
% colorbar;

% xlin = linspace(min(x),max(x),50);
% ylin = linspace(min(y),max(y),50);
% zlin = linspace(min(z),max(z),50);
% 
% [X,Y,Z] = meshgrid(xlin,ylin,zlin);
% 
% vq = griddata(x,y,z,d,X,Y,Z,'natural');
% 
% surf(X,Y,vq);



%plot3(x,y,z,'.','MarkerSize',5);


%scatter3(BS(:,1),BS(:,2),BS(:,3),BS(:,6))






% 25x25x25 
% 
% size = 16
% cm2mev = 0.12398 ;
% Thz2meV = 4.13567;
% ry2ev = 13.605698066 ;
% 
% surface = zeros(2605*6);
% 
% jj = 1
% for kk = 1:2605
%   for ii = 1:6
%     surface(jj) = BS(kk,ii);
%     jj = jj+ 1;  
%   end
% end  
% mesh(surface)

%%%%%%%%%
% KS BS %
%%%%%%%%%
%h(1) =subplot(2,2,1)
% plot(BS(:,1),BS(:,2),'Color','blue','LineWidth',2);
% hold on;



% 
% h=gcf
% set(h, 'PaperPositionMode', 'auto');
% set(h,'PaperOrientation','landscape');
% set(h,'Position',[100 100 1200 650]);
% print(h, '-dpdf', 'MgB2_Fermi.pdf')


