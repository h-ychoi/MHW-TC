%%
clear all; 
load ('D:\2023_article_fig\ver_jun\review\qsat_qn_wnp_v2.mat','v1','v2');
 load('D:\2023_article_fig\ver_jun\review\10m_wind_wnp.mat','vv1','vv2');
close all; clc;
fig = figure;
set(fig,'Position', [80, 50, 1249/1.0, 850/1.0]);


A(1)=subplot(2,1,1)
FontSize = 12;
set(fig,'defaultAxesFontSize',FontSize);
options.handle = fig;
options.color_area = [128 193 219]./255; % Blue theme
options.color_line = [ 0 0 1];
% options.color_line = [ 52 148 186]./255;
options.alpha      = 0.5;
options.line_width = 2;
options.error      = 'c95'; % 95 percent confidence interval
plot_areaerrorbar(v1.*-1, options);
hold on
options.color_area = [255 109 104]./255;    % Orange theme
options.color_line = [1 0  0]
% options.color_line = [236 112  22]./255;
plot_areaerrorbar(v2.*-1, options);
hold off
 set(gca, 'linewidth',1,'xgrid','on','xtick',[1:1:21],'xticklabel', ...
     ({'-5day','','','','-4day','','','','-3day','','','','-2day','','','', '-1day','','','', 'LMI'}),'xlim',[1 21],'fontsize',20);
% xlabel('time','fontsize',20);
% set(gca, 'linewidth',1,'ygrid','off','ytick',[-300:50:0],'yticklabel',[-300:50:0],'ylim',[-250 0],'fontsize',18);
legend({'','non-MHW TC','','MHW TC'},'Location','northwest');
ylabel('Qsat - Qn (kg kg^{-1})');
title(['a) Qsat - Qn'],'fontsize',20);


A(2)=subplot(2,1,2)
FontSize = 12;
set(fig,'defaultAxesFontSize',FontSize);
options.handle = fig;
options.color_area = [128 193 219]./255; % Blue theme
options.color_line = [ 0 0 1];
% options.linestyle = '-';
% options.color_line = [ 52 148 186]./255;
options.alpha      = 0.5;
options.line_width = 2;
options.error      = 'c95'; % 95 percent confidence interval
plot_areaerrorbar(vv1, options);
hold on
options.color_area = [255 109 104]./255;    % Orange theme
options.color_line = [1 0  0]
% options.color_line = [236 112  22]./255;
plot_areaerrorbar(vv2, options);
hold off
ylabel('Un(ms^{-1})');
 set(gca, 'linewidth',1,'xgrid','on','xtick',[1:1:21],'xticklabel', ...
     ({'-5day','','','','-4day','','','','-3day','','','','-2day','','','', '-1day','','','', 'LMI'}),'xlim',[1 21],'fontsize',20);
xlabel('time','fontsize',20);
legend({'','non-MHW TC','','MHW TC'},'Location','northwest');
% set(gca, 'linewidth',1,'ygrid','off','ytick',[-300:50:0],'yticklabel',[-300:50:0],'ylim',[-250 0],'fontsize',18);
title(['b) Un'],'fontsize',20);
% % save,
 p_name_r=['C:\Users\hychoi\Desktop\MHW_TC\Fig4_LHF_component'];
 print('-dpng','-r850',p_name_r);
 disp(['finish']);