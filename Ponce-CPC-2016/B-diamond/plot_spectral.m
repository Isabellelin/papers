% Plot spectral function
LASTN = maxNumCompThreads(1); 

figure('Units', 'pixels', ...
    'Position', [100 100 1400 675]);
hold on;

size = 16

h(1) = subplot(4,1,1);
SpecfunID = fopen('specfun-1000000q-rnd-0.01-1K');
data = textscan(SpecfunID,'%f %f %f\n','CommentStyle','#','CollectOutput',true);
A_all = cell2mat(data);
fclose(SpecfunID);

SpecfunID = fopen('specfun_sup-1000000q-rnd-0.01-1K');
data = textscan(SpecfunID,'%f %f %f %f %f %f\n','CommentStyle','#','CollectOutput',true);
A_sup = cell2mat(data);
fclose(SpecfunID);


X1 = linspace(0,0.43333333,251);
X2 = linspace(0.43333333,1,250);
X = [X1,X2];
Y = linspace(-4,1,1000);
Z = zeros(length(Y),length(X));

for i=1:length(X),
    for j=1:length(Y),
        Z(j,i)= A_all(i*length(Y)+j-length(Y),3);
    end 
end
        
%size(Z);

surf(X, Y, Z,'EdgeColor', 'None', 'facecolor', 'interp');
%colorbar;
hold on;
%%%%%%%%%
% KS BS %
%%%%%%%%%

eigen = zeros(length(X),3); % 3 bands
for i=1:3,
    for j=1:length(X),
        for k=1:length(Y),
           eigen(j,i)= A_sup(i*length(X)*length(Y)+j*length(Y)+-length(X)*length(Y)-length(Y)+k,3);
        end
    end
end

rcol = [1,1,1]; %[255,0,0]/255; % a red color
whiteC = [1,1,1];

z_max = max(max(Z));

plot3(X,eigen(:,1),z_max*ones(length(X)),'Color',rcol,'LineWidth',2);
plot3(X,eigen(:,2),z_max*ones(length(X)),'Color',rcol,'LineWidth',2);
plot3(X,eigen(:,3),z_max*ones(length(X)),'Color',rcol,'LineWidth',2);

% Now plot horizontal line to show Fermi level
vert = zeros(length(X));
plot3(X,vert,z_max*ones(length(X)),'Color',whiteC,'LineWidth',2, 'LineStyle', '--');
% Now plotvertical line at Gamma
horizontal = 0.433333*ones(length(Y));
plot3(horizontal,Y,z_max*ones(length(Y)),'Color',whiteC,'LineWidth',2, 'LineStyle', '--');

axis([0.259998,0.60333301,-0.3,0.65]); % change axis limit

ylabel('\omega (eV)','FontSize',size);


ax = gca;
set(gca,'FontSize',size)
ax.XTick = [0.259998 0.4333333 0.60333301];
ax.XTickLabel = {'0.2L','\Gamma','0.15X','FontSize',size};

view(2);

%title('Spectral function of B-doped diamond (meV^{-1})','FontSize',14)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
h(2) = subplot(4,1,2);
SpecfunID = fopen('specfun-1000000q-rnd-0.05-1K');
data = textscan(SpecfunID,'%f %f %f\n','CommentStyle','#','CollectOutput',true);
A_all = cell2mat(data);
fclose(SpecfunID);
SpecfunID = fopen('specfun_sup-1000000q-rnd-0.05-1K');
data = textscan(SpecfunID,'%f %f %f %f %f %f\n','CommentStyle','#','CollectOutput',true);
A_sup = cell2mat(data);
fclose(SpecfunID);

for i=1:length(X),
    for j=1:length(Y),
        Z(j,i)= A_all(i*length(Y)+j-length(Y),3);
    end 
end
surf(X, Y, Z,'EdgeColor', 'None', 'facecolor', 'interp');
%colorbar;
hold on;

for i=1:3,
    for j=1:length(X),
        for k=1:length(Y),
           eigen(j,i)= A_sup(i*length(X)*length(Y)+j*length(Y)+-length(X)*length(Y)-length(Y)+k,3);
        end
    end
