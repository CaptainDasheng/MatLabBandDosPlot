% Position=[0 0.131 0.202 0.333 0.404 0.555 0.626 0.777 0.813 0.889 0.924 1];
% Label={'A' 'L' 'M' 'A' 'H' 'K' 'G' 'K' 'M' 'H' 'L'};
% scatter(BandStr(:,1),BandStr(:,2),'.')
% Following was the previous handling method
% for i=1:820
% if BandStr(i,2)>100;
%    BandStr(i,:)=[];
% end
% end
% �ο�����
% plot(x,y,'--gs',...     ���� �� ���ݵ�Ǻ�
%     'LineWidth',2,...          �߿�
%     'MarkerSize',10,...           �ǺŴ�С
%     'MarkerEdgeColor','b',...      �Ǻű�Ե��ɫ
%     'MarkerFaceColor',[0.5,0.5,0.5])   �Ǻ��ڲ���ɫ
% set(get(gca,'Title'),'Color','k','FontSize',13) ָ������ ����ɫ�ֺ�
%anotation ָ��˵�����֣���϶��ȣ�  ������Ϊ���½�xywh ��figure��һ��
%�ο�����
function []=BandStrucPlotFun4(savefilename,Position,Label)
global Material MainPosition BandLim io ko ArrowPosit
global Translationup Translationdown
sizepara=size(MainPosition);
sizepara=sizepara(1,2)-1;
filename=[savefilename '.csv'];
delimiterIn = ',';
headerlinesIn = 0;
BandStr = importdata(filename,delimiterIn,headerlinesIn);
% ��������
    switch ko-io
        case 0
BandStra=BandStr(:,1:2);
% ys�����е����ݷֳ����� ����ԭ�ȵĳ���ֱ���
BandStra1=[0 200;BandStra];
[row,col]=find(BandStra1>100);
row1=[row;row(end)];
%%%%%�ʵ��ı���ܴ������۶ϵ�
% %%%%!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
% BandStra2=zeros(40,350);%Ԥ�����ڴ棬����ٶ�
% %%%%!!!!!!!!!!!!!!!!!������Ҫ�޸�!!!!!!!!!!!!!!!!!!!!
for i=1:size(row)-1
    BandStra2(:,i)=BandStra1((row1(i)+1):(row1(i+1)-1),2);
end
% ys�����е����ݽ����۵�����
BandStra2=BandStra2+Translationup;%BandTranslationup�ļ�д
%%%%ys���ܴ����ݽ����ʵ�ƽ�Ʊ任
BandStra2=[BandStra1(2:row(2)-1,1),BandStra2];
% ys��������
%%%%%%%%%%%%%%%%%��ͼ��ʼ%%%%%%%%%%%%%%%%%%%%%%%%%%%%
l=size(BandStra2);
subplot(1,2,1)
hold on;
%%%%###############�ؼ��ܴ���ͼ����#####################
for ll=2:l(2)
plot(BandStra2(:,1),BandStra2(:,ll),'h-','LineWidth',1,'MarkerSize',2,...
    'Color','b')
end
%################################################
va = axis; %������������
v = axis;
v(1,3:4)=BandLim;
axis (v)
plot([0,1],[0,0],'Color','k','LineStyle','-')   %����0����
for i=1:2:sizepara
    plot(MainPosition(1,i:i+1),[va(3),va(4)],...
        'Color','k','LineStyle','--','LineWidth',1)  
end
% ���ܴ��ķָ���
% % v = axis returns a row vector containingscaling factors 
% % for the x-, y-, and z-axis. v has four orsix components 
% % depending on whether the current axes is 2-D or 3-D, 
% % respectively. The returned values are the current axes XLim, 
% % Ylim, and ZLim properties.
set(get(gca,'YLabel'),'String','Energy/eV','FontSize',15....
    ,'FontName','Times new roman','FontWeight','bold')
set(gca,'Xtick',Position,'XTickLabel',Label,...
     'FontName','Times new roman','FontSize',15,'XGrid','off')
%����ָ������ y����λ�ü����� ������x��������/������on
% ���� Calibri/Times new roman
% annotation('textbox', [0.2,0.4,0.1,0.1],...
%            'String', 'Straight Line Plot 1 to 10',...
%            'LineStyle','none','FitBoxToText','on',...
%            'HorizontalAlignment','center');
% title�ĵ��ø�ʽ(title ����text)
% text(x,y,z,'string','PropertyName',PropertyValue....)
% text��λ����axes��һ��
set(gca,'TickLength',[0.01 0.01])
% �趨������Ĵ�С����figureΪ��һ��/����x tick�ĳ���Ϊ0
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
% ����ָ��˵������
% text('Interpreter','latex',... text����ʹ��Latex����ο�
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
% BandStrb2=zeros(40,350);%Ԥ�����ڴ棬����ٶ�
% %%%%!!!!!!!!!!!!!!!!!������Ҫ�޸�!!!!!!!!!!!!!!!!!!!!
for i=1:size(row)-1
    BandStrb2(:,i)=BandStrb1((row1(i)+1):(row1(i+1)-1),2);
end
% ys�����е����ݽ����۵�����b
BandStrb2=BandStrb2+Translationdown;%BandTranslationdown�ļ�д
%%%%ys���ܴ����ݽ����ʵ�ƽ�Ʊ任
BandStrb2=[BandStrb1(2:row(2)-1,1),BandStrb2];
%%%%��������x������
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
plot([0,1],[0,0],'Color','k','LineStyle','-')   %����0����
for i=1:2:sizepara
    plot(MainPosition(1,i:i+1),[va(3),va(4)],...
        'Color','k','LineStyle','--','LineWidth',1)  
end
% ���ܴ��ķָ���
set(gca,'Xtick',Position,'XTickLabel',Label,...
     'FontName','Times new roman','FontSize',15,'XGrid','off')
 set(gca,'YAxisLocation','right')
%����ָ������ y����λ�ü����� ������x��������/������on
% ���� Calibri/Times new roman
% annotation('textbox', [0.2,0.4,0.1,0.1],...
%            'String', 'Straight Line Plot 1 to 10',...
%            'LineStyle','none','FitBoxToText','on',...
%            'HorizontalAlignment','center');
% title�ĵ��ø�ʽ(title ����text)
% text(x,y,z,'string','PropertyName',PropertyValue....)
% text��λ����axes��һ��
% �趨������Ĵ�С����figureΪ��һ��/����x tick�ĳ���Ϊ0
set(gca,'TickLength',[0.01 0.01])
%%%���߳���
text('String','\downarrow',...
    'Interpreter','tex','HorizontalAlignment','left',...
    'FontName','Times new roman','FontWeight','bold','Color','k',...
    'FontSize',20,'Units','normalized','Position',ArrowPosit)
ArrowPosit1=ArrowPosit+[0 0.10];
text('String','(b)',...
    'Interpreter','tex','HorizontalAlignment','left',...
    'FontName','Times new roman','FontWeight','bold','Color','k',...
    'FontSize',15,'Units','normalized','Position',ArrowPosit1)
% ����ָ��˵������
% text('Interpreter','latex',... text����ʹ��Latex����ο�
% 	'String','$$\int_0^x\!\int_y dF(u,v)$$',...
% 	'Position',[.5 .5],...
% 	'FontSize',16)
%#######��ʽ�����
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperSize', [27 15]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'normalized');
set(gcf, 'PaperPosition', [0.03 0.05 0.94 0.9]);
saveas(gcf,savefilename,'png')
    % ���ϸ�ʽ�����
    end
end

