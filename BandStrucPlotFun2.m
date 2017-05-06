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
function []=BandStrucPlotFun2(savefilename,gap,Position,Label)
global MainPosition Material BandLim
sizepara=size(MainPosition);
sizepara=sizepara(1,2)-1;
filename=[savefilename, '.csv'];
delimiterIn = ',';
headerlinesIn = 0;
BandStr = importdata(filename,delimiterIn,headerlinesIn);
% ��������
BandStra=BandStr(:,1:2); BandStrb=BandStr(:,3:4);
% ys�����е����ݷֳ�����
BandStra2=[];
BandStra1=[0 200;BandStra];
[row,col]=find(BandStra1>100);
row1=[row;row(end)];
for i=1:size(row)-1
    BandStra2(:,i)=BandStra1((row1(i)+1):(row1(i+1)-1),2);
end
BandStra2=[BandStra1(2:row(2)-1,1),BandStra2];
% ys�����е����ݽ����۵�����a
BandStrb2=[];
BandStrb1=[0 200;BandStrb];
[row,col]=find(BandStrb1>100);
row1=[row;row(end)];
for i=1:size(row)-1
    BandStrb2(:,i)=BandStrb1((row1(i)+1):(row1(i+1)-1),2);
end
BandStrb2=[BandStrb1(2:row(2)-1,1),BandStrb2];
% ys�����е����ݽ����۵�����b
plot(BandStra2(:,1),BandStra2(:,2:end),'h-','LineWidth',1,'MarkerSize',2)
hold on;
plot(BandStrb2(:,1),BandStrb2(:,2:end),'h-','LineWidth',1,'MarkerSize',2)
% ys����һ��������
%��ͼ��ָ�� ���� �߿� 
va = axis; %������������
hold on;
plot([0,1],[0,0],'Color','k','LineStyle','-')   %����0����
for i=1:2:sizepara
    plot(MainPosition(1,i:i+1),[va(3),va(4)],...
        'Color','k','LineStyle','--','LineWidth',1)  
end
% ���ܴ��ķָ���
v = axis;
v(1,3:4)=BandLim;
axis (v)
% % v = axis returns a row vector containingscaling factors 
% % for the x-, y-, and z-axis. v has four orsix components 
% % depending on whether the current axes is 2-D or 3-D, 
% % respectively. The returned values are the current axes XLim, 
% % Ylim, and ZLim properties.
set(gca,'Title',text('String',savefilename,'Interpreter','none',...
    'FontName','Times new roman','FontWeight','bold',...
    'Color','k','FontSize',15))
% ,'Units','normalized','Position',[0.5 1.2]    ����Ǳ���λ�õĸ��ӿ���
% ָ������ �����ʽ λ��  ���������СΪ��һ��
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
set(gca,'Units','normalized','Position',[0.10 0.10 0.80 0.80],...
    'TickLength',[0 0.001])
% �趨������Ĵ�С����figureΪ��һ��/����x tick�ĳ���Ϊ0
text('String',['Bandgap is ' num2str(gap) ' eV'],...
    'HorizontalAlignment','right',...
    'FontName','Times new roman','FontWeight','bold','Color','k',...
    'FontSize',15,'Units','normalized','Position',[1 1.03])
text('String',Material,...
    'HorizontalAlignment','left',...
    'FontName','Times new roman','Color','k',...
    'FontSize',15,'Units','normalized','Position',[0.03 0.97])
% ָ������
% ����ָ��˵������
% text('Interpreter','latex',... text����ʹ��Latex����ο�
% 	'String','$$\int_0^x\!\int_y dF(u,v)$$',...
% 	'Position',[.5 .5],...
% 	'FontSize',16)
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperSize', [27 15]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'normalized');
set(gcf, 'PaperPosition', [0.03 0.05 0.94 0.9]);
saveas(gcf,savefilename,'png')
% ���ϸ�ʽ�����
end

