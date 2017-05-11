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
function []=BandStrucPlotFun4(savefilename,Position,Label)
global Material MainPosition BandLim io ko ArrowPosit
global Translationup Translationdown
sizepara=size(MainPosition);
sizepara=sizepara(1,2)-1;
filename=[savefilename '.csv'];
delimiterIn = ',';
headerlinesIn = 0;
BandStr = importdata(filename,delimiterIn,headerlinesIn);
% 导入数据
    switch ko-io
        case 0
BandStra=BandStr(:,1:2);
% ys对四列的数据分成两列 套用原先的程序分别处理
BandStra1=[0 200;BandStra];
[row,col]=find(BandStra1>100);
row1=[row;row(end)];
%%%%%适当的标记能带数据折断点
% %%%%!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
% BandStra2=zeros(40,350);%预分配内存，提高速度
% %%%%!!!!!!!!!!!!!!!!!可能需要修改!!!!!!!!!!!!!!!!!!!!
for i=1:size(row)-1
    BandStra2(:,i)=BandStra1((row1(i)+1):(row1(i+1)-1),2);
end
% ys对两列的数据进行折叠操作
BandStra2=BandStra2+Translationup;%BandTranslationup的简写
%%%%ys对能带数据进行适当平移变换
BandStra2=[BandStra1(2:row(2)-1,1),BandStra2];
% ys加上首行
%%%%%%%%%%%%%%%%%画图开始%%%%%%%%%%%%%%%%%%%%%%%%%%%%
l=size(BandStra2);
subplot(1,2,1)
hold on;
%%%%###############关键能带作图部分#####################
for ll=2:l(2)
plot(BandStra2(:,1),BandStra2(:,ll),'h-','LineWidth',1,'MarkerSize',2,...
    'Color','b')
end
%################################################
va = axis; %坐标轴上下限
v = axis;
v(1,3:4)=BandLim;
axis (v)
plot([0,1],[0,0],'Color','k','LineStyle','-')   %画出0能线
for i=1:2:sizepara
    plot(MainPosition(1,i:i+1),[va(3),va(4)],...
        'Color','k','LineStyle','--','LineWidth',1)  
end
% 画能带的分割线
% % v = axis returns a row vector containingscaling factors 
% % for the x-, y-, and z-axis. v has four orsix components 
% % depending on whether the current axes is 2-D or 3-D, 
% % respectively. The returned values are the current axes XLim, 
% % Ylim, and ZLim properties.
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
set(gca,'TickLength',[0.01 0.01])
% 设定坐标轴的大小，以figure为归一化/并令x tick的长度为0
text('String','\uparrow',...
    'Interpreter','tex','HorizontalAlignment','left',...
    'FontName','Times new roman','FontWeight','bold','Color','k',...
    'FontSize',20,'Units','normalized','Position',ArrowPosit)
ArrowPosit1=ArrowPosit+[0 0.20];
text('String',Material,...
    'Interpreter','tex','HorizontalAlignment','left',...
    'FontName','Times new roman','FontWeight','bold','Color','k',...
    'FontSize',15,'Units','normalized','Position',ArrowPosit1)
ArrowPosit1=ArrowPosit+[0 0.10];
text('String','(a)',...
    'Interpreter','tex','HorizontalAlignment','left',...
    'FontName','Times new roman','FontWeight','bold','Color','k',...
    'FontSize',15,'Units','normalized','Position',ArrowPosit1)
% 以上指定说明文字
% text('Interpreter','latex',... text函数使用Latex引擎参考
% 	'String','$$\int_0^x\!\int_y dF(u,v)$$',...
% 	'Position',[.5 .5],...
% 	'FontSize',16)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        case 1
BandStrb=BandStr(:,3:4);
BandStrb1=[0 200;BandStrb];
[row,col]=find(BandStrb1>100);
row1=[row;row(end)];
% %%%%!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
% BandStrb2=zeros(40,350);%预分配内存，提高速度
% %%%%!!!!!!!!!!!!!!!!!可能需要修改!!!!!!!!!!!!!!!!!!!!
for i=1:size(row)-1
    BandStrb2(:,i)=BandStrb1((row1(i)+1):(row1(i+1)-1),2);
end
% ys对两列的数据进行折叠操作b
BandStrb2=BandStrb2+Translationdown;%BandTranslationdown的简写
%%%%ys对能带数据进行适当平移变换
BandStrb2=[BandStrb1(2:row(2)-1,1),BandStrb2];
%%%%补充首列x轴数据
%##############################
l=size(BandStrb2);
subplot(1,2,2)
hold on;
for ll=2:l(2)
plot(BandStrb2(:,1),BandStrb2(:,ll),'h-','LineWidth',1,'MarkerSize',2,...
    'Color','b')
end
%#######################
va = axis;
v = axis;
v(1,3:4)=BandLim;
axis (v)
% % v = axis returns a row vector containingscaling factors 
plot([0,1],[0,0],'Color','k','LineStyle','-')   %画出0能线
for i=1:2:sizepara
    plot(MainPosition(1,i:i+1),[va(3),va(4)],...
        'Color','k','LineStyle','--','LineWidth',1)  
end
% 画能带的分割线
set(gca,'Xtick',Position,'XTickLabel',Label,...
     'FontName','Times new roman','FontSize',15,'XGrid','off')
 set(gca,'YAxisLocation','right')
%以上指定标题 y轴标记位置及名称 不画出x轴网格线/画出是on
% 字体 Calibri/Times new roman
% annotation('textbox', [0.2,0.4,0.1,0.1],...
%            'String', 'Straight Line Plot 1 to 10',...
%            'LineStyle','none','FitBoxToText','on',...
%            'HorizontalAlignment','center');
% title的调用格式(title 属于text)
% text(x,y,z,'string','PropertyName',PropertyValue....)
% text的位置以axes归一化
% 设定坐标轴的大小，以figure为归一化/并令x tick的长度为0
set(gca,'TickLength',[0.01 0.01])
%%%刻线长度
text('String','\downarrow',...
    'Interpreter','tex','HorizontalAlignment','left',...
    'FontName','Times new roman','FontWeight','bold','Color','k',...
    'FontSize',20,'Units','normalized','Position',ArrowPosit)
ArrowPosit1=ArrowPosit+[0 0.10];
text('String','(b)',...
    'Interpreter','tex','HorizontalAlignment','left',...
    'FontName','Times new roman','FontWeight','bold','Color','k',...
    'FontSize',15,'Units','normalized','Position',ArrowPosit1)
% 以上指定说明文字
% text('Interpreter','latex',... text函数使用Latex引擎参考
% 	'String','$$\int_0^x\!\int_y dF(u,v)$$',...
% 	'Position',[.5 .5],...
% 	'FontSize',16)
%#######格式化输出
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperSize', [27 15]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'normalized');
set(gcf, 'PaperPosition', [0.03 0.05 0.94 0.9]);
saveas(gcf,savefilename,'png')
    % 以上格式化输出
    end
end

