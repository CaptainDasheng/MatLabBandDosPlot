% �˰汾�޸���ͼ�����ߵ���ɫ���⡣ʹ���˻�Ԫ����cell arrayδ��
function []=PDosPlotFun2c(savefilename)
global Material io jo DosLim
filename=[savefilename, '.csv']; %�����ļ���
delimiterIn = ',';
headerlinesIn = 0;
PhysicsVar = importdata(filename,delimiterIn,headerlinesIn);
% PlotColor={'y','m','c','r','g','b','w','k'};
plot(PhysicsVar(:,1),PhysicsVar(:,2),'k',...
      PhysicsVar(:,3),PhysicsVar(:,4),'k',...
      PhysicsVar(:,5),PhysicsVar(:,6),'c',...
      PhysicsVar(:,7),PhysicsVar(:,8),'c',...
      PhysicsVar(:,9),PhysicsVar(:,10),'g',...
      PhysicsVar(:,11),PhysicsVar(:,12),'g',...
      PhysicsVar(:,13),PhysicsVar(:,14),'r',...
      PhysicsVar(:,15),PhysicsVar(:,16),'r');
% ��ʱ���軭��,����ͼ��������Ӧ�ı�
% Color=['g' 'm' 'b' 'c' 'w' 'r' 'k' 'y'];
% yellow magenta cyan red green blue white black
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
 v(1,1:2)=DosLim;
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
    'Color','k','FontSize',10))
% ָ������ �����ʽ λ��  ���������СΪ��һ��

% ָ��ͼ��λ�� ����ģ�� ��legend
% get(hleg1)
% hleg1 = legend('s','p','d','f');
% hleg1 = legend(' ','s',' ','p',...
%     ' ','d',' ','f');
switch jo-io
    case 1
       set(get(gca,'YLabel'),'String','Density of States(electrons/eV)'...
    ,'FontSize',15,'FontName','Times new roman','FontWeight','bold') 
    %  ָ���������� Ylabel ֻ���м��ͼ�ϼ�
    hleg1 = legend(' ','s',' ','p',...
    ' ','d',' ','f');
    set(hleg1,'Location','West')
    set(hleg1,'Interpreter','none')
    %ָ��ͼ��
    case 3
        set(get(gca,'XLabel'),'String','Energy(eV)'...
    ,'FontSize',10,'FontName','Times new roman','FontWeight','bold')
    %  ָ���������� Xlabel ֻ�����һ����ͼ�ϼ�
    text('String',Material,...
    'HorizontalAlignment','left',...
    'FontName','Times new roman','Color','k',...
    'FontSize',10,'Units','normalized','Position',[0.03 0.97])
    % ָ������
end
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