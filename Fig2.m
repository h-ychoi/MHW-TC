%% fig
clear all; close all; clc; 

 load('D:\2023_article_fig\ver_jun\review\fig_pr_all.mat','a1','a2','a3','a4','a5','aa1','aa2','aa3','aa4','aa5');
 load('D:\2023_article_fig\ver_jun\review\pr_5de.mat','pr_do','non_pr_do');

for n=1:76
 for m=1:6
     if non_pr_do(n,m)==NaN;
         non_pr_do(n,m)=0;
     end
 end
end
non_pr_do(29,:)=[];


pr_do(59,1)=0;

%%
 v1=non_pr_do; v2=pr_do;
a1=a1.*0.42; a2=a2.*0.42; a3=a3.*0.42; a4=a4.*0.42; a5=a5.*0.42;
aa1=aa1.*0.42; aa2=aa2.*0.42; aa3=aa3.*0.42; aa4=aa4.*0.42; aa5=aa5.*0.42;
v1=v1.*0.42; v2=v2.*0.42;

%%
close all;
load('G:\kcm\colormap\blue_pu.mat');
fig= figure; 
set(fig,'Position', [80, 50, 1449/1.0, 950/1.0]);
set(fig,'Colormap',blue_pu);
A(1) = subplot(3,5,1)
contourf(a1,[0:0.01:50],'k','linewidth',0.1,'linestyle','none');
set(gca, 'linewidth',1,'xgrid','off','xtick',[1 21 41],'xticklabel',({'-5^{o}', '0^{o}', '+5^{o}'}),'xlim',[1 41],'fontsize',15);
set(gca, 'linewidth',1,'ygrid','off','ytick',[1 21 41],'yticklabel',({'-5^{o}', '0^{o}', '+5^{o}'}),'ylim',[1 41],'fontsize',15);
caxis([0 15]); 

hold on;
[c1 h1] = contour(a1,[0 10],'r','linewidth',2,'linestyle','-');
hold on;
[c1 h1] = contour(a1,[0 5],'r','linewidth',2,'linestyle','--');

title(['a) -4days '],'fontsize',20);
% text(-37,21,'nonMHW TC','fontSize',14);
 h=text(-13,5,'nonMHW TC','fontSize',20);
 set(h,'Rotation',90);

A(2) = subplot(3,5,2)
contourf(a2,[0:0.01:50],'k','linewidth',0.1,'linestyle','none');
caxis([0 15]); 
set(gca, 'linewidth',1,'xgrid','off','xtick',[1 21 41],'xticklabel',({'', '', ''}),'xlim',[1 41],'fontsize',11);
set(gca, 'linewidth',1,'ygrid','off','ytick',[1 21 41],'yticklabel',({'', '', ''}),'ylim',[1 41],'fontsize',11);
title(['b) -3days'],'fontsize',20);
hold on;
[c1 h1] = contour(a2,[0 10],'r','linewidth',2,'linestyle','-');
hold on;
[c1 h1] = contour(a2,[0 5],'r','linewidth',2,'linestyle','--');

A(3) = subplot(3,5,3)
contourf(a3,[0:0.01:50],'k','linewidth',0.1,'linestyle','none');
caxis([0 15]); 
set(gca, 'linewidth',1,'xgrid','off','xtick',[1 21 41],'xticklabel',({'', '', ''}),'xlim',[1 41],'fontsize',11);
set(gca, 'linewidth',1,'ygrid','off','ytick',[1 21 41],'yticklabel',({'', '', ''}),'ylim',[1 41],'fontsize',11);
title(['c) -2days'],'fontsize',20);
text(-4,56,'TC precipitation','fontSize',30);
hold on;
[c1 h1] = contour(a3,[0 10],'r','linewidth',2,'linestyle','-');
hold on;
[c1 h1] = contour(a3,[0 5],'r','linewidth',2,'linestyle','--');

