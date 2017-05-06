% 此版本修复了图像曲线的颜色问题。使用了基元列阵cell array未遂
%数据格式示意1-spin-up 2-spin-down xy xy xy ...
% s1   s2    p1    p2   d1       d2      f1       f2
% 1,2  3,4  5,6   7,8   9,10   11，12   13，14   15，16
% k    k     b     b     c        c       r        r %% Color kbcr
% for lorbitnum==2 plot s,p ; lorbitnum==3 plot s,p,,f
function []=PDosPlotFun2d(savefilename,lorbitnum)
% global Material
global MaterialElement Material io jo DosLim
global BandTranslation
filename=[savefilename, '.csv']; %给定文件名
delimiterIn = ',';
headerlinesIn = 0;
PhysicsVar = importdata(filename,delimiterIn,headerlinesIn);
% PlotColor={'y','m','c','r','g','b','w','k'};
switch lorbitnum %取值为21 22 3 4 分别代表Al N Er 兼容4轨道
    case 21
     %%%%%%%%%%%能带平移%%%%%%%%%   
    PhysicsVar(:,1)=PhysicsVar(:,1)+BandTranslation;
    PhysicsVar(:,5)=PhysicsVar(:,5)+BandTranslation;
    PhysicsVar(:,3)=PhysicsVar(:,3)+BandTranslation;
    PhysicsVar(:,7)=PhysicsVar(:,7)+BandTranslation;
    %%%%%%%%%%%%%%能带平移%%%%%%%%%%%
plot(PhysicsVar(:,1),PhysicsVar(:,2),'k',...
      PhysicsVar(:,5),PhysicsVar(:,6),'b',...
      PhysicsVar(:,3),PhysicsVar(:,4),'k',...
      PhysicsVar(:,7),PhysicsVar(:,8),'b');
    %############  
    ME=MaterialElement{1};
    hleg1 = legend([ME ' s'],[ME ' p']);
    set(hleg1,'Location','West')
    set(hleg1,'Interpreter','none')
    %#####指定图例####
     axis tight
     v = axis;
     v(1,1:2)=DosLim;
     axis (v)
     set(gca,'TickLength',[0 0.001])
     %画出0能线，竖线
     hold on;
     plot([0,0],v(1,3:4),'Color','k','LineStyle','--')
     %画出0能线，竖线
     %#######使图像紧致####################
       case 22
    %%%%%%%%%%%能带平移%%%%%%%%%   
    PhysicsVar(:,1)=PhysicsVar(:,1)+BandTranslation;
    PhysicsVar(:,5)=PhysicsVar(:,5)+BandTranslation;
    PhysicsVar(:,3)=PhysicsVar(:,3)+BandTranslation;
    PhysicsVar(:,7)=PhysicsVar(:,7)+BandTranslation;
    %%%%%%%%%%%%%%能带平移%%%%%%%%%%%    
         
plot(PhysicsVar(:,1),PhysicsVar(:,2),'k',...
      PhysicsVar(:,5),PhysicsVar(:,6),'b',...
      PhysicsVar(:,3),PhysicsVar(:,4),'k',...
      PhysicsVar(:,7),PhysicsVar(:,8),'b');
    %############  
    ME=MaterialElement{2};
    hleg1 = legend([ME ' s'],[ME ' p']);
    set(hleg1,'Location','West')
    set(hleg1,'Interpreter','none')
    %#####指定图例####
     axis tight
     v = axis;
     v(1,1:2)=DosLim;
     axis (v)
     set(gca,'TickLength',[0 0.001])
     %画出0能线，竖线
     hold on;
     plot([0,0],v(1,3:4),'Color','k','LineStyle','--')
     %画出0能线，竖线
     %#######使图像紧致####################
     
    case 3
    %%%%%%%%%%%能带平移%%%%%%%%%   
    PhysicsVar(:,1)=PhysicsVar(:,1)+BandTranslation;
    PhysicsVar(:,5)=PhysicsVar(:,5)+BandTranslation;
    PhysicsVar(:,13)=PhysicsVar(:,13)+BandTranslation;
    PhysicsVar(:,3)=PhysicsVar(:,3)+BandTranslation;
    PhysicsVar(:,7)=PhysicsVar(:,7)+BandTranslation;
    PhysicsVar(:,15)=PhysicsVar(:,15)+BandTranslation;
    %%%%%%%%%%%%%%能带平移%%%%%%%%%%%   
        
plot(PhysicsVar(:,1),PhysicsVar(:,2),'k',...
      PhysicsVar(:,5),PhysicsVar(:,6),'b',...
      PhysicsVar(:,13),PhysicsVar(:,14),'r',...
      PhysicsVar(:,3),PhysicsVar(:,4),'k',...
      PhysicsVar(:,7),PhysicsVar(:,8),'b',...
      PhysicsVar(:,15),PhysicsVar(:,16),'r');
      %############  
    ME=MaterialElement{3};
    hleg1 = legend([ME ' s'],[ME ' p'],[ME ' f']);
    %图例合成
    set(hleg1,'Location','West')
    set(hleg1,'Interpreter','none')
    %#####指定图例####
     axis tight
     v = axis;
     v(1,1:2)=DosLim;
     axis (v)
     set(gca,'TickLength',[0 0.001])
     %画出0能线，竖线
     hold on;
     plot([0,0],v(1,3:4),'Color','k','LineStyle','--')
     %画出0能线，竖线
     %#######使图像紧致####################
     
      case 4
       %%%%%%%%%%%能带平移%%%%%%%%%    
      PhysicsVar(:,1)=PhysicsVar(:,1)+BandTranslation;    
      PhysicsVar(:,5)=PhysicsVar(:,5)+BandTranslation;
      PhysicsVar(:,9)=PhysicsVar(:,9)+BandTranslation;
      PhysicsVar(:,13)=PhysicsVar(:,13)+BandTranslation;
      PhysicsVar(:,3)=PhysicsVar(:,3)+BandTranslation;
      PhysicsVar(:,7)=PhysicsVar(:,7)+BandTranslation;
      PhysicsVar(:,11)=PhysicsVar(:,11)+BandTranslation;
      PhysicsVar(:,15)=PhysicsVar(:,15)+BandTranslation;
      %%%%%%%%%%%能带平移%%%%%%%%% 
plot(PhysicsVar(:,1),PhysicsVar(:,2),'k',...
      PhysicsVar(:,5),PhysicsVar(:,6),'b',...
      PhysicsVar(:,9),PhysicsVar(:,10),'c',...
      PhysicsVar(:,13),PhysicsVar(:,14),'r',...
      PhysicsVar(:,3),PhysicsVar(:,4),'k',...
      PhysicsVar(:,7),PhysicsVar(:,8),'b',...
      PhysicsVar(:,11),PhysicsVar(:,12),'c',...
      PhysicsVar(:,15),PhysicsVar(:,16),'r');
      %############  
    hleg1 = legend('Tot s','Tot p','Tot d','Tot f');
    set(hleg1,'Location','West')
    set(hleg1,'Interpreter','none')
    %#####指定图例####
    text('String',Material,'Interpreter','none',...
    'HorizontalAlignment','left','Interpreter','tex',...
    'FontName','Times new roman','Color','k',...
    'FontSize',15,'Units','normalized','Position',[0.03 1.05])
    %指定物质
     axis tight
     v = axis;
     v(1,1:2)=DosLim;
     axis (v)
     set(gca,'TickLength',[0 0.001])
    %画出0能线，竖线
     hold on;
     plot([0,0],v(1,3:4),'Color','k','LineStyle','--')
     %画出0能线，竖线
     %#######使图像紧致####################
    
end
% Color=['g' 'm' 'b' 'c' 'w' 'r' 'k' 'y'];
% yellow magenta cyan red green blue white black
%  axis tight
%  v = axis;
%  v(1,1:2)=DosLim;
%  axis (v)
%  set(gca,'TickLength',[0 0.001])
% % % % v = axis returns a row vector containingscaling factors 
% % % % for the x-, y-, and z-axis. v has four orsix components 
% % % % depending on whether the current axes is 2-D or 3-D, 
% % % % respectively. The returned values are the current axes XLim, 
% % % % Ylim, and ZLim properties.
% axis([0 1 -20 20])
% 设定坐标系限度
% set(gca,'Title',text('String',savefilename,'Interpreter','none',...
%     'FontName','Times new roman','FontWeight','bold',...
%     'Color','k','FontSize',10))
% 指定标题 标题格式 位置  以坐标轴大小为归一化

% 指定图例位置 翻译模块 即legend
% get(hleg1)
% hleg1 = legend('s','p','d','f');
% hleg1 = legend(' ','s',' ','p',...
%     ' ','d',' ','f');

switch jo-io
    case 1
       set(get(gca,'YLabel'),'String','Density of States(electrons/eV)'...
    ,'FontSize',15,'FontName','Times new roman','FontWeight','bold') 
    %  指定纵坐标标记 Ylabel 只在中间分图上加
    case 3
        set(get(gca,'XLabel'),'String','Energy(eV)'...
    ,'FontSize',15,'FontName','Times new roman','FontWeight','bold')
    %  指定横坐标标记 Xlabel 只在最后一个分图上加
%     text('String',Material,...
%     'HorizontalAlignment','left',...
%     'FontName','Times new roman','Color','k',...
%     'FontSize',10,'Units','normalized','Position',[0.03 0.97])
%     % 指定物质
end
end
% ColorOrder=[0    0.4470    0.7410
%     0    0.4470    0.7410
%     0.8500    0.3250    0.0980
%     0.8500    0.3250    0.0980
%     0.9290    0.6940    0.1250
%     0.9290    0.6940    0.1250
%     0.4940    0.1840    0.5560
%     0.4940    0.1840    0.5560
%     0.4660    0.6740    0.1880
%     0.4660    0.6740    0.1880];
% set(groot,'defaultAxesColorOrder',ColorOrder)
% 
% h=groot
% get(h,'defaultAxesColorOrder')
% 
% co=[    0    0.4470    0.7410
%     0.8500    0.3250    0.0980
%     0.9290    0.6940    0.1250
%     0.4940    0.1840    0.5560
%     0.4660    0.6740    0.1880
%     0.3010    0.7450    0.9330
%     0.6350    0.0780    0.1840];
% set(groot,'defaultAxesColorOrder',co)
% 重置画图颜色默认设置