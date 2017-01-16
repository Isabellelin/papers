% a2F of Lead
LASTN = maxNumCompThreads(1) 

figure('Units', 'pixels', ...
    'Position', [100 100 1200 1000]);
hold on;

% Phonon smearing = 0.15 meV
% Electron smearing = 50 meV

% Pb u
col10 = [190,190,190]/255;
col11 = [96,96,96]/255;
col12 = [0,0,0];

%Pb +SO
col20 = [255,160,160]/255;
col21 = [255,100,100]/255;
col22 = [1,0,0];


col0 = [208,209,230]/255;
col1 = [166,189,219]/255;
col2 = [116,169,207]/255;
col3 = [43,140,190]/255;
col4 = [4,90,141]/255;
col5 = [0,0,1];
col6 = [0,0,0];


h(2) = subplot(4,2,2);

kpoints1 = [ 40^3,   60^3,  70^3,  80^3,  90^3, 100^3 ]; 
lambda1 = [  1.90520  , 1.1919, 1.246, 1.346,1.1796, 1.1146];% 27000 q-points
%lambda1 = [1.396, 1.905, 0.823,1.588, 1.180, 1.206, 1.002, 1.033];% 27000 q-points
kpoints21 = [ 40^3,   50^3,  60^3,  70^3,  80^3 ]; 
lambda21 = [ 4.028,  1.904, 1.6851, 2.0875, 2.238];% 27000 q-points

kpoints2 = [40^3,  60^3,  70^3,  80^3,  90^3, 100^3]; 
lambda2 = [ 1.32469 ,   1.4929,1.1637,1.1404,1.1973, 0.98923];% 64000 q-points
%lambda2 = [1.672, 1.324, 0.943, 1.493, 1.1864, 1.0414, 1.0713, 0.9629];% 64000 q-points
kpoints22 = [ 40^3,   50^3,  60^3,  70^3,  80^3 ]; 
lambda22 = [ 1.4208,  2.079, 2.4708, 0, 0];

kpoints3 = [40^3,  60^3,  70^3,  80^3,  90^3, 100^3]; 
lambda3 = [  2.0397209,   1.5720,1.2373, 1.335,1.3133, 1.17325];% 125000 q-points
%lambda3 = [1.759, 2.040, 1.112,1.572,  1.1921, 1.1587, 1.1929, 1.1553 ];% 125000 q-points
kpoints23 = [  50^3, 70^3]; 
lambda23 = [  1.628, 0]


plot(kpoints1,lambda1,'Color',col10);
hold on;
s1 = scatter(kpoints1,lambda1,50,'filled','MarkerFaceColor',col10);
hold on;
plot(kpoints21,lambda21,'Color',col20);
hold on;
s1 = scatter(kpoints21,lambda21,50,'filled','MarkerFaceColor',col20);
hold on;


plot(kpoints2,lambda2,'Color',col11);
hold on;
s2 = scatter(kpoints2,lambda2,50,'filled','MarkerFaceColor',col11);
hold on;
plot(kpoints22,lambda22,'Color',col21);
hold on;
s2 = scatter(kpoints22,lambda22,50,'filled','MarkerFaceColor',col21);
hold on;


plot(kpoints3,lambda3,'Color',col12);
s3 = scatter(kpoints3,lambda3,50,'filled','MarkerFaceColor',col12);
plot(kpoints23,lambda23,'Color',col22);
s3 = scatter(kpoints23,lambda23,50,'filled','MarkerFaceColor',col22);

legend([s1,s2,s3],'2.7\cdot10^4 q','6.4\cdot10^4 q','1.25\cdot10^5 q',... 
'Location','northEast')

set(legend,'FontSize',10);
legend boxoff

axis([0,1000000,0.5,3.0])

ylabel('\lambda','FontSize',14);
set(gca,'YAxisLocation','right','FontSize',14);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5

