function []=DosPlotFun4(savefilename)
global Material DosLim ToSaveFile 
global Translationup Translationdown
filename=[savefilename, '.csv']; %给定文件名
delimiterIn = ',';
headerlinesIn = 0;
PhysicsVar = importdata(filename,delimiterIn,headerlinesIn);
PhyPhysicsVar1 = [PhysicsVar(:,1)+Translationup,...
                    PhysicsVar(:,3)+Translationdown];
PhyPhysicsVar2 = [PhysicsVar(:,2),PhysicsVar(:,4)];
% PhyPhysicsVar1 = [PhysicsVar(:,1),PhysicsVar(:,3),PhysicsVar(:,5),...
%     PhysicsVar(:,7),PhysicsVar(:,9)];
% PhyPhysicsVar2 = [PhysicsVar(:,2),PhysicsVar(:,4),PhysicsVar(:,6),...
%     PhysicsVar(:,8),PhysicsVar(:,10)];
% 对数据进行预处理，重新构成X矩阵和Y矩阵。由于d、f电子本次计算中没有参与，
% 暂时不予画出,下面图例处作相应改变
plot(PhyPhysicsVar1,PhyPhysicsVar2)
%调用画图函数
v = axis;
v(1,1:2)=DosLim;
axis (v)
%画出0线，横线
hold on;
plot(v(1,1:2),[0,0],'Color','k','LineStyle','-')
%画出0线，横线
%画出0能线，竖线
hold on;
plot([0,0],v(1,3:4),'Color','k','LineStyle','--')
 %画出0能线，竖线
% % v = axis returns a row vector containingscaling factors 
% % for the x-, y-, and z-axis. v has four orsix components 
% % depending on whether the current axes is 2-D or 3-D, 
% % respectively. The returned values are the current axes XLim, 
% % Ylim, and ZLim properties.
% ys使坐标轴紧致
% set(gca,'Title',text('String',savefilename,'Interpreter','none',...
%     'FontName','Times new roman','FontWeight','bold',...
%     'Color','k','FontSize',10))
% 指定标题 标题格式 位置  以坐标轴大小为归一化
set(get(gca,'YLabel'),'String','Density of States(electrons/eV)'...
    ,'FontSize',15,'FontName','Times new roman','FontWeight','bold')
set(get(gca,'XLabel'),'String','Energy(eV)'...
    ,'FontSize',15,'FontName','Times new roman','FontWeight','bold')
 %%%指定题目 纵坐标标记
text('String',Material,'Interpreter','none',...
    'HorizontalAlignment','left','Interpreter','tex',...
    'FontName','Times new roman','Color','k',...
    'FontSize',15,'Units','normalized','Position',[0.03 1.05])
% text('String','Total','Interpreter','none',...
%     'HorizontalAlignment','left',...
%     'FontName','Times new roman','Color','k',...
%     'FontSize',15,'Units','normalized','Position',[0.60 1.10])
% 指定总态密度
%
hleg1 = legend('\uparrow Total','\downarrow Total');
% 由于d、f电子本次计算中没有参与，暂时不予画出,
% hleg1 = legend('s','p','d','f','sum');
set(hleg1,'Location','NorthWest')
set(hleg1,'Interpreter','tex')
% 指定图例即legend
    set(gcf, 'PaperUnits', 'centimeters');
    set(gcf, 'PaperSize', [27 15]);
    set(gcf, 'PaperPositionMode', 'manual');
    set(gcf, 'PaperUnits', 'normalized');
    set(gcf, 'PaperPosition', [0.03 0.05 0.94 0.9]);
    saveas(gcf,[ToSaveFile 'Dos Total'],'png')
    % 以上格式化输出
end