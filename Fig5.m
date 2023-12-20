
%% LMI location
clear all; close all; clc; 
load ('D:\2023_article_fig\ver_jun\review\atl_lmi.mat', ...
    'atl_mhw_lt','atl_mhw_ln','atl_non_lt','atl_non_ln','atl_mhw_lmi_ln','atl_mhw_lmi_lt','atl_non_lmi_ln','atl_non_lmi_lt');
atl_m_lmi_lt=atl_mhw_lt; atl_m_lmi_ln=atl_mhw_ln; atl_n_lmi_lt=atl_non_lt; atl_n_lmi_ln=atl_non_ln;
atl_a_lmi_lt=atl_mhw_lmi_lt; atl_a_lmi_ln=atl_mhw_lmi_ln; atl_na_lmi_lt=atl_non_lmi_lt; atl_na_lmi_ln=atl_non_lmi_ln;
load ('D:\2023_article_fig\ver_jun\review\wnp_lmi.mat', ...
    'wnp_mhw_lt','wnp_mhw_ln','wnp_non_lt','wnp_non_ln','wnp_mhw_lmi_ln','wnp_mhw_lmi_lt','wnp_non_lmi_ln','wnp_non_lmi_lt');
wnp_m_lmi_lt=wnp_mhw_lt; wnp_m_lmi_ln=wnp_mhw_ln; wnp_n_lmi_lt=wnp_non_lt; wnp_n_lmi_ln=wnp_non_ln;
wnp_a_lmi_lt=wnp_mhw_lmi_lt; wnp_a_lmi_ln=wnp_mhw_lmi_ln; wnp_na_lmi_lt=wnp_non_lmi_lt; wnp_na_lmi_ln=wnp_non_lmi_ln;

clear atl_non_* wnp_non_* atl_mhw_* wnp_mhw_*;
%% Genesis
%%WNP
load('D:\2023_article_fig\ver_jun\final_genesis_all.mat','mhw_ln','mhw_lt','non_ln','non_lt');
all_non_ln=non_ln; all_non_lt=non_lt;
all_mhw_ln=mhw_ln; all_mhw_lt=mhw_lt;


for n=1:length(non_ln(:,1));
    if non_ln(n,1)>128 & non_ln(n,1)<180 & non_lt(n,1)>5 & non_lt(n,1)<20
        all_non_ln(n,1)=NaN; all_non_lt(n,1)=NaN; 
    end
end
for n=1:length(mhw_ln(:,1));
    if mhw_ln(n,1)>128 & mhw_ln(n,1)<180 & mhw_lt(n,1)>5 & mhw_lt(n,1)<20
        all_mhw_ln(n,1)=NaN; all_mhw_lt(n,1)=NaN; 
    end
end
clear mhw_* non_*;
all_mhw_ln=rmmissing(all_mhw_ln); all_mhw_lt=rmmissing(all_mhw_lt);
all_non_ln=rmmissing(all_non_ln); all_non_lt=rmmissing(all_non_lt);

load('D:\2023_article_fig\ver_jun\final_genesis.mat','mhw_ln','mhw_lt','non_ln','non_lt');

for n=1:length(mhw_ln(:,1))
    if mhw_lt(n,1)<5
        mhw_ln(n,1)=NaN; mhw_lt(n,1)=NaN;
    end
end

for n=1:length(non_ln(:,1))
    if non_lt(n,1)<5
        non_ln(n,1)=NaN; non_lt(n,1)=NaN;
    end
end
%% ATL
load('C:\Users\hychoi\Desktop\atl_tc\org_lmi_ge.mat','mhw_ge','non_ge');

for n=1:length(non_ge(:,1));
    if non_ge(n,1)>-80 & non_ge(n,1)<-17 & non_ge(n,2)>10 & non_ge(n,2)<20
        non_ge(n,:)=NaN; 
    end
end
non_ge=rmmissing(non_ge);

for n=1:length(mhw_ge(:,1));
    if mhw_ge(n,1)>-80 & mhw_ge(n,1)<-17 & mhw_ge(n,2)>10 & mhw_ge(n,2)<20
        mhw_ge(n,:)=NaN; 
    end
end
mhw_ge=rmmissing(mhw_ge);

load('D:\2023_article_fig\ver_jun\atl_final_genesis.mat','atl_mhw_ln','atl_mhw_lt','atl_non_ln','atl_non_lt');
atl_non_ln=atl_non_ln-360;
atl_mhw_ln=atl_mhw_ln-360;


%%
close all; clc; 
fig=figure; 
% set(fig,'Position', [80, 50, 1229/1.0, 405/1.0]);
set(fig,'Position', [80, 50, 1029/1.0, 605/1.0]);

a(1)=subplot(2,2,1) 
m_proj('Miller','lat',[0 50] ,'lon', [100 185]);
m_coast('patch',[.7 .7 .7],'edgecolor','k'); hold on;
m_grid('ticklength',0.01,'tickdir','out','ytick',[0:10:50],'xtick',[100:20:180],'linestyle','none','linewidth',0.1,'tickdir','out','linewidth',1.5,'fontsize',15);
for n=1:length(all_non_ln(:,1))
     m_plot(all_non_ln(n,1),all_non_lt(n,1),'marker','.','color',[0.4010 0.750 0.9330],'markersize',13);
      hold on;
end
for n=1:length(all_mhw_ln(:,1))
     m_plot(all_mhw_ln(n,1),all_mhw_lt(n,1),'marker','.','color',[0.9330 0.550 0.401],'markersize',13);
      hold on;