h(1) = subplot(4,2,1);
% 
% SpecfunID = fopen('30k_30q_hom');
% data = textscan(SpecfunID,'%f %f %f %f %f %f %f %f %f %f %f\n','CommentStyle','#','CollectOutput',true);
% a2F = cell2mat(data);
% fclose(SpecfunID);
% plot(a2F(:,1),a2F(:,4),'--','Color',col1,'LineWidth',1);
% hold on;
% 
% SpecfunID = fopen('30k_60q_hom');
% data = textscan(SpecfunID,'%f %f %f %f %f %f %f %f %f %f %f\n','CommentStyle','#','CollectOutput',true);
% a2F = cell2mat(data);
% fclose(SpecfunID);
% s1 = plot(a2F(:,1),a2F(:,4),'-','Color',col1,'LineWidth',1);
% hold on;


SpecfunID = fopen('50k_50q_SO_hom');
data = textscan(SpecfunID,'%f %f %f %f %f %f %f %f %f %f %f\n','CommentStyle','#','CollectOutput',true);
a2F = cell2mat(data);
fclose(SpecfunID);
s3 = plot(a2F(:,1),a2F(:,4),'-','Color',col21,'LineWidth',1);
hold on;


SpecfunID = fopen('70k_30q_hom');
data = textscan(SpecfunID,'%f %f %f %f %f %f %f %f %f %f %f\n','CommentStyle','#','CollectOutput',true);
a2F = cell2mat(data);
fclose(SpecfunID);
s4 = plot(a2F(:,1),a2F(:,4),'-','Color',col11,'LineWidth',1);
hold on;

%%%%%%%%%%%%%%%%
% Experimental %
%%%%%%%%%%%%%%%%
% The a2F pb data are from McMillan in Superconductivity Parks 1969
% and are from tunneling experiment. The a2F is obtained by fitting 
% Electronic density of states of Pb divided by BCS density of states
% The experiment is made at 1K so that T/Tc = 0.15

SpecfunID = fopen('xyscan_a2F_Pb_Parks1969.txt');
data = textscan(SpecfunID,'%f %f %f %f %f %f\n','CommentStyle','#','CollectOutput',true);
exp = cell2mat(data);
fclose(SpecfunID);
s5 = plot(exp(:,1),exp(:,2),'.', 'markersize',15,'Color','black' );


legend([s4,s5],'2.16\cdot10^5 k',...
'exp','Location','northwest')

set(legend,'FontSize',10);

legend boxoff
set(gca,'FontSize',14);
set(gca,'ytick',[1,2])
axis([0,10,0,2])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



h(4) = subplot(4,2,4);

kpoints1 = [30^3,40^3,50^3,60^3]; 
%lambda1 = [1.803, 2.106, 0.874,1.572];% 30000 q-points
lambda1 = [0, 0, 0,0];% 30000 q-points
kpoints2 = [30^3,40^3,50^3,60^3]; 
lambda2 = [0, 0, 0, 0];% 40000 q-points
kpoints3 = [30^3]; 
lambda3 = [0];% 50000 q-points
kpoints4 = [70^3,80^3];  
lambda4 = [ 0, 0];% 1500000 q-points
kpoints5 = [70^3,80^3]; 
lambda5 = [0,  0];% 2000000 q-points


%%%%%%%%

kpoints1 = [150000,200000,300000,400000,500000];
lambda1 = [1.75456, 1.7586173, 1.5994359, 1.6378, 1.6840 ];

% ----- Sobol k / Random q ------
% 0 Kelvin
% WITH SO
% 10 meV broadening
% 150000k Sobol/ 50000 : 1.7456    | 1.7456
%              / 50000 : 1.76169   | 1.75369
%              / 50000 : 1.7562477 | 1.75456
% 200000k Sobol/ 50000 : 1.7551155 | 1.7551155
%              / 50000 : 1.7586171 | 1.756866
%              / 50000 : 1.7621193 | 1.7586173
% 300000k Sobol/ 50000 : 1.5979625 | 1.5979625
%              / 50000 : 1.5980701 | 1.5980163
%              / 50000 : 1.6022752 | 1.5994359
% 400000k Sobol/ 50000 : 1.6377910 | 1.6377910 ( 50q)
%              / 50000 : 1.6395021 | 1.6386   (100q)
%              / 50000 : 1.6360996 | 1.6378   (150q) 
% 500000k Sobol/ 25000 : 1.6729995 | 1.6729995  ( 25q)
%              / 25000 : 1.6949476 | 1.6840     ( 50q)

