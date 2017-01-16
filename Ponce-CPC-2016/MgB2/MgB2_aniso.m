% Plot anisotropic superconducting gaps

%  figure('Units', 'pixels', ...
%      'Position', [100 100 600 800]);

SpecfunID = fopen('MgB2.imag_aniso_10.00-0.01');
data = textscan(SpecfunID,'%f %f \n','CommentStyle','#','CollectOutput',true);
gap10 = cell2mat(data);
fclose(SpecfunID);
SpecfunID = fopen('MgB2.imag_aniso_37.78-0.01');
data = textscan(SpecfunID,'%f %f \n','CommentStyle','#','CollectOutput',true);
gap37 = cell2mat(data);
fclose(SpecfunID);
SpecfunID = fopen('MgB2.imag_aniso_43.33-0.01');
data = textscan(SpecfunID,'%f %f \n','CommentStyle','#','CollectOutput',true);
gap43 = cell2mat(data);
fclose(SpecfunID);




size = 16
tick = 3

cm2mev = 0.12398 ;
Thz2meV = 4.13567;
ry2ev = 13.605698066 ;
meV2ry = (1.0/(ry2ev*1000))


h(1) =subplot(2,1,1)

hold on;
plot(NaN,'b.','markersize', 30);
plot(NaN,'g.','markersize', 30);
plot(NaN,'r.','markersize', 30);
legend('10K','38K','43K');

plot(gap10(:,1)*1000,gap10(:,2)*1000,'ob','MarkerSize',3,'MarkerFaceColor','b');
hold on;
plot(gap37(:,1)*1000,gap37(:,2)*1000,'og','MarkerSize',3,'MarkerFaceColor','g');
hold on;
plot(gap43(:,1)*1000,gap43(:,2)*1000,'or','MarkerSize',3,'MarkerFaceColor','r');
hold on;


axis([0,200,-2,10]) % change axis limit



ylabel('\Delta_{n\bf{k}}(i\omega) (meV)','FontSize',size);


ax = gca;
set(gca,'FontSize',size, 'LineWidth',tick);
set(gca, 'Layer','top');
ax.XTick = [0 20 40 60 80 100 120 140 160 180 200];


h(2) =subplot(2,1,2)

SpecfunID = fopen('MgB2.pade_aniso_10.00-0.01');
data = textscan(SpecfunID,'%f %f \n','CommentStyle','#','CollectOutput',true);
gap10 = cell2mat(data);
fclose(SpecfunID);
SpecfunID = fopen('MgB2.pade_aniso_37.78-0.01');
data = textscan(SpecfunID,'%f %f \n','CommentStyle','#','CollectOutput',true);
gap37 = cell2mat(data);
fclose(SpecfunID);
SpecfunID = fopen('MgB2.pade_aniso_43.33-0.01');
data = textscan(SpecfunID,'%f %f \n','CommentStyle','#','CollectOutput',true);
gap43 = cell2mat(data);
fclose(SpecfunID);

hold on;
plot(NaN,'b.','markersize', 30);
plot(NaN,'g.','markersize', 30);
plot(NaN,'r.','markersize', 30);
legend('10K','38K','43K');


plot(gap10(:,1)*1000,gap10(:,2)*1000,'ob','MarkerSize',3,'MarkerFaceColor','b');
hold on;
plot(gap37(:,1)*1000,gap37(:,2)*1000,'og','MarkerSize',3,'MarkerFaceColor','g');
hold on;
plot(gap43(:,1)*1000,gap43(:,2)*1000,'or','MarkerSize',3,'MarkerFaceColor','r');
hold on;


% now print \omega=\delta(omega) line

x=[0,5,10,15,20];
y=[0,5,10,15,20];

plot(x,y,'--k','LineWidth',tick)
text(14,23,'\omega = \Delta_{n\bf{k}}(\omega)','FontSize',size)

axis([0,200,-20,35]) % change axis limit

xlabel('\omega (meV)','FontSize',size);
ylabel('\Delta_{n\bf{k}}(\omega) (meV)','FontSize',size);


set(h, 'box', 'off');

pos1 = get(h(1),'Position');
pos2 = get(h(2),'Position');

set(h(1),'XTickLabel','');

pos2(2) = pos1(2) - pos2(4) - 0.03;
set(h(2),'Position',pos2);

 text(pos1(1)+5,pos1(3)-1.5,['(',char(1+96),') '],...
     'color','k','fontw','b','FontSize',size,'Parent', h(1));
 text(pos2(1)+5,pos2(3)-15,['(',char(2+96),') '],...
     'color','k','fontw','b','FontSize',size,'Parent', h(2));


ax = gca;
set(gca,'FontSize',size, 'LineWidth',tick);
set(gca, 'Layer','top');
ax.XTick = [0 20 40 60 80 100 120 140 160 180 200];

%pbaspect([ratio1 ratio2 1])
% 
box off
axes('Position',pos1,'xlim', [0 200], 'ylim', [-2 10], 'color', 'none',...
'YTick',[-2 0 2 4 6 8 10],'YTickLabel',[],'LineWidth',tick,'YAxisLocation','right',...
'XTick',[0 20 40 60 80 100 120 140 160 180 200],...
'XTickLabel',[],'LineWidth',tick,'XAxisLocation','top')
axes('Position',pos2,'xlim', [0 200], 'ylim', [-20 35], 'color', 'none',...
'YTick',[-20 -10 0 10 20],'YTickLabel',[],'LineWidth',tick,'YAxisLocation','right',...
'XTick',[0 20 40 60 80 100 120 140 160 180 200],...
'XTickLabel',[],'LineWidth',tick,'XAxisLocation','top')



h=gcf
set(h, 'PaperPositionMode', 'auto');
%set(h,'PaperOrientation','landscape');
set(h,'Position',[100 100 600 800]);
print(h,'MgB2_aniso.png', '-dpng', '-r300');
%saveas(h,'MgB2_aniso.png')
%system('pdfcrop MgB2_aniso.pdf MgB2_aniso.pdf');


