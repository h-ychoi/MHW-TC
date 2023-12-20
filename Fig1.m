clear all; close all; clc; 
load('D:\2023_article_fig\ver_jun\review\tc_evloution_ALL_new.mat','v1','v2','aa');
all_v1=v1; all_v2=v2; all_aa=aa; 
clear v1 v2 aa;
load('D:\2023_article_fig\ver_jun\review\tc_evloution_WNP_new.mat','v1','v2','aa');
wnp_v1=v1; wnp_v2=v2; wnp_aa=aa; 
clear v1 v2 aa;
load('D:\2023_article_fig\ver_jun\review\tc_evloution_ATL_new.mat','v1','v2','aa');
atl_v1=v1; atl_v2=v2; atl_aa=aa; 
clear v1 v2 aa;
%% figure;
close all; clc; 
fig=figure;
set(fig,'Position', [80, 50, 1259/1.0, 905/1.0]);
A(1) = subplot(3,2,1)
fig = gcf;
FontSize = 12;
set(fig,'defaultAxesFontSize',FontSize);
options.handle = fig;
options.color_area = [128 193 219]./255; % Blue theme
options.color_line = [ 0 0 1];
options.alpha      = 0.5;
options.line_width = 2;
options.error      = 'c95'; % 95 percent confidence interval
plot_areaerrorbar(all_v1, options);
hold on
options.color_area = [255 109 104]./255;    % Orange theme
options.color_line = [1 0  0]
plot_areaerrorbar(all_v2, options);
hold off
% xlabel('time');
 set(gca, 'linewidth',1,'xgrid','on','xtick',[1:1:29],'xticklabel', ...
     ({'-5day','','','','-4day','','','','-3day','','','','-2day','','','', '-1day','','','', 'LMI', '', '','','+1day', '', '','','+2day'}),'xlim',[1 29],'FontSize',13);
set(gca, 'linewidth',1,'ygrid','off','ytick',[20:20:130],'yticklabel',[20:20:130],'ylim',[25 120],'FontSize',13);
ylabel('TC wind speed (knot)');
title(['a) TCs Evolution (WNP + ATL)'],'fontsize',16);

A(2) = subplot(3,2,2)
fig = gcf;
FontSize = 12;
set(fig,'defaultAxesFontSize',FontSize);
options.handle = fig;
options.color_area = [128 193 219]./255; % Blue theme
options.color_line = [ 0 0 1];
options.alpha      = 0.5;
options.line_width = 2;
options.error      = 'c95'; % 95 percent confidence interval
plot_areaerrorbar(wnp_v1, options);
hold on
options.color_area = [255 109 104]./255;    % Orange theme
options.color_line = [1 0  0]
plot_areaerrorbar(wnp_v2, options);
hold off
% xlabel('time');
 set(gca, 'linewidth',1,'xgrid','on','xtick',[1:1:29],'xticklabel', ...
     ({'-5day','','','','-4day','','','','-3day','','','','-2day','','','', '-1day','','','', 'LMI', '', '','','+1day', '', '','','+2day'}),'xlim',[1 29],'FontSize',13);
set(gca, 'linewidth',1,'ygrid','off','ytick',[20:20:130],'yticklabel',[20:20:130],'ylim',[25 120],'FontSize',13);
ylabel('TC wind speed (knot)');
title(['b) WNP TCs Evolution'],'fontsize',16);

A(3) = subplot(3,2,3)
fig = gcf;
FontSize = 12;
set(fig,'defaultAxesFontSize',FontSize);
options.handle = fig;
options.color_area = [128 193 219]./255; % Blue theme
options.color_line = [ 0 0 1];
options.alpha      = 0.5;
options.line_width = 2;
options.error      = 'c95'; % 95 percent confidence interval
plot_areaerrorbar(atl_v1, options);
hold on
options.color_area = [255 109 104]./255;    % Orange theme
options.color_line = [1 0  0]
plot_areaerrorbar(atl_v2, options);
hold off
xlabel('time');
 set(gca, 'linewidth',1,'xgrid','on','xtick',[1:1:29],'xticklabel', ...
     ({'-5day','','','','-4day','','','','-3day','','','','-2day','','','', '-1day','','','', 'LMI', '', '','','+1day', '', '','','+2day'}),'xlim',[1 29],'FontSize',13);
