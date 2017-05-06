%数据格式示意 DielectricFunction  and   Absorption coefficient
% DielectricFunction                   Absorption coefficient
%  ErAl      ErAl-VO     ErAl-VAl       ErAl     ErAl-VO   ErAl-VAl
% Re;Im       Re;Im       Re;Im         none       none      none
% Col1234,1  Col1234,2   Col1234,3     Col12,4    Col12,5   Col12,6
%%%%%Color k b r %%%
function []=PubOpticPlotFunc(savefilename)
global MaterialOptic OptLim OpticLegend
%%%%% global Material
%%%%% 物质（暂不需要）  光学性质坐标限 图例（基元列阵，字符串）
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%导入数据%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:3
    filename=[savefilename{i}, '.csv']; %给定文件名
    delimiterIn = ',';
    headerlinesIn = 0;
    PhysicsVara(:,:,i)= importdata(filename,delimiterIn,headerlinesIn);
end
%%%%%%%%%%%%%导入到一个三维矩阵中ijk k来区别不同缺陷%%%%%%%%%%%%%

for i=4:6
    filename=[savefilename{i}, '.csv']; %给定文件名
    delimiterIn = ',';
    headerlinesIn = 0;
    PhysicsVarb(:,:,i-3)= importdata(filename,delimiterIn,headerlinesIn);
end
%%%%%%%%%%%%%导入到一个三维矩阵中ijk k来区别不同缺陷%%%%%%%%%%%%%
%###############开始复介电函数作图#########################
h(1)=figure(1);
%%%%%%%%%%三种缺陷复介电实部作图 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,1,1)
plot(PhysicsVara(:,1,1),PhysicsVara(:,2,1),'k',...
    PhysicsVara(:,1,2),PhysicsVara(:,2,2),'b',...
    PhysicsVara(:,1,3),PhysicsVara(:,2,3),'r')
%%%%%%%%%%%%%%%作图 %%%%%%%%%%%%%%%
 %$$$$$$特殊需要$$$$$$$
 axis tight;
 %$$$$$$特殊需要$$$$$$$
 v = axis;
 v(1,1:2)=OptLim;
 %$$$$$$特殊需要$$$$$$$
 v(1,4)=10;
 %$$$$$$特殊需要$$$$$$$
 axis (v)
%%%%指定坐标范围
% set(gca,'Title',text('String',savefilename,'Interpreter','none',...
%     'FontName','Times new roman','FontWeight','bold',...
%     'Color','k','FontSize',15))
% 指定标题 标题格式 位置  以坐标轴大小为归一化
set(get(gca,'YLabel'),'String','\epsilon_1'...
    ,'FontSize',15,'FontName','Times new roman',...
    'FontWeight','bold','Interpreter','tex')
set(get(gca,'XLabel'),'String','Frequency（eV）'...
    ,'FontSize',10,'FontName','Times new roman','FontWeight','bold')
%  指定题目 纵横坐标标记
text('String','(a)',...
    'Interpreter','tex','HorizontalAlignment','left',...
    'FontName','Times new roman','FontWeight','bold','Color','k',...
    'FontSize',15,'Units','normalized','Position',[0.02 0.9])
% text('String',Material,...
%     'HorizontalAlignment','left',...
%     'FontName','Times new roman','Color','k',...
%     'FontSize',15,'Units','normalized','Position',[0.03 0.97])
% 指定物质化学名称AlN
hleg1 = legend(OpticLegend);
set(hleg1,'Location','NorthEast')
set(hleg1,'Interpreter','tex')
% 指定图例即legend%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%复介电实部作图结束%%%%%%%%%%%%%%%%

%##############三种缺陷复介电虚部作图 ###################
subplot(2,1,2)
plot(PhysicsVara(:,3,1),PhysicsVara(:,4,1),'k',...
    PhysicsVara(:,3,2),PhysicsVara(:,4,2),'b',...
    PhysicsVara(:,3,3),PhysicsVara(:,4,3),'r')
%%%%%%%%%%作图 %%%%%%%%%%%%%%%%%%%%%%%
 %$$$$$$特殊需要$$$$$$$
 axis tight;
 %$$$$$$特殊需要$$$$$$$
 v = axis;
 v(1,1:2)=OptLim;
 %$$$$$$特殊需要$$$$$$$
 v(1,4)=10;
 %$$$$$$特殊需要$$$$$$$
 axis (v)
%%%%指定坐标范围
% set(gca,'Title',text('String',savefilename,'Interpreter','none',...
%     'FontName','Times new roman','FontWeight','bold',...
%     'Color','k','FontSize',15))
% 指定标题 标题格式 位置  以坐标轴大小为归一化
set(get(gca,'YLabel'),'String','\epsilon_2'...
    ,'FontSize',15,'FontName','Times new roman',...
    'FontWeight','bold','Interpreter','tex')
set(get(gca,'XLabel'),'String','Frequency（eV）'...
    ,'FontSize',10,'FontName','Times new roman','FontWeight','bold')
%  指定题目 纵横坐标标记
text('String','(b)',...
    'Interpreter','tex','HorizontalAlignment','left',...
    'FontName','Times new roman','FontWeight','bold','Color','k',...
    'FontSize',15,'Units','normalized','Position',[0.02 0.9])
% text('String',Material,...
%     'HorizontalAlignment','left',...
%     'FontName','Times new roman','Color','k',...
%     'FontSize',15,'Units','normalized','Position',[0.03 0.97])
% 指定物质化学名称AlN
hleg1 = legend(OpticLegend);
set(hleg1,'Location','NorthEast')
set(hleg1,'Interpreter','tex')
% 指定图例即legend
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%复介电虚部作图结束%%%%%%%%%%%%%%%%%%%%%
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperSize', [27 15]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'normalized');
set(gcf, 'PaperPosition', [0.03 0.05 0.94 0.9]);
saveas(gcf,[MaterialOptic 'Dielect'],'png')
%以上格式化输出

%###############开始吸收系数作图######################
h(2)=figure(2);

plot(PhysicsVarb(:,1,1),PhysicsVarb(:,2,1),'k',...
    PhysicsVarb(:,1,2),PhysicsVarb(:,2,2),'b',...
    PhysicsVarb(:,1,3),PhysicsVarb(:,2,3),'r')
%%%%只有两列
 v = axis;
 v(1,1:2)=OptLim;
 axis (v)
%%%%指定坐标范围
% set(gca,'Title',text('String',savefilename,'Interpreter','none',...
%     'FontName','Times new roman','FontWeight','bold',...
%     'Color','k','FontSize',15))
% 指定标题 标题格式 位置  以坐标轴大小为归一化
set(get(gca,'YLabel'),'String','Absorption'...
    ,'FontSize',15,'FontName','Times new roman',...
    'FontWeight','bold','Interpreter','tex')
set(get(gca,'XLabel'),'String','Frequency（eV）'...
    ,'FontSize',15,'FontName','Times new roman','FontWeight','bold')
%  指定题目 纵横坐标标记
% text('String',Material,...
%     'HorizontalAlignment','left',...
%     'FontName','Times new roman','Color','k',...
%     'FontSize',15,'Units','normalized','Position',[0.03 0.97])
% 指定物质化学名称AlN
hleg1 = legend(OpticLegend);
set(hleg1,'Location','NorthEast')
set(hleg1,'Interpreter','tex')
% 指定图例即legend%%%%%%%%%%%
%格式化输出%%%%
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperSize', [27 15]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'normalized');
set(gcf, 'PaperPosition', [0.03 0.05 0.94 0.9]);
saveas(gcf,[MaterialOptic 'Absorption'],'png')
%格式化输出结束%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%####################吸收系数作图结束###################
%%%%%%%%%保存MatLab作图文件%%%%%%
savefig(h,[MaterialOptic 'Optic.fig']);
%%%保存完毕
end