end
plot3(X,eigen(:,1),z_max*ones(length(X)),'Color',rcol,'LineWidth',2);
plot3(X,eigen(:,2),z_max*ones(length(X)),'Color',rcol,'LineWidth',2);
plot3(X,eigen(:,3),z_max*ones(length(X)),'Color',rcol,'LineWidth',2);
plot3(X,vert,z_max*ones(length(X)),'Color',whiteC,'LineWidth',2, 'LineStyle', '--');
plot3(horizontal,Y,z_max*ones(length(Y)),'Color',whiteC,'LineWidth',2, 'LineStyle', '--');

axis([0.259998,0.60333301,-0.3,0.65]); % change axis limit
ylabel('\omega (eV)','FontSize',size);

ax = gca;
set(gca,'FontSize',size)
ax.XTick = [0.259998 0.4333333 0.60333301];
ax.XTickLabel = {'0.2L','\Gamma','0.2X','FontSize',size};
view(2);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
h(3) = subplot(4,1,3);
SpecfunID = fopen('specfun-1000000q-rnd-0.01-300K');
data = textscan(SpecfunID,'%f %f %f\n','CommentStyle','#','CollectOutput',true);
A_all = cell2mat(data);
fclose(SpecfunID);
SpecfunID = fopen('specfun_sup-1000000q-rnd-0.01-300K');
data = textscan(SpecfunID,'%f %f %f %f %f %f\n','CommentStyle','#','CollectOutput',true);
A_sup = cell2mat(data);
fclose(SpecfunID);

for i=1:length(X),
    for j=1:length(Y),
        Z(j,i)= A_all(i*length(Y)+j-length(Y),3);
    end 
end
surf(X, Y, Z,'EdgeColor', 'None', 'facecolor', 'interp');
%colorbar;
hold on;

for i=1:3,
    for j=1:length(X),
        for k=1:length(Y),
           eigen(j,i)= A_sup(i*length(X)*length(Y)+j*length(Y)+-length(X)*length(Y)-length(Y)+k,3);
        end
    end
end
plot3(X,eigen(:,1),z_max*ones(length(X)),'Color',rcol,'LineWidth',2);
plot3(X,eigen(:,2),z_max*ones(length(X)),'Color',rcol,'LineWidth',2);
plot3(X,eigen(:,3),z_max*ones(length(X)),'Color',rcol,'LineWidth',2);
plot3(X,vert,z_max*ones(length(X)),'Color',whiteC,'LineWidth',2, 'LineStyle', '--');
plot3(horizontal,Y,z_max*ones(length(Y)),'Color',whiteC,'LineWidth',2, 'LineStyle', '--');

axis([0.259998,0.60333301,-0.3,0.65]); % change axis limit
ylabel('\omega (eV)','FontSize',size);