end
hold on; 
for n=1:length(non_ln)
     m_plot(non_ln(n,1),non_lt(n,1),'marker','.','color','b','markersize',13);
      hold on;
end
for n=1:length(mhw_ln)
     m_plot(mhw_ln(n,1),mhw_lt(n,1),'marker','.','color','r','markersize',13);
      hold on;
end

bn_lo=[128 128 140 150 160 170 180 180 170 160 150 140 128 ];
  bn_lat=[5 20 20 20 20 20 20 5 5 5 5 5 5];
m_line(bn_lo,bn_lat,'linestyle','-','linewidth',1.5,'color','k');
title('a) WNP TCs genesis','fontsize',20);


a(2)=subplot(2,2,2) 
m_proj('Miller','lat',[0 50] ,'lon', [-110 -10]);
m_coast('patch',[.7 .7 .7],'edgecolor','k'); hold on;
m_grid('ticklength',0.01,'tickdir','out','ytick',[0:10:50],'xtick',[-120:20:0],'linestyle','none','linewidth',0.1,'tickdir','out','linewidth',1.5,'fontsize',15);

for n=1:length(non_ge(:,1))
     m_plot(non_ge(n,1),non_ge(n,2),'marker','.','color',[0.4010 0.750 0.9330],'markersize',13);
      hold on;
end


for n=1:length(mhw_ge(:,1))
     m_plot(mhw_ge(n,1),mhw_ge(n,2),'marker','.','color',[0.9330 0.550 0.401],'markersize',13);
      hold on;
end


hold on; 
for n=1:length(atl_non_ln)
     m_plot(atl_non_ln(n,1),atl_non_lt(n,1),'marker','.','color','b','markersize',13);
      hold on;
end
for n=1:length(atl_mhw_ln)
     m_plot(atl_mhw_ln(n,1),atl_mhw_lt(n,1),'marker','.','color','r','markersize',13);
      hold on;
end
title('b) ATL TCs genesis','fontsize',20);


bn_lo=[-80 -80 -60 -40 -20 -17 -17 -20 -40 -60 -80 ];
  bn_lat=[10 20 20 20 20 20 10 10 10  10 10 ];
  

m_line(bn_lo,bn_lat,'linestyle','-','linewidth',1.5,'color','k');



a(3)=subplot(2,2,3) 
m_proj('Miller','lat',[0 50] ,'lon', [100 185]);
m_coast('patch',[.7 .7 .7],'edgecolor','k'); hold on;
m_grid('ticklength',0.01,'tickdir','out','ytick',[0:10:50],'xtick',[100:20:180],'linestyle','none','linewidth',0.1,'tickdir','out','linewidth',1.5,'fontsize',15);
for n=1:length(wnp_na_lmi_ln(:,1))
     m_plot(wnp_na_lmi_ln(n,1),wnp_na_lmi_lt(n,1),'marker','.','color',[0.4010 0.750 0.9330],'markersize',13);
      hold on;
end
for n=1:length(wnp_a_lmi_ln(:,1))
     m_plot(wnp_a_lmi_ln(n,1),wnp_a_lmi_lt(n,1),'marker','.','color',[0.9330 0.550 0.401],'markersize',13);
      hold on;
end
hold on; 
for n=1:length(wnp_n_lmi_ln)
     m_plot(wnp_n_lmi_ln(n,1),wnp_n_lmi_lt(n,1),'marker','.','color','b','markersize',13);
      hold on;
end
for n=1:length(wnp_m_lmi_ln)
     m_plot(wnp_m_lmi_ln(n,1),wnp_m_lmi_lt(n,1),'marker','.','color','r','markersize',13);
      hold on;
end
title('c) WNP TCs LMI','fontsize',20);


a(4)=subplot(2,2,4) 
m_proj('Miller','lat',[0 50] ,'lon', [-110 -10]);
m_coast('patch',[.7 .7 .7],'edgecolor','k'); hold on;
m_grid('ticklength',0.01,'tickdir','out','ytick',[0:10:50],'xtick',[-120:20:0],'linestyle','none','linewidth',0.1,'tickdir','out','linewidth',1.5,'fontsize',15);

for n=1:length(atl_na_lmi_ln(:,1))
     m_plot(atl_na_lmi_ln(n,1),atl_na_lmi_lt(n,1),'marker','.','color',[0.4010 0.750 0.9330],'markersize',13);
      hold on;
end


for n=1:length(atl_a_lmi_ln(:,1))
     m_plot(atl_a_lmi_ln(n,1),atl_a_lmi_lt(n,1),'marker','.','color',[0.9330 0.550 0.401],'markersize',13);
      hold on;
end


hold on; 
for n=1:length(atl_n_lmi_ln)
     m_plot(atl_n_lmi_ln(n,1),atl_n_lmi_lt(n,1),'marker','.','color','b','markersize',13);
      hold on;
end
for n=1:length(atl_m_lmi_ln)
     m_plot(atl_m_lmi_ln(n,1),atl_m_lmi_lt(n,1),'marker','.','color','r','markersize',13);
      hold on;
end
title('d) ATL TCs LMI','fontsize',20);




  set(a(1),'position',[-.00 .57 .53 .35]);
  set(a(2),'position',[.49 .57 .53 .35]);
  set(a(3),'position',[-.00 .08 .53 .35]);
  set(a(4),'position',[.49 .08 .53 .35]);
% 
% 
% %   % save,
     p_name_r=['C:\Users\hychoi\Desktop\MHW_TC\Fig5_location'];
     print('-dpng','-r850',p_name_r);
