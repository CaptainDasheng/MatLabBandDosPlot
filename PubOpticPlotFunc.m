%���ݸ�ʽʾ�� DielectricFunction  and   Absorption coefficient
% DielectricFunction                   Absorption coefficient
%  ErAl      ErAl-VO     ErAl-VAl       ErAl     ErAl-VO   ErAl-VAl
% Re;Im       Re;Im       Re;Im         none       none      none
% Col1234,1  Col1234,2   Col1234,3     Col12,4    Col12,5   Col12,6
%%%%%Color k b r %%%
function []=PubOpticPlotFunc(savefilename)
global MaterialOptic OptLim OpticLegend
%%%%% global Material
%%%%% ���ʣ��ݲ���Ҫ��  ��ѧ���������� ͼ������Ԫ�����ַ�����
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%��������%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:3
    filename=[savefilename{i}, '.csv']; %�����ļ���
    delimiterIn = ',';
    headerlinesIn = 0;
    PhysicsVara(:,:,i)= importdata(filename,delimiterIn,headerlinesIn);
end
%%%%%%%%%%%%%���뵽һ����ά������ijk k������ͬȱ��%%%%%%%%%%%%%

for i=4:6
    filename=[savefilename{i}, '.csv']; %�����ļ���
    delimiterIn = ',';
    headerlinesIn = 0;
    PhysicsVarb(:,:,i-3)= importdata(filename,delimiterIn,headerlinesIn);
end
%%%%%%%%%%%%%���뵽һ����ά������ijk k������ͬȱ��%%%%%%%%%%%%%
%###############��ʼ����纯����ͼ#########################
h(1)=figure(1);
%%%%%%%%%%����ȱ�ݸ����ʵ����ͼ %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,1,1)
plot(PhysicsVara(:,1,1),PhysicsVara(:,2,1),'k',...
    PhysicsVara(:,1,2),PhysicsVara(:,2,2),'b',...
    PhysicsVara(:,1,3),PhysicsVara(:,2,3),'r')
%%%%%%%%%%%%%%%��ͼ %%%%%%%%%%%%%%%
 %$$$$$$������Ҫ$$$$$$$
 axis tight;
 %$$$$$$������Ҫ$$$$$$$
 v = axis;
 v(1,1:2)=OptLim;
 %$$$$$$������Ҫ$$$$$$$
 v(1,4)=10;
 %$$$$$$������Ҫ$$$$$$$
 axis (v)
%%%%ָ�����귶Χ
% set(gca,'Title',text('String',savefilename,'Interpreter','none',...
%     'FontName','Times new roman','FontWeight','bold',...
%     'Color','k','FontSize',15))
% ָ������ �����ʽ λ��  ���������СΪ��һ��
set(get(gca,'YLabel'),'String','\epsilon_1'...
    ,'FontSize',15,'FontName','Times new roman',...
    'FontWeight','bold','Interpreter','tex')
set(get(gca,'XLabel'),'String','Frequency��eV��'...
    ,'FontSize',10,'FontName','Times new roman','FontWeight','bold')
%  ָ����Ŀ �ݺ�������
text('String','(a)',...
    'Interpreter','tex','HorizontalAlignment','left',...
    'FontName','Times new roman','FontWeight','bold','Color','k',...
    'FontSize',15,'Units','normalized','Position',[0.02 0.9])
% text('String',Material,...
%     'HorizontalAlignment','left',...
%     'FontName','Times new roman','Color','k',...
%     'FontSize',15,'Units','normalized','Position',[0.03 0.97])
% ָ�����ʻ�ѧ����AlN
hleg1 = legend(OpticLegend);
set(hleg1,'Location','NorthEast')
set(hleg1,'Interpreter','tex')
% ָ��ͼ����legend%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%�����ʵ����ͼ����%%%%%%%%%%%%%%%%

%##############����ȱ�ݸ�����鲿��ͼ ###################
subplot(2,1,2)
plot(PhysicsVara(:,3,1),PhysicsVara(:,4,1),'k',...
    PhysicsVara(:,3,2),PhysicsVara(:,4,2),'b',...
    PhysicsVara(:,3,3),PhysicsVara(:,4,3),'r')
