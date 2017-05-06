function []=OpticalProPlotFun(savefilename)
global Material OptLim
filename=[savefilename, '.csv']; %给定文件名
delimiterIn = ',';
headerlinesIn = 0;
PhysicsVar = importdata(filename,delimiterIn,headerlinesIn);
plot([PhysicsVar(:,1),PhysicsVar(:,3)],...
    [PhysicsVar(:,2),PhysicsVar(:,4)])
% ys对物理量作图
 v = axis;
 v(1,1:2)=OptLim;
 axis (v)
% ys使坐标轴紧致
%调用画图函数
% axis([0 27 -2.2 8.2])
set(gca,'Title',text('String',savefilename,'Interpreter','none',...
    'FontName','Times new roman','FontWeight','bold',...
    'Color','k','FontSize',15))
% 指定标题 标题格式 位置  以坐标轴大小为归一化
set(get(gca,'YLabel'),'String','Dielectric Function'...
    ,'FontSize',15,'FontName','Times new roman','FontWeight','bold')
set(get(gca,'XLabel'),'String','Frequency（eV）'...
    ,'FontSize',15,'FontName','Times new roman','FontWeight','bold')
%  指定题目 纵横坐标标记
text('String',Material,...
    'HorizontalAlignment','left',...
    'FontName','Times new roman','Color','k',...
    'FontSize',15,'Units','normalized','Position',[0.03 0.97])
% 指定物质化学名称AlN
hleg1 = legend('Re(Epsilon)','Im(Epsilon)');
set(hleg1,'Location','NorthEast')
set(hleg1,'Interpreter','none')
% 指定图例即legend
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperSize', [27 15]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'normalized');
set(gcf, 'PaperPosition', [0.03 0.05 0.94 0.9]);
saveas(gcf,savefilename,'png')
%以上格式化输出
end
%set(gcf,'Units','pixels','OuterPosition',[0 0 1366 768],...
%     'PaperUnits','inches','PaperType','A4','PaperOrientation','landscape','PaperSize',[13.075 7.351])
%'PaperSize',[13.075 7.351],'PaperOrientation', 'portrait'
%以上两句用以全屏化窗口作图以及全屏化打印
% pause(2)%等待窗口张开
% set(gca,'PaperUnits','inches','PaperSize',[15 13])