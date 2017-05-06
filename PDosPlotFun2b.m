% �˰汾�޸���PDos��ͼ��ĸ�ʽ���⣬ͼ�����������޶ȵȵȡ�
function []=PDosPlotFun2b(savefilename)
global Material io jo
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
 v = axis;
 v(1)=-30;v(2)=7.726;
 axis (v)
% % % % v = axis returns a row vector containingscaling factors 
% % % % for the x-, y-, and z-axis. v has four orsix components 
% % % % depending on whether the current axes is 2-D or 3-D, 
% % % % respectively. The returned values are the current axes XLim, 
% % % % Ylim, and ZLim properties.
% axis([0 1 -20 20])
% �趨����ϵ�޶�
set(gca,'Title',text('String',savefilename,'Interpreter','none',...
    'FontName','Times new roman','FontWeight','bold',...
    'Color','k','FontSize',15))
% ָ������ �����ʽ λ��  ���������СΪ��һ��
hleg1 = legend(' ','s',' ','p',...
    ' ','d',' ','f');
set(hleg1,'Location','EastOutside')
set(hleg1,'Interpreter','none')
% ָ��ͼ��λ�� ����ģ�� ��legend
% get(hleg1)
% hleg1 = legend('s','p','d','f');
% hleg1 = legend(' ','s',' ','p',...
%     ' ','d',' ','f');
%�ƶ�ͼ��
switch jo-io
    case 1
       set(get(gca,'YLabel'),'String','Density of States(electrons/eV)'...
    ,'FontSize',15,'FontName','Times new roman','FontWeight','bold') 
    %  ָ���������� Ylabel ֻ���м��ͼ�ϼ�
    case 2
        set(get(gca,'XLabel'),'String','Energy(eV)'...
    ,'FontSize',15,'FontName','Times new roman','FontWeight','bold')
    %  ָ���������� Xlabel ֻ�����һ����ͼ�ϼ�
    case 0
    text('String',Material,...
    'HorizontalAlignment','left',...
    'FontName','Times new roman','Color','k',...
    'FontSize',10,'Units','normalized','Position',[0.03 0.97])
    % ָ������
end
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperSize', [27 15]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'normalized');
set(gcf, 'PaperPosition', [0.03 0.05 0.94 0.9]);
saveas(gcf,savefilename,'png')
% ���ϸ�ʽ�����
end
% ColorOrder=[0    0.4470    0.7410
%     0    0.4470    0.7410
%     0.8500    0.3250    0.0980
%     0.8500    0.3250    0.0980
%     0.9290    0.6940    0.1250
%     0.9290    0.6940    0.1250
%     0.4940    0.1840    0.5560
%     0.4940    0.1840    0.5560
%     0.4660    0.6740    0.1880
%     0.4660    0.6740    0.1880];
% set(groot,'defaultAxesColorOrder',ColorOrder)
% 
% h=groot
% get(h,'defaultAxesColorOrder')
% 
% co=[    0    0.4470    0.7410
%     0.8500    0.3250    0.0980
%     0.9290    0.6940    0.1250
%     0.4940    0.1840    0.5560
%     0.4660    0.6740    0.1880
%     0.3010    0.7450    0.9330
%     0.6350    0.0780    0.1840];
% set(groot,'defaultAxesColorOrder',co)
% ���û�ͼ��ɫĬ������