%%%%%%%%%%��ͼ %%%%%%%%%%%%%%%%%%%%%%%
 %$$$$$$������Ҫ$$$$$$$
 axis tight;
 %$$$$$$������Ҫ$$$$$$$
 v = axis;
 v(1,1:2)=OptLim;
 %$$$$$$������Ҫ$$$$$$$
 v(1,4)=10;
 %$$$$$$������Ҫ$$$$$$$
 axis (v)
%%%%ָ�����귶Χ
% set(gca,'Title',text('String',savefilename,'Interpreter','none',...
%     'FontName','Times new roman','FontWeight','bold',...
%     'Color','k','FontSize',15))
% ָ������ �����ʽ λ��  ���������СΪ��һ��
set(get(gca,'YLabel'),'String','\epsilon_2'...
    ,'FontSize',15,'FontName','Times new roman',...
    'FontWeight','bold','Interpreter','tex')
set(get(gca,'XLabel'),'String','Frequency��eV��'...
    ,'FontSize',10,'FontName','Times new roman','FontWeight','bold')
%  ָ����Ŀ �ݺ�������
text('String','(b)',...
    'Interpreter','tex','HorizontalAlignment','left',...
    'FontName','Times new roman','FontWeight','bold','Color','k',...
    'FontSize',15,'Units','normalized','Position',[0.02 0.9])
% text('String',Material,...
%     'HorizontalAlignment','left',...
%     'FontName','Times new roman','Color','k',...
%     'FontSize',15,'Units','normalized','Position',[0.03 0.97])
% ָ�����ʻ�ѧ����AlN
hleg1 = legend(OpticLegend);
set(hleg1,'Location','NorthEast')
set(hleg1,'Interpreter','tex')
% ָ��ͼ����legend
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%������鲿��ͼ����%%%%%%%%%%%%%%%%%%%%%
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperSize', [27 15]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'normalized');
set(gcf, 'PaperPosition', [0.03 0.05 0.94 0.9]);
saveas(gcf,[MaterialOptic 'Dielect'],'png')
%���ϸ�ʽ�����

%###############��ʼ����ϵ����ͼ######################
h(2)=figure(2);

plot(PhysicsVarb(:,1,1),PhysicsVarb(:,2,1),'k',...
    PhysicsVarb(:,1,2),PhysicsVarb(:,2,2),'b',...
    PhysicsVarb(:,1,3),PhysicsVarb(:,2,3),'r')
%%%%ֻ������
 v = axis;
 v(1,1:2)=OptLim;
 axis (v)
%%%%ָ�����귶Χ
% set(gca,'Title',text('String',savefilename,'Interpreter','none',...
%     'FontName','Times new roman','FontWeight','bold',...
%     'Color','k','FontSize',15))
% ָ������ �����ʽ λ��  ���������СΪ��һ��
set(get(gca,'YLabel'),'String','Absorption'...
    ,'FontSize',15,'FontName','Times new roman',...
    'FontWeight','bold','Interpreter','tex')
set(get(gca,'XLabel'),'String','Frequency��eV��'...
    ,'FontSize',15,'FontName','Times new roman','FontWeight','bold')
%  ָ����Ŀ �ݺ�������
% text('String',Material,...
%     'HorizontalAlignment','left',...
%     'FontName','Times new roman','Color','k',...
%     'FontSize',15,'Units','normalized','Position',[0.03 0.97])
% ָ�����ʻ�ѧ����AlN
hleg1 = legend(OpticLegend);
set(hleg1,'Location','NorthEast')
set(hleg1,'Interpreter','tex')
% ָ��ͼ����legend%%%%%%%%%%%
%��ʽ�����%%%%
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperSize', [27 15]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'normalized');
set(gcf, 'PaperPosition', [0.03 0.05 0.94 0.9]);
saveas(gcf,[MaterialOptic 'Absorption'],'png')
%��ʽ���������%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%####################����ϵ����ͼ����###################
%%%%%%%%%����MatLab��ͼ�ļ�%%%%%%
savefig(h,[MaterialOptic 'Optic.fig']);
%%%�������
end