A(4) = subplot(3,5,4)
contourf(a4,[0:0.01:50],'k','linewidth',0.1,'linestyle','none');
% caxis([0 30]); 
caxis([0 15]); 
set(gca, 'linewidth',1,'xgrid','off','xtick',[1 21 41],'xticklabel',({'', '', ''}),'xlim',[1 41],'fontsize',11);
set(gca, 'linewidth',1,'ygrid','off','ytick',[1 21 41],'yticklabel',({'', '', ''}),'ylim',[1 41],'fontsize',11);
title(['d) -1days'],'fontsize',20);
hold on;
[c1 h1] = contour(a4,[0 10],'r','linewidth',2,'linestyle','-');
hold on;
[c1 h1] = contour(a4,[0 5],'r','linewidth',2,'linestyle','--');

A(5) = subplot(3,5,5)
contourf(a5,[0:0.01:50],'k','linewidth',0.1,'linestyle','none');
caxis([0 15]); 
set(gca, 'linewidth',1,'xgrid','off','xtick',[1 21 41],'xticklabel',({'', '', ''}),'xlim',[1 41],'fontsize',11);
set(gca, 'linewidth',1,'ygrid','off','ytick',[1 21 41],'yticklabel',({'', '', ''}),'ylim',[1 41],'fontsize',11);
title(['e) LMI '],'fontsize',20);
hold on;
[c1 h1] = contour(a5,[0 10],'r','linewidth',2,'linestyle','-');
hold on;
[c1 h1] = contour(a5,[0 5],'r','linewidth',2,'linestyle','--');

% MHWTC
A(6)=subplot(3,5,6)
contourf(aa1,[0:0.01:50],'k','linewidth',0.1,'linestyle','none');
set(gca, 'linewidth',1,'xgrid','off','xtick',[1 21 41],'xticklabel',({'-5^{o}', '0^{o}', '+5^{o}'}),'xlim',[1 41],'fontsize',15);
set(gca, 'linewidth',1,'ygrid','off','ytick',[1 21 41],'yticklabel',({'-5^{o}', '0^{o}', '+5^{o}'}),'ylim',[1 41],'fontsize',15);
title(['f) -4days '],'fontsize',20);
caxis([0 15]); 
 h=text(-13,9,'MHW TC','fontSize',20);
 set(h,'Rotation',90);
hold on;
[c1 h1] = contour(aa1,[0 10],'r','linewidth',2,'linestyle','-');
hold on;
[c1 h1] = contour(aa1,[0 5],'r','linewidth',2,'linestyle','--');


A(7)=subplot(3,5,7)
contourf(aa2,[0:0.01:50],'k','linewidth',0.1,'linestyle','none');
set(gca, 'linewidth',1,'xgrid','off','xtick',[1 21 41],'xticklabel',({'', '', ''}),'xlim',[1 41],'fontsize',11);
set(gca, 'linewidth',1,'ygrid','off','ytick',[1 21 41],'yticklabel',({'', '', ''}),'ylim',[1 41],'fontsize',11);
title(['g) -3days '],'fontsize',20);
caxis([0 15]); 
hold on;
[c1 h1] = contour(aa2,[0 10],'r','linewidth',2,'linestyle','-');
hold on;
[c1 h1] = contour(aa2,[0 5],'r','linewidth',2,'linestyle','--');

A(8)=subplot(3,5,8)
contourf(aa3,[0:0.01:50],'k','linewidth',0.1,'linestyle','none');
set(gca, 'linewidth',1,'xgrid','off','xtick',[1 21 41],'xticklabel',({'', '', ''}),'xlim',[1 41],'fontsize',11);
set(gca, 'linewidth',1,'ygrid','off','ytick',[1 21 41],'yticklabel',({'', '', ''}),'ylim',[1 41],'fontsize',11);
title(['h) -2days '],'fontsize',20);
caxis([0 15]); 
hold on;
[c1 h1] = contour(aa3,[0 10],'r','linewidth',2,'linestyle','-');
hold on;
[c1 h1] = contour(aa3,[0 5],'r','linewidth',2,'linestyle','--');