ax = gca;
set(gca,'FontSize',size)
ax.XTick = [0.259998 0.4333333 0.60333301];
ax.XTickLabel = {'0.2L','\Gamma','0.2X','FontSize',size};
view(2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
h(4) = subplot(4,1,4);
SpecfunID = fopen('specfun-1000000q-rnd-0.05-300K');
data = textscan(SpecfunID,'%f %f %f\n','CommentStyle','#','CollectOutput',true);
A_all = cell2mat(data);
fclose(SpecfunID);
SpecfunID = fopen('specfun_sup-1000000q-rnd-0.05-300K');
data = textscan(SpecfunID,'%f %f %f %f %f %f\n','CommentStyle','#','CollectOutput',true);
A_sup = cell2mat(data);
fclose(SpecfunID);

for i=1:length(X),
    for j=1:length(Y),
        Z(j,i)= A_all(i*length(Y)+j-length(Y),3);
    end 
end
surf(X, Y, Z,'EdgeColor', 'None', 'facecolor', 'interp');
%colorbar;
hold on;

for i=1:3,
    for j=1:length(X),
        for k=1:length(Y),
           eigen(j,i)= A_sup(i*length(X)*length(Y)+j*length(Y)+-length(X)*length(Y)-length(Y)+k,3);
        end
    end
end
plot3(X,eigen(:,1),z_max*ones(length(X)),'Color',rcol,'LineWidth',2);
plot3(X,eigen(:,2),z_max*ones(length(X)),'Color',rcol,'LineWidth',2);
plot3(X,eigen(:,3),z_max*ones(length(X)),'Color',rcol,'LineWidth',2);
plot3(X,vert,z_max*ones(length(X)),'Color',whiteC,'LineWidth',2, 'LineStyle', '--');
plot3(horizontal,Y,z_max*ones(length(Y)),'Color',whiteC,'LineWidth',2, 'LineStyle', '--');

axis([0.259998,0.60333301,-0.3,0.65]); % change axis limit
ylabel('$A_{n\mathbf{k}}(\omega,T)$','FontSize',size','Interpreter','latex')

ax = gca;
set(gca,'FontSize',size)
ax.XTick = [0.259998 0.4333333 0.60333301];
ax.XTickLabel = {'0.2L','\Gamma','0.15X','FontSize',size};
view(2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



annotation('textbox',...
    [0.685 0.88 0.1 0.1],...
    'String',{'T = 1 K ','i\delta = 10 meV'},...
    'FontSize',size,...
    'FontName','Arial',...
    'LineStyle','-',...
    'EdgeColor',[0 0 0],...
    'LineWidth',1,...
    'BackgroundColor',[0.9  0.9 0.9],...
    'Color',[0 0 0]);

annotation('textbox',...
    [0.685 0.64 0.1 0.1],...
    'String',{'T = 1 K ','i\delta = 50 meV'},...
    'FontSize',size,...
    'FontName','Arial',...
    'LineStyle','-',...
    'EdgeColor',[0 0 0],...
    'LineWidth',1,...
    'BackgroundColor',[0.9  0.9 0.9],...
    'Color',[0 0 0]);

annotation('textbox',...
    [0.685 0.4 0.1 0.1],...
    'String',{'T = 300 K ','i\delta = 10 meV'},...
    'FontSize',size,...
    'FontName','Arial',...
    'LineStyle','-',...
    'EdgeColor',[0 0 0],...
    'LineWidth',1,...
    'BackgroundColor',[0.9  0.9 0.9],...
    'Color',[0 0 0]);

annotation('textbox',...
    [0.685 0.16 0.1 0.1],...
    'String',{'T = 300 K ','i\delta = 50 meV'},...
    'FontSize',size,...
    'FontName','Arial',...
    'LineStyle','-',...
    'EdgeColor',[0 0 0],...
    'LineWidth',1,...
    'BackgroundColor',[0.9  0.9 0.9],...
    'Color',[0 0 0]);




pos1 = get(h(1),'Position');
pos2 = get(h(2),'Position');
pos3 = get(h(3),'Position');
pos4 = get(h(4),'Position');

pos1(4) = 0.23;
set(h(1),'Position',pos1);
pos2(4) = 0.23;
set(h(2),'Position',pos2);
pos3(4) = 0.23;
set(h(3),'Position',pos3);
pos4(4) = 0.23;
set(h(4),'Position',pos4);

set(h(1),'XTickLabel','');
pos2(2) = pos1(2) - pos2(4)-0.01;
set(h(2),'Position',pos2);
set(h(2),'XTickLabel','');
pos3(2) = pos2(2) - pos3(4)-0.01;
set(h(3),'Position',pos3);
set(h(3),'XTickLabel','');
pos4(2) = pos3(2) - pos4(4)-0.01;
set(h(4),'Position',pos4);


colormap hot;
B=colorbar;
set(B, 'Position', [0.8 0.05 0.03 0.945]);
for i=1:4
pos=get(h(i), 'Position');
axes(h(i));
set(h(i), 'Position', [pos(1) pos(2) .6626 pos(4)]);
end 

% set(gcf, 'PaperPositionMode', 'auto');
% print('C_spectral5','-svg');

set(gcf, 'PaperPositionMode', 'auto');
print -depsc2 C_spectral.eps ;
%print('C_spectral','-dpng');
close;

