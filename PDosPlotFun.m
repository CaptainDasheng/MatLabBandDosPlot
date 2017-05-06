function []=PDosPlotFun(savefilename)
global Material
filename=[savefilename, '.csv']; %�����ļ���
delimiterIn = ',';
headerlinesIn = 0;
PhysicsVar = importdata(filename,delimiterIn,headerlinesIn);
PhyPhysicsVar1 = [PhysicsVar(:,1),PhysicsVar(:,3),PhysicsVar(:,9)];
PhyPhysicsVar2 = [PhysicsVar(:,2),PhysicsVar(:,4),PhysicsVar(:,10)];
% PhyPhysicsVar1 = [PhysicsVar(:,1),PhysicsVar(:,3),PhysicsVar(:,5),...
%     PhysicsVar(:,7),PhysicsVar(:,9)];
% PhyPhysicsVar2 = [PhysicsVar(:,2),PhysicsVar(:,4),PhysicsVar(:,6),...
%     PhysicsVar(:,8),PhysicsVar(:,10)];
% �����ݽ���Ԥ�������¹���X�����Y��������d��f���ӱ��μ�����û�в��룬
% ��ʱ���軭��,����ͼ��������Ӧ�ı�
plot(PhyPhysicsVar1,PhyPhysicsVar2)
%���û�ͼ���� 
set(gca,'Title',text('String',savefilename,'Interpreter','none',...
    'FontName','Times new roman','FontWeight','bold',...
    'Color','k','FontSize',25))
% ָ������ �����ʽ λ��  ���������СΪ��һ��
set(get(gca,'YLabel'),'String','Density of States(electrons/eV)'...
    ,'FontSize',15,'FontName','Times new roman','FontWeight','bold')
set(get(gca,'XLabel'),'String','Energy(eV)'...
    ,'FontSize',15,'FontName','Times new roman','FontWeight','bold')
%  ָ����Ŀ ��������
% text('String',savefilename,'Interpreter','none',...
%     'HorizontalAlignment','left',...
%     'FontName','Times new roman','Color','k',...
%     'FontSize',15,'Units','normalized','Position',[0.03 0.97])
% ָ������Al/N/Total ����title��ͬ�����Ҳ���
%
hleg1 = legend('s','p','sum');
% ����d��f���ӱ��μ�����û�в��룬��ʱ���軭��,
% hleg1 = legend('s','p','d','f','sum');
set(hleg1,'Location','NorthEast')
set(hleg1,'Interpreter','none')
% ָ��ͼ����legend
text('String',Material,...
    'HorizontalAlignment','left',...
    'FontName','Times new roman','Color','k',...
    'FontSize',15,'Units','normalized','Position',[0.03 0.97])
% ָ������

set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperSize', [27 15]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'normalized');
set(gcf, 'PaperPosition', [0.03 0.05 0.94 0.9]);
saveas(gcf,savefilename,'png')
% ���ϸ�ʽ�����
end