A(9)=subplot(3,5,9)
contourf(aa4,[0:0.01:50],'k','linewidth',0.1,'linestyle','none');
set(gca, 'linewidth',1,'xgrid','off','xtick',[1 21 41],'xticklabel',({'', '', ''}),'xlim',[1 41],'fontsize',11);
set(gca, 'linewidth',1,'ygrid','off','ytick',[1 21 41],'yticklabel',({'', '', ''}),'ylim',[1 41],'fontsize',11);
title(['i) -1day '],'fontsize',20);
% caxis([0 30]); 
caxis([0 15]); 
hold on;
[c1 h1] = contour(aa4,[0 10],'r','linewidth',2,'linestyle','-');
hold on;
[c1 h1] = contour(aa4,[0 5],'r','linewidth',2,'linestyle','--');


A(10)=subplot(3,5,10)
contourf(aa5,[0:0.01:50],'k','linewidth',0.1,'linestyle','none');
% title(['(j) LMI '],'fontsize',20);
h=text(15,45.5,'j) LMI','fontSize',20);
% set(h,'Rotation',90);
set(gca, 'linewidth',1,'xgrid','off','xtick',[1 21 41],'xticklabel',({'', '', ''}),'xlim',[1 41],'fontsize',11);
set(gca, 'linewidth',1,'ygrid','off','ytick',[1 21 41],'yticklabel',({'', '', ''}),'ylim',[1 41],'fontsize',11);
% caxis([0 30]); 
caxis([0 15]); 
C=colorbar('location','eastoutside');
set(C,'position',[.96 .44 .01 .45],'fontsize',15); 
hold on;
[c1 h1] = contour(aa5,[0 10],'r','linewidth',2,'linestyle','-');
hold on;
[c1 h1] = contour(aa5,[0 5],'r','linewidth',2,'linestyle','--');

A(11)=subplot(3,5,11)
fig = gcf;
FontSize = 12;
set(fig,'defaultAxesFontSize',FontSize);
options.handle = fig;
options.color_area = [128 193 219]./255; % Blue theme
options.color_line = [ 0 0 1];
% options.color_line = [ 52 148 186]./255;
options.alpha      = 0.5;
options.line_width = 2;
options.error      = 'c95'; % 95 percent confidence interval
plot_areaerrorbar(v1, options);
hold on
options.color_area = [255 109 104]./255;    % Orange theme
options.color_line = [1 0  0]
% options.color_line = [236 112  22]./255;
plot_areaerrorbar(v2, options);
hold off
set(gca, 'linewidth',1,'xgrid','off','xtick',[1:1:6],'xticklabel',({'-5day','-4day','-3day','-2day','-1day' 'LMI'}),'xlim',[1 6],'fontsize',20);
xlabel('time');
set(gca, 'linewidth',1,'ygrid','off','ytick',[0:1:6],'yticklabel',[0:1:16],'ylim',[0 5],'fontsize',20);
ylabel('TC precipitation (mm hr^{-1})','fontsize',15);
title(['k) mean TC precipitation'],'fontsize',20);
% legend({'', 'non-MHW TC', '','MHW TC'},'Location','Northwest')


% location
ax=.15; ay=.20;
set(A(1),'position',[.07 .70 ax ay]);
set(A(2),'position',[ .25 .70 ax ay]);
set(A(3),'position',[.43 .70 ax ay]);
set(A(4),'position',[.61 .70 ax ay]);
set(A(5),'position',[ .79 .70 ax ay]);

set(A(6),'position',[.07 .42 ax ay]);
set(A(7),'position',[.25 .42 ax ay]);
set(A(8),'position',[ .43  .42 ax ay]);
set(A(9),'position',[.61 .42 ax ay]);
set(A(10),'position',[.79 .42 ax ay]);
set(A(11),'position',[ .07 .08 .87 .28]);






% % save,
  p_name_r=['C:\Users\hychoi\Desktop\MHW_TC\fig2_pr_day'];
  print('-dpng','-r850',p_name_r);
%  disp(['finish']);