set(gca, 'linewidth',1,'ygrid','off','ytick',[20:20:130],'yticklabel',[20:20:130],'ylim',[25 120],'FontSize',13);
ylabel('TC wind speed (knot)');
title(['c) ATL TCs Evolution'],'fontsize',16);


A(4) = subplot(3,2,4)
b=bar(all_aa,.8);
b(1).FaceColor='r';
b(2).FaceColor='b';
set(gca, 'linewidth',1,'xgrid','off','xtick',[1:1:6],'xticklabel', ...
({'non','1','2','3','4','5'}),'xlim',[0.5 6.5],'FontSize',13);
set(gca, 'linewidth',1,'ygrid','off','ytick',[0:20:60],'yticklabel',[0:20:60],'ylim',[0 55],'FontSize',13);
legend({'MHW TC','non-MHW TC'},'Location','northwest','FontSize',11,'NumColumns',2);
%  xlabel('Category');
 ylabel(' % ','Rotation',0);
title('d) TCs category (WNP + ATL)','fontsize',16);
text(0.8,42,'**','FontSize',20);
text(4.8,33,'**','FontSize',20);
text(5.8,22,'**','FontSize',20);

A(5) = subplot(3,2,5)
b=bar(wnp_aa,.8);
b(1).FaceColor='r';
b(2).FaceColor='b';
set(gca, 'linewidth',1,'xgrid','off','xtick',[1:1:6],'xticklabel', ...
({'non','1','2','3','4','5'}),'xlim',[0.5 6.5],'FontSize',13);
set(gca, 'linewidth',1,'ygrid','off','ytick',[0:20:60],'yticklabel',[0:20:60],'ylim',[0 55],'FontSize',13);
legend({'MHW TC','non-MHW TC'},'Location','northwest','FontSize',11,'NumColumns',2);
 ylabel(' % ','Rotation',0);
title('e) WNP TCs category','fontsize',16);
text(.8,35,'**','FontSize',20);
text(4.8,36,'**','FontSize',20);
text(5.8,23,'**','FontSize',20);

A(6) = subplot(3,2,6)
b=bar(atl_aa,.8);
b(1).FaceColor='r';
b(2).FaceColor='b';
set(gca, 'linewidth',1,'xgrid','off','xtick',[1:1:6],'xticklabel', ...
({'non','1','2','3','4','5'}),'xlim',[0.5 6.5],'FontSize',13);
set(gca, 'linewidth',1,'ygrid','off','ytick',[0:20:60],'yticklabel',[0:20:60],'ylim',[0 85],'FontSize',13);
legend({'MHW TC','non-MHW TC'},'Location','northwest','FontSize',11,'NumColumns',2);
 xlabel('Category');
 ylabel(' % ','Rotation',0);
title('f) ATL TCs category','fontsize',16);
text(.8,67,'**','FontSize',20);
% text(3.8,25,'*','FontSize',20);
text(4.8,26,'*','FontSize',20);


  set(A(1),'position',[.07 .73 .65 .23]);
  set(A(2),'position',[.07 .40 .65 .23]);
  set(A(3),'position',[.07 .07 .65 .23]);
  set(A(4),'position',[.77 .73 .22 .23]);
  set(A(5),'position',[.77 .40 .22 .23]);
  set(A(6),'position',[.77 .07 .22 .23]);
  
    % save,
%      p_name_r=['C:\Users\hychoi\Desktop\MHW_TC\Fig1_TCevolution'];
% p_name_r=['D:\2023_article_fig\ver_jun\review\fig2_TCevolution_cate_lmit_lt'];
%      print('-dpng','-r850',p_name_r);
    