kpoints2 = [150000,200000,300000,400000,500000];
lambda2 = [1.78627933, 1.7892603, 1.60275076, 1.6274, 1.6769 ];

% 20 meV broadening
% 150000k Sobol/ 50000 : 1.7834613 | 1.7834613  ( 50q)
%              / 50000 : 1.7893296 | 1.78639545 (100q)
%              / 50000 : 1.7860471 | 1.78627933 (150q) 
% 200000k Sobol/ 50000 : 1.7854081 | 1.7854081  ( 50q)
%              / 50000 : 1.7947925 | 1.7901003  (100q)
%              / 50000 : 1.7875802 | 1.7892603  (150q)
% 300000k Sobol/ 50000 : 1.6079794 | 1.6079794  ( 50q)
%              / 50000 : 1.6046318 | 1.6063056  (100q)
%              / 50000 : 1.5956411 | 1.60275076 (150q) 
% 400000k Sobol/ 50000 : 1.6307553 | 1.6307553  ( 50q)
%              / 50000 : 1.6298875 | 1.6303     (100q)
%              / 50000 : 1.6216865 | 1.6274     (150q) 
% 500000k Sobol/ 25000 : 1.6742567 | 1.6742567  ( 25q)
%              / 25000 : 1.6795690 | 1.6769     ( 50q)

kpoints3 = [150000,200000,300000,400000,500000];
lambda3 = [1.81997037, 1.85093917, 1.63371933, 1.5968, 1.6654  ];

% 50 meV broadening
% 150000k Sobol/ 50000 : 1.8303286 | 1.83032860 ( 50q)
%              / 50000 : 1.8243029 | 1.82731575 (100q)
%              / 50000 : 1.8052796 | 1.81997037 (150q) 
% 200000k Sobol/ 50000 : 1.8677246 | 1.86772460 ( 50q)
%              / 50000 : 1.8401741 | 1.85394935 (100q)
%              / 50000 : 1.8449188 | 1.85093917 (150q) 
% 300000k Sobol/ 50000 : 1.6318601 | 1.6318601  ( 50q)
%              / 50000 : 1.6296545 | 1.6307573  (100q)
%              / 50000 : 1.6396434 | 1.63371933 (150q) 
% 400000k Sobol/ 50000 : 1.5979851 | 1.5979851  ( 50q)
%              / 50000 : 1.5965899 | 1.5973     (100q)
%              / 50000 : 1.5956898 | 1.5968     (150q)
% 500000k Sobol/ 25000 : 1.6582991 | 1.6582991  ( 25q)
%              / 25000 : 1.6725938 | 1.6654     ( 50q)




plot(kpoints1,lambda1,'Color',col20);
hold on;
s1 = scatter(kpoints1,lambda1,50,'filled','MarkerFaceColor',col20);
hold on;
plot(kpoints2,lambda2,'Color',col21);
hold on;
s2 = scatter(kpoints2,lambda2,50,'filled','MarkerFaceColor',col21);
hold on;
plot(kpoints3,lambda3,'Color',col22);
s3 = scatter(kpoints3,lambda3,50,'filled','MarkerFaceColor',col22);

%%%%%%%%%%%%%%



legend([s1,s2,s3],'10 meV','20 meV','50 meV',... 
'Location','northEast')

set(legend,'FontSize',10);

legend boxoff
ylabel('\lambda','FontSize',14);
set(gca,'YAxisLocation','right','FontSize',14);
axis([0,1000000,0.5,3.0])


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
h(3) = subplot(4,2,3);

%Corrected SOBOL
% SpecfunID = fopen('30k_50000q_sobol');
% data = textscan(SpecfunID,'%f %f %f %f %f %f %f %f %f %f %f\n','CommentStyle','#','CollectOutput',true);
% a2F = cell2mat(data);
% fclose(SpecfunID);
% plot(a2F(:,1),a2F(:,4),'-','Color',col1,'LineWidth',1);
% hold on;



