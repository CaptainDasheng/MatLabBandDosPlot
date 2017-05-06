function []=OpticalProPlotFun(savefilename)
global Material OptLim
filename=[savefilename, '.csv']; %�����ļ���
delimiterIn = ',';
headerlinesIn = 0;
PhysicsVar = importdata(filename,delimiterIn,headerlinesIn);
plot([PhysicsVar(:,1),PhysicsVar(:,3)],...
    [PhysicsVar(:,2),PhysicsVar(:,4)])
% ys����������ͼ
 v = axis;
 v(1,1:2)=OptLim;
 axis (v)
% ysʹ���������
%���û�ͼ����
% axis([0 27 -2.2 8.2])
set(gca,'Title',text('String',savefilename,'Interpreter','none',...
    'FontName','Times new roman','FontWeight','bold',...
    'Color','k','FontSize',15))
% ָ������ �����ʽ λ��  ���������СΪ��һ��
set(get(gca,'YLabel'),'String','Dielectric Function'...
    ,'FontSize',15,'FontName','Times new roman','FontWeight','bold')
set(get(gca,'XLabel'),'String','Frequency��eV��'...
    ,'FontSize',15,'FontName','Times new roman','FontWeight','bold')
%  ָ����Ŀ �ݺ�������
text('String',Material,...
    'HorizontalAlignment','left',...
    'FontName','Times new roman','Color','k',...
    'FontSize',15,'Units','normalized','Position',[0.03 0.97])
% ָ�����ʻ�ѧ����AlN
hleg1 = legend('Re(Epsilon)','Im(Epsilon)');
set(hleg1,'Location','NorthEast')
set(hleg1,'Interpreter','none')
% ָ��ͼ����legend
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperSize', [27 15]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'normalized');
set(gcf, 'PaperPosition', [0.03 0.05 0.94 0.9]);
saveas(gcf,savefilename,'png')
%���ϸ�ʽ�����
end
%set(gcf,'Units','pixels','OuterPosition',[0 0 1366 768],...
%     'PaperUnits','inches','PaperType','A4','PaperOrientation','landscape','PaperSize',[13.075 7.351])
%'PaperSize',[13.075 7.351],'PaperOrientation', 'portrait'
%������������ȫ����������ͼ�Լ�ȫ������ӡ
% pause(2)%�ȴ������ſ�
% set(gca,'PaperUnits','inches','PaperSize',[15 13])