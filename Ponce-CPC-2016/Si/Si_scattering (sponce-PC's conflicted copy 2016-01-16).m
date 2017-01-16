% Plot electronic bandstructure


SpecfunID = fopen('linewidth_20k20q_03.elself');
data = textscan(SpecfunID,'%f %f %f %f\n','CommentStyle','#','CollectOutput',true);
scattering_01 = cell2mat(data);
fclose(SpecfunID);
SpecfunID = fopen('linewidth_30k20q_03.elself');
data = textscan(SpecfunID,'%f %f %f %f\n','CommentStyle','#','CollectOutput',true);
scattering_02 = cell2mat(data);
fclose(SpecfunID);
% SpecfunID = fopen('linewidth_50k30q_05.elself');
% data = textscan(SpecfunID,'%f %f %f %f\n','CommentStyle','#','CollectOutput',true);
% scattering_03 = cell2mat(data);
% fclose(SpecfunID);
SpecfunID = fopen('linewidth_50k40q_03.elself');
data = textscan(SpecfunID,'%f %f %f %f\n','CommentStyle','#','CollectOutput',true);
scattering_04 = cell2mat(data);
fclose(SpecfunID);
SpecfunID = fopen('linewidth_50k40q_01.elself');
data = textscan(SpecfunID,'%f %f %f %f\n','CommentStyle','#','CollectOutput',true);
scattering_05 = cell2mat(data);
fclose(SpecfunID);
%SpecfunID = fopen('linewidth_50k40q_001_1K.elself');
%data = textscan(SpecfunID,'%f %f %f %f\n','CommentStyle','#','CollectOutput',true);
%scattering_06 = cell2mat(data);
%fclose(SpecfunID);
SpecfunID = fopen('linewidth_60k50q_01.elself');
data = textscan(SpecfunID,'%f %f %f %f\n','CommentStyle','#','CollectOutput',true);
scattering_07 = cell2mat(data);
fclose(SpecfunID);
% SpecfunID = fopen('linewidth_80k40q_001.elself');
% data = textscan(SpecfunID,'%f %f %f %f\n','CommentStyle','#','CollectOutput',true);
% scattering_08 = cell2mat(data);
% fclose(SpecfunID);
% SpecfunID = fopen('linewidth_80k60q_001.elself');
% data = textscan(SpecfunID,'%f %f %f %f\n','CommentStyle','#','CollectOutput',true);
% scattering_09 = cell2mat(data);
% fclose(SpecfunID);
% SpecfunID = fopen('linewidth_80k50000q_01.elself');
% data = textscan(SpecfunID,'%f %f %f %f\n','CommentStyle','#','CollectOutput',true);
% scattering_10 = cell2mat(data);
% fclose(SpecfunID);
SpecfunID = fopen('linewidth_50k40q_005.elself');
data = textscan(SpecfunID,'%f %f %f %f\n','CommentStyle','#','CollectOutput',true);
scattering_11 = cell2mat(data);
fclose(SpecfunID);
% SpecfunID = fopen('linewidth_50k40q_001.elself');
% data = textscan(SpecfunID,'%f %f %f %f\n','CommentStyle','#','CollectOutput',true);
% scattering_12 = cell2mat(data);
% fclose(SpecfunID);



size = 16

% CBM = 6.7531
fermi_coarse = 6.2988; % eV
fermi = 6.309719;
ry2ev = 13.605698066 ;
meV2ps = 4.13567;

% scattering = 2pi/hbar in meV ps
%meV2ps = 2*pi/0.6582119514
meV2ps = 2/0.6582119514

CBM = 6.6624


scattering_01(:,3) = scattering_01(:,3)-(CBM-fermi);
scattering_01(:,4) = (scattering_01(:,4)*meV2ps); %goes from meV to ps-1
scattering_02(:,3) = scattering_02(:,3)-(CBM-fermi);
scattering_02(:,4) = (scattering_02(:,4)*meV2ps); %goes from meV to ps-1
%scattering_03(:,3) = scattering_03(:,3)-(CBM-fermi);
%scattering_03(:,4) = (scattering_03(:,4)*meV2ps); %goes from meV to ps-1
scattering_04(:,3) = scattering_04(:,3)-(CBM-fermi);
scattering_04(:,4) = (scattering_04(:,4)*meV2ps); %goes from meV to ps-1
scattering_05(:,3) = scattering_05(:,3)-(CBM-fermi);
scattering_05(:,4) = (scattering_05(:,4)*meV2ps); %goes from meV to ps-1
% scattering_06(:,3) = scattering_06(:,3)-(CBM-fermi);
% scattering_06(:,4) = (scattering_06(:,4)*meV2ps); %goes from meV to ps-1
scattering_07(:,3) = scattering_07(:,3)-(CBM-fermi);
scattering_07(:,4) = (scattering_07(:,4)*meV2ps); %goes from meV to ps-1
% scattering_08(:,3) = scattering_08(:,3)-(CBM-fermi);
% scattering_08(:,4) = (scattering_08(:,4)*meV2ps); %goes from meV to ps-1
% scattering_09(:,3) = scattering_09(:,3)-(CBM-fermi);
% scattering_09(:,4) = (scattering_09(:,4)*meV2ps); %goes from meV to ps-1
% scattering_10(:,3) = scattering_10(:,3)-(CBM-fermi);
% scattering_10(:,4) = (scattering_10(:,4)*meV2ps); %goes from meV to ps-1
scattering_11(:,3) = scattering_11(:,3)-(CBM-fermi);
scattering_11(:,4) = (scattering_11(:,4)*meV2ps); %goes from meV to ps-1
% scattering_12(:,3) = scattering_12(:,3)-(CBM-fermi);
% scattering_12(:,4) = (scattering_12(:,4)*meV2ps); %goes from meV to ps-1


figure
%semilogy(scattering_01(:,3),scattering_01(:,4),'r.','markersize', 20);
%hold on;
semilogy(scattering_02(:,3),scattering_02(:,4),'y.','markersize', 20);
hold on;
%semilogy(scattering_03(:,3),scattering_03(:,4),'r.','markersize', 20);
%hold on;
semilogy(scattering_04(:,3),scattering_04(:,4),'b.','markersize', 20);
hold on;
semilogy(scattering_05(:,3),scattering_05(:,4),'g.','markersize', 20);
hold on;
%semilogy(scattering_06(:,3),scattering_06(:,4),'k.','markersize', 20);
%hold on;
semilogy(scattering_07(:,3),scattering_07(:,4),'k.','markersize', 20);
hold on;
%semilogy(scattering_08(:,3),scattering_08(:,4),'r.','markersize', 20);
%hold on;
%semilogy(scattering_09(:,3),scattering_09(:,4),'b.','markersize', 20);
%hold on;
% semilogy(scattering_10(:,3),scattering_10(:,4),'k.','markersize', 20);
% hold on;
semilogy(scattering_11(:,3),scattering_11(:,4),'r.','markersize', 20);
hold on;
% semilogy(scattering_12(:,3),scattering_12(:,4),'y.','markersize', 20);
% hold on;




axis([0,0.2,0.1,30]) % change axis limit

ylabel('Scattering rate (1/ps)','FontSize',size);
xlabel('Electron energy (eV)','FontSize',size);



% figure('Units', 'pixels', ...
%     'Position', [100 100 1300 650]);

%set(gcf, 'PaperPositionMode', 'auto');
%print -depsc2 Si_scattering.eps
%print('Si_scattering','-dpng')
%close;

