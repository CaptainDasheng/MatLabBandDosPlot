function []=PDosPlotFun3(savefilename)
% global Material
filename=[savefilename, '.csv']; %�����ļ���
delimiterIn = ',';
headerlinesIn = 0;
PhysicsVar = importdata(filename,delimiterIn,headerlinesIn);
PhyPhysicsVar1 = [PhysicsVar(:,1),PhysicsVar(:,5),PhysicsVar(:,9)...
    PhysicsVar(:,11),PhysicsVar(:,15),PhysicsVar(:,3),...
    PhysicsVar(:,7),PhysicsVar(:,11)];
PhyPhysicsVar2 = [PhysicsVar(:,2),PhysicsVar(:,6),PhysicsVar(:,10),...
    PhysicsVar(:,14),PhysicsVar(:,16),PhysicsVar(:,4),...
    PhysicsVar(:,8),PhysicsVar(:,12)];
% PhyPhysicsVar1 = [PhysicsVar(:,1),PhysicsVar(:,3),PhysicsVar(:,5),...
%     PhysicsVar(:,7),PhysicsVar(:,9)];
% PhyPhysicsVar2 = [PhysicsVar(:,2),PhysicsVar(:,4),PhysicsVar(:,6),...
%     PhysicsVar(:,8),PhysicsVar(:,10)];
% �����ݽ���Ԥ�������¹���X�����Y��������d��f���ӱ��μ�����û�в��룬
% ��ʱ���軭��,����ͼ��������Ӧ�ı�
plot(PhyPhysicsVar1,PhyPhysicsVar2);
% Color=['g' 'm' 'b' 'c' 'w' 'r' 'k' 'y'];
% hold on;
% for i=1:8
% plot(PhyPhysicsVar1(:,i),PhyPhysicsVar2(:,i),Color(ceil(i/2)));
% end 
% ysѭ������ָ����ͼ
% get(gca,'ColorOrder')
%���û�ͼ����
% B = ceil(A) rounds the elements of A to 
% the nearest integers greater than or equal to A.
% For complex A, the imaginary and real parts are 
% rounded independently. ȡ�������ο�
axis tight
% ysʹ���������
% axis([0 1 -20 20])
% �趨����ϵ�޶�
set(gca,'Title',text('String',savefilename,'Interpreter','none',...
    'FontName','Times new roman','FontWeight','bold',...
    'Color','k','FontSize',12))
% ָ������ �����ʽ λ��  ���������СΪ��һ��
% set(get(gca,'YLabel'),'String','Density of States(electrons/eV)'...
%     ,'FontSize',15,'FontName','Times new roman','FontWeight','bold')
% set(get(gca,'XLabel'),'String','Energy(eV)'...
%     ,'FontSize',15,'FontName','Times new roman','FontWeight','bold')
%  ָ����Ŀ ��������
% hleg1 = legend('s','p','d','f');
% get(hleg1)
% hleg1 = legend('salpha','palpha','dalpha','falpha',...
%     'sbeta','pbeta','dbeta','fbeta');
%�ƶ�ͼ��
% hleg1 = legend('s','p','d','f','sum');
% set(hleg1,'Location','SouthWest')
% set(hleg1,'Interpreter','none')
% % ָ��ͼ��λ�� ����ģ�� ��legend
% text('String',Material,...
%     'HorizontalAlignment','left',...
%     'FontName','Times new roman','Color','k',...
%     'FontSize',15,'Units','normalized','Position',[0.03 0.97])
% ָ������
end