%Corrected SOBOL
SpecfunID = fopen('400000k_Sob_50000q_RND_05_SO');
data = textscan(SpecfunID,'%f %f %f %f %f %f %f %f %f %f %f\n','CommentStyle','#','CollectOutput',true);
a2F = cell2mat(data);
fclose(SpecfunID);
plot(a2F(:,1),a2F(:,4),'-','Color',col21,'LineWidth',1);
hold on;


SpecfunID = fopen('xyscan_a2F_Pb_Parks1969.txt');
data = textscan(SpecfunID,'%f %f %f %f %f %f\n','CommentStyle','#','CollectOutput',true);
exp = cell2mat(data);
fclose(SpecfunID);

plot(exp(:,1),exp(:,2),'.', 'markersize',15,'Color','black' );

legend('2.7\cdot10^4 k',...
    '6.4\cdot10^4 k',...
    '1.25\cdot10^5 k',...
    '2.16\cdot10^5 k',...
'exp','Location','northwest')

set(legend,'FontSize',10);
legend boxoff
set(gca,'FontSize',14);
set(gca,'ytick',[1,2])
axis([0,10,0,2])
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


h(6) = subplot(4,2,6);

kpoints1 = [30000,40000,50000,70000, 100000, 150000, 200000, 250000, 300000,400000,500000, 600000, 700000, 800000, 1000000]; 
%lambda1 = [1.970, 1.876, 1.839, 1.810, 1.504, 1.600 ,1.370, 1.0985, 1.246, 1.181, 1.1265, 1.0754, 1.1156, 1.0319];% 30000 q-points
lambda1 = [0, 0, 0, 0, 0, 0 ,0, 0, 0, 0, 0, 0, 0,1.1043788, 0];



% ----- Sobol k / Random q ------
% 0 Kelvin
% WITH SO
% 10 meV broadening
% 150000k Sobol/ 50000 : 1.7456    | 1.7456
%              / 50000 : 1.76169   | 1.75369
%              / 50000 : 1.7562477 | 1.75456
% 200000k Sobol/ 50000 : 1.7551155 | 1.7551155
%              / 50000 : 1.7586171 | 1.756866
%              / 50000 : 1.7621193 | 1.7586173
% 300000k Sobol/ 50000 : 1.5979625 | 1.5979625
%              / 50000 : 1.5980701 | 1.5980163
%              / 50000 : 1.6022752 | 1.5994359
% 400000k Sobol/ 50000 : 1.6377910 | 1.6377910 ( 50q)
%              / 50000 : 1.6395021 | 1.6386   (100q)
%              / 50000 : 1.6360996 | 1.6378   (150q) 
% 500000k Sobol/ 25000 : 1.6729995 | 1.6729995  ( 25q)
%              / 25000 : 1.6949476 | 1.6840     ( 50q)


% 20 meV broadening
% 150000k Sobol/ 50000 : 1.7834613 | 1.7834613  ( 50q)
%              / 50000 : 1.7893296 | 1.78639545 (100q)
%              / 50000 : 1.7860471 | 1.78627933 (150q) 
% 200000k Sobol/ 50000 : 1.7854081 | 1.7854081  ( 50q)
%              / 50000 : 1.7947925 | 1.7901003  (100q)
%              / 50000 : 1.7875802 | 1.7892603  (150q)
% 300000k Sobol/ 50000 : 1.6079794 | 1.6079794  ( 50q)
%              / 50000 : 1.6046318 | 1.6063056  (100q)
%              / 50000 : 1.5956411 | 1.60275076 (150q) 
% 400000k Sobol/ 50000 : 1.6307553 | 1.6307553  ( 50q)
%              / 50000 : 1.6298875 | 1.6303     (100q)
%              / 50000 : 1.6216865 | 1.6274     (150q) 
% 500000k Sobol/ 25000 : 1.6742567 | 1.6742567  ( 25q)
%              / 25000 : 1.6795690 | 1.6769     ( 50q)



% 50 meV broadening
% 150000k Sobol/ 50000 : 1.8303286 | 1.83032860 ( 50q)
%              / 50000 : 1.8243029 | 1.82731575 (100q)
%              / 50000 : 1.8052796 | 1.81997037 (150q) 
% 200000k Sobol/ 50000 : 1.8677246 | 1.86772460 ( 50q)
%              / 50000 : 1.8401741 | 1.85394935 (100q)
%              / 50000 : 1.8449188 | 1.85093917 (150q) 
% 300000k Sobol/ 50000 : 1.6318601 | 1.6318601  ( 50q)
%              / 50000 : 1.6296545 | 1.6307573  (100q)
%              / 50000 : 1.6396434 | 1.63371933 (150q) 
% 400000k Sobol/ 50000 : 1.5979851 | 1.5979851  ( 50q)
%              / 50000 : 1.5965899 | 1.5973     (100q)
%              / 50000 : 1.5956898 | 1.5968     (150q)
% 500000k Sobol/ 25000 : 1.6582991 | 1.6582991  ( 25q)
%              / 25000 : 1.6725938 | 1.6654     ( 50q)



% ----- Random k/q ------

% WITH SO
% 20 meV broadening
% 100000k/ 100000q ==> 1.7003144 [new] or with other rnd 1.8173834 or 1.9291368. I rm the archer file ...  
% 150000k/ 100000q ==> 1.6758591, 1.6961513, 1.7732279

% 50 meV broadening
% 100000k/ 100000q ==> 1.7421141 [new] or with other rnd 1.7637974 or 1.8715478 I rm the archer file ...  
% 150000k/ 100000q ==> 1.702682, 1.7513527, 1.8409175 


% WITHOUT SO
% 300000k/150000q ==> 1.2991006 [new]
% 300000k/200000q ==> 1.1968693 [new]

% 400000k/100000q ==> 1.1224181
% 400000k/150000q ==> 1.1681747
% 400000k/200000q ==> 1.2562289
% 400000k/250000q ==> 1.1814625

% 500000k/ 150000q ==>  1.0993040
% 500000k/ 200000q ==>  1.2109697
% 500000k/ 250000q ==>  1.1265345

% 600000k/ 200000q ==>  1.0928090
% 600000k/ 250000q ==>  1.0753818

% 700000k/ 200000q ==>  1.1156241

% 800000k/ 250000q ==>   [new]

% 900000k/ 200000q ==>  1.1043788 [new]

% 1000000k/ 150000q ==> (1.0732844 + 0.9905621)/2 = 1.03192325

plot(kpoints1,lambda1,'Color',col4);
hold on;
s1 = scatter(kpoints1,lambda1,50,'filled','MarkerFaceColor',col4);

legend('k=q grid',... 
'Location','northEast')

set(legend,'FontSize',10);

legend boxoff
ylabel('\lambda','FontSize',14);
set(gca,'YAxisLocation','right','FontSize',14);
axis([0,1000000,0.5,3.0])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


h(5) = subplot(4,2,5);

% SpecfunID = fopen('30000k_30000q_EPWrand');
% data = textscan(SpecfunID,'%f %f %f %f %f %f %f %f %f %f %f\n','CommentStyle','#','CollectOutput',true);
% a2F = cell2mat(data);
% fclose(SpecfunID);
% plot(a2F(:,1),a2F(:,4),'-','Color',col1,'LineWidth',1);
% hold on;



SpecfunID = fopen('xyscan_a2F_Pb_Parks1969.txt');
data = textscan(SpecfunID,'%f %f %f %f %f %f\n','CommentStyle','#','CollectOutput',true);
exp = cell2mat(data);
fclose(SpecfunID);
plot(exp(:,1),exp(:,2),'.', 'markersize',15,'Color','black' );

legend('3\cdot10^4 k',...%'4\cdot10^4 k&q',...
    '5\cdot10^4 k',...
    '7\cdot10^4 k',...
    '1\cdot10^5 k','1\cdot10^6 k',...
'exp','Location','northwest')

set(legend,'FontSize',10);
legend boxoff
set(gca,'FontSize',14);
set(gca,'ytick',[1,2])
axis([0,10,0,2])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




h(8) = subplot(4,2,8);

kpoints1 = [30000,50000,100000,200000, 300000,400000, 500000, 600000, 700000,800000,900000,1000000 ]; 
%lambda1 = [2.299, 1.867, 1.721, 1.427, 1.516, 1.397 ,1.269, 1.257, 1.154, 1.1058, 1.0457, 1.031, 1.125, 1.06255 ];% 
lambda1 = [0, 0, 0,1.2692768, 1.2951296, 1.234 , 1.1595308, 1.1368649, 1.2483856,1.2278,1.2584204, 1.06255725];% 

% WITH SO
% 20 meV broadening
% 150000k/ 150000q ==> 1.7900403  [new]
% 150000k/ 200000q ==>   [new]

% 50 meV broadening
% 150000k/ 150000q ==>



% WITOUT SO
% 50 meV broadening
% 200000k/ 150000q ==>  1.2693148 [new]
% 200000k/ 200000q ==>  1.2692768 [new]

% 300000k/ 150000q ==>  1.2967606 [new]
% 300000k/ 200000q ==>  1.2951296 [new]

% 400000k/ 150000q ==>  1.2362117 [new]
% 400000k/ 200000q ==>  1.2341535 [new]
% 400000k/ 300000q ==>  1.1058459

% 500000k/ 150000q ==>  1.1579395 [new]
% 500000k/ 200000q ==>  1.1595308 [new]

% 600000k/ 150000q ==>  1.1398742 [new]
% 600000k/ 200000q ==>  1.1368649 [new]

% 700000k/ 150000q ==>  1.2481414 [new]
% 700000k/ 200000q ==>  1.2483856 [new]

% 800000k/ 150000q ==>  1.2311465 [new]
% 800000k/ 200000q ==>  1.2278390 [new]

% 900000k/ 150000q ==>  1.2567131 [new]
% 900000k/ 200000q ==>  1.2584204 [new]

% 1000000k/ 150000q ==>  (1.0300659 + 1.0901429)/2 = 1.0601044  
% 1000000k/ 200000q ==>  (1.0316897 + 1.0934248)/2 = 1.06255725




plot(kpoints1,lambda1,'Color',col4);
hold on;
s1 = scatter(kpoints1,lambda1,50,'filled','MarkerFaceColor',col4);

legend('k=q grid',... 
'Location','northEast')


set(legend,'FontSize',10);

legend boxoff
ylabel('\lambda','FontSize',14);
set(gca,'YAxisLocation','right','FontSize',14);

axis([0,1000000,0.5,3.0])
set(gca,'ytick',[1,2,3])



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

h(7) = subplot(4,2,7);

%Corrected SOBOL
SpecfunID = fopen('800000k_200000q_sobol');
data = textscan(SpecfunID,'%f %f %f %f %f %f %f %f %f %f %f\n','CommentStyle','#','CollectOutput',true);
a2F = cell2mat(data);
fclose(SpecfunID);
plot(a2F(:,1),a2F(:,4),'-','Color',col1,'LineWidth',1);
hold on;

SpecfunID = fopen('900000k_200000q_sobol');
data = textscan(SpecfunID,'%f %f %f %f %f %f %f %f %f %f %f\n','CommentStyle','#','CollectOutput',true);
a2F = cell2mat(data);
fclose(SpecfunID);
plot(a2F(:,1),a2F(:,4),'-','Color',col2,'LineWidth',1);
hold on;



SpecfunID = fopen('xyscan_a2F_Pb_Parks1969.txt');
data = textscan(SpecfunID,'%f %f %f %f %f %f\n','CommentStyle','#','CollectOutput',true);
exp = cell2mat(data);
fclose(SpecfunID);
plot(exp(:,1),exp(:,2),'.', 'markersize',15,'Color','black');


legend('3\cdot10^4 k','4\cdot10^4 k',...
    '5\cdot10^4 k','7\cdot10^4 k','1\cdot10^5 k','2\cdot10^5 k',...
'exp','Location','northwest');

set(legend,'FontSize',10);
legend boxoff;

set(gca,'FontSize',14);


axis([0,10,0,2]);
set(gca,'ytick',[0,1,2])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%set(h(1:4),'xcolor','w');

% MyBox = uicontrol('style','text')
% set(MyBox,'String','Here is a lot more information')
% set(MyBox,'Position',[0.6,0.6,0.1,0.1])



%# find current position [x,y,width,height]
pos1 = get(h(1),'Position');
pos2 = get(h(2),'Position');
pos3 = get(h(3),'Position');
pos4 = get(h(4),'Position');
pos5 = get(h(5),'Position');
pos6 = get(h(6),'Position');
pos7 = get(h(7),'Position');
pos8 = get(h(8),'Position');


pos2(1) = pos2(1) - 0.08;
pos2(3) = pos2(3) - 0.1;
set(h(2),'Position',pos2);

set(h(1),'XTickLabel','');
pos3(2) = pos1(2) - pos3(4);
set(h(3),'Position',pos3);

set(h(2),'XTickLabel','');
pos4(2) = pos2(2) - pos4(4);
set(h(4),'Position',pos4);

pos4(1) = pos4(1) - 0.08;
pos4(3) = pos4(3) - 0.1;
set(h(4),'Position',pos4);

set(h(3),'XTickLabel','');
pos5(2) = pos3(2) - pos5(4);
set(h(5),'Position',pos5);

set(h(4),'XTickLabel','');
pos6(2) = pos4(2) - pos6(4);
set(h(6),'Position',pos6);

pos6(1) = pos6(1) - 0.08;
pos6(3) = pos6(3) - 0.1;
set(h(6),'Position',pos6);

set(h(5),'XTickLabel','');
pos7(2) = pos5(2) - pos7(4);
set(h(7),'Position',pos7);

set(h(6),'XTickLabel','');
pos8(2) = pos6(2) - pos8(4);
set(h(8),'Position',pos8);

pos8(1) = pos8(1) - 0.08;
pos8(3) = pos8(3) - 0.1;
set(h(8),'Position',pos8);

xlabel(h(7),'Frequency (meV)','FontSize',14);
xlabel(h(8),'k-point grid','FontSize',14);
ylabel(h(1),'\alpha^2 F','FontSize',14);
ylabel(h(3),'\alpha^2 F','FontSize',14);
ylabel(h(5),'\alpha^2 F','FontSize',14);
ylabel(h(7),'\alpha^2 F','FontSize',14);


 a = 0.1;
 b = 0.15;
 text(pos1(1)+a,pos1(3)-b,['(',char(1+96),') '],...
     'color','k','fontw','b','Parent', h(1));
 text(pos3(1)+a,pos3(3)-b,['(',char(3+96),') '],...
     'color','k','fontw','b','Parent', h(3));
 text(pos5(1)+a,pos5(3)-b,['(',char(5+96),') '],...
     'color','k','fontw','b','Parent', h(5));
 text(pos7(1)+a,pos7(3)-b,['(',char(7+96),') '],...
     'color','k','fontw','b','Parent', h(7));

  text(10.95,0.16,['(',char(2+96),') '],...
     'color','k','fontw','b','Parent', h(1));
   text(10.95,0.16,['(',char(4+96),') '],...
     'color','k','fontw','b','Parent', h(3));
   text(10.95,0.16,['(',char(6+96),') '],...
     'color','k','fontw','b','Parent', h(5));
   text(10.95,0.16,['(',char(8+96),') '],...
     'color','k','fontw','b','Parent', h(7));


%title(h(1),'Pb a2F wo SOC conv [ph smearing = 0.15 meV and el smearing = 50 meV]')
%set(gcf, 'PaperPositionMode', 'auto');
%print -depsc2 Pb_a2F_conv5.eps
%print('Pb_a2F_conv5','-dpng')
%close;

