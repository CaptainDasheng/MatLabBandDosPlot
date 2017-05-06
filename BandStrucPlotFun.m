% Position=[0 0.131 0.202 0.333 0.404 0.555 0.626 0.777 0.813 0.889 0.924 1];
% Label={'A' 'L' 'M' 'A' 'H' 'K' 'G' 'K' 'M' 'H' 'L'};
% scatter(BandStr(:,1),BandStr(:,2),'.')
% Following was the previous handling method
% for i=1:820
% if BandStr(i,2)>100;
%    BandStr(i,:)=[];
% end
% end
% 参考调用
% plot(x,y,'--gs',...     线型 与 数据点记号
%     'LineWidth',2,...          线宽
%     'MarkerSize',10,...           记号大小
%     'MarkerEdgeColor','b',...      记号边缘颜色
%     'MarkerFaceColor',[0.5,0.5,0.5])   记号内部颜色
% set(get(gca,'Title'),'Color','k','FontSize',13) 指定标题 及颜色字号
%anotation 指定说明文字（带隙宽度）  四坐标为左下角xywh 以figure归一化
%参考结束
function []=BandStrucPlotFun(savefilename,gap,Position,Label)
global MainPosition Material
sizepara=size(MainPosition);
sizepara=sizepara(1,2)-1;
filename=[savefilename, '.csv'];
delimiterIn = ',';
headerlinesIn = 0;
BandStr = importdata(filename,delimiterIn,headerlinesIn);
BandStr2=[];
BandStr1=[0 200;BandStr];
[row,col]=find(BandStr1>100);
row1=[row;row(end)];
for i=1:size(row)-1
    BandStr2(:,i)=BandStr1((row1(i)+1):(row1(i+1)-1),2);
end
BandStr2=[BandStr1(2:row(2)-1,1),BandStr2];
plot(BandStr2(:,1),BandStr2(:,2:end),'h-','LineWidth',1,'MarkerSize',2)
axis([0 1 -15 15])
%作图并指定 线型 线宽 坐标轴限度
hold on;
plot([0,1],[0,0],'Color','k','LineStyle','-')   %画出0能线
for i=1:2:sizepara
    plot(MainPosition(1,i:i+1),[-15,15],...
        'Color','k','LineStyle','--','LineWidth',1)  
end
set(gca,'Title',text('String',savefilename,'Interpreter','none',...
    'FontName','Times new roman','FontWeight','bold',...
    'Color','k','FontSize',25))
% ,'Units','normalized','Position',[0.5 1.2]    这个是标题位置的附加考虑
% 指定标题 标题格式 位置  以坐标轴大小为归一化
set(get(gca,'YLabel'),'String','Energy/eV','FontSize',15....
    ,'FontName','Times new roman','FontWeight','bold')
set(gca,'Xtick',Position,'XTickLabel',Label,...
     'FontName','Times new roman','FontSize',15,'XGrid','off')
%以上指定标题 y轴标记位置及名称 不画出x轴网格线/画出是on
% 字体 Calibri/Times new roman
% annotation('textbox', [0.2,0.4,0.1,0.1],...
%            'String', 'Straight Line Plot 1 to 10',...
%            'LineStyle','none','FitBoxToText','on',...
%            'HorizontalAlignment','center');
% title的调用格式(title 属于text)
% text(x,y,z,'string','PropertyName',PropertyValue....)
% text的位置以axes归一化
set(gca,'Units','normalized','Position',[0.10 0.10 0.80 0.80],...
    'TickLength',[0 0.001])
% 设定坐标轴的大小，以figure为归一化/并令x tick的长度为0
text('String',['Bandgap is ' num2str(gap) ' eV'],...
    'HorizontalAlignment','right',...
    'FontName','Times new roman','FontWeight','bold','Color','k',...
    'FontSize',15,'Units','normalized','Position',[1 1.03])
text('Interpreter','latex','String',Material,...
    'HorizontalAlignment','left',...
    'FontName','Times new roman','Color','k',...
    'FontSize',15,'Units','normalized','Position',[0.03 0.52])
% 以上指定说明文字
% text('Interpreter','latex',... text函数使用Latex引擎参考
% 	'String','$$\int_0^x\!\int_y dF(u,v)$$',...
% 	'Position',[.5 .5],...
% 	'FontSize',16)
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperSize', [27 15]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'normalized');
set(gcf, 'PaperPosition', [0.03 0.05 0.94 0.9]);
saveas(gcf,savefilename,'png')
% 以上格式化输出
end

