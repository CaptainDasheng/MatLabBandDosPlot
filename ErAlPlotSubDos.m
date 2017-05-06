% AlN
% AlN:Er$_{Al}$
% $AlN:Er$_{Al}$-V$_N$
%��AlNErAl���ʽű�scripts
% filename = 'myfile01.txt';
% delimiterIn = ' ';
% headerlinesIn = 1;
% A = importdata(filename,delimiterIn,headerlinesIn);
cd('C:\Users\qingz\Documents\MATLAB\BandStructure')
%ָ����ǰ�ļ��м�����λ��
global MainPosition Material
% �����λ�ü��ܴ�������
% global IOrder
% IOrder=0;
io=0;
% �·���������ͼǰͳһ��һ��io����������ÿ��figureǰ��1
gap=1.156
Material='AlN:Er_{Al}'
MainPosition=[0.488 0.488];
% ָ����϶��˳����GGA HSE06���������λ���Ի�������ȥ����0��1--ȥ������ĩλ��
Position=[0 0.488 1];     %x��̶�λ��
Label={'A' 'G' 'F'};  %�̶�����
savefilename={'72_ErAl_PBE_BandStr','72_ErAl_PBE_DOS',...
    '72_ErAl_PBE_PDOS_Al','72_ErAl_PBE_PDOS_Er',...
    '72_ErAl_PBE_PDOS_N','72_ErAl_PBE_Optics'}
% ָ����ͼ�ļ�GGA/HSE06���ܴ�/̬�ܶ�/P̬�ܶ�/��ѧ����
% ���ñ�Ǳ����Զ�ʵ��ͼ������������ߴ��븴����
io=io+1;
h(io)=figure(io);
BandStrucPlotFun2(savefilename{io},gap,Position,Label) %���û�ͼ����
% �ܴ���ͼ����
io=io+1;
h(io)=figure(io);
DosPlotFun2(savefilename{io})
% ̬�ܶ���ͼ����
% ����PDos
io=io+1;
h(io)=figure(io);
% subplot(m,n,p)
subplot(3,1,1);
PDosPlotFun3(savefilename{io})
subplot(3,1,2);
PDosPlotFun3(savefilename{io+1})
set(get(gca,'YLabel'),'String','Density of States(electrons/eV)'...
     ,'FontSize',15,'FontName','Times new roman','FontWeight','bold')
% % % 
subplot(3,1,3);
PDosPlotFun3(savefilename{io+2})
set(get(gca,'XLabel'),'String','Energy(eV)'...
     ,'FontSize',15,'FontName','Times new roman','FontWeight','bold')
 hleg1 = legend('s','p','d','f');
 set(hleg1,'Location','SouthWest')
set(hleg1,'Interpreter','none')
% ָ��ͼ��λ�� ����ģ�� ��legend
text('String',Material,...
    'HorizontalAlignment','left',...
    'FontName','Times new roman','Color','k',...
    'FontSize',15,'Units','normalized','Position',[0.03 3.90])
% % % % % 
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperSize', [27 15]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'normalized');
set(gcf, 'PaperPosition', [0.03 0.05 0.94 0.9]);
saveas(gcf,'GatherPDos','png')
% ���ϸ�ʽ�����
% PDos����
io=io+1;
h(io)=figure(io);
OpticalProPlotFun(savefilename{io})
%��ѧ������ͼ����
savefig(h,'AlNErAl.fig');
%����Ϊ֮ǰ�Ĳο�������
% h(1) = figure;
% z = peaks;
% surf(z)
% h(2) = figure;
% plot(z)
% savefig(h,'TwoFiguresFile.fig');
% close(h)
% To open the two figures, use the command openfig('TwoFiguresFile.fig').
%set(gcf,'Units','pixels','OuterPosition',[0 0 1366 768],...
%     'PaperUnits','inches','PaperType','A4','PaperOrientation',...
% 'landscape','PaperSize',[13.075 7.351])
%'PaperSize',[13.075 7.351],'PaperOrientation', 'portrait'
%������������ȫ����������ͼ�Լ�ȫ������ӡ
% pause(2)%�ȴ������ſ�
% set(gca,'PaperUnits','inches','PaperSize',[15 13])
% % % ����ͼ��% % % % % 
% subplot(m,n,p)
% subplot(m,n,p,'replace')
% subplot(m,n,p,'align')
% subplot(m,n,p,ax)
% subplot(m,n,p) divides the current figure into an m-by-n grid 
% and creates axes in the position specified by p. 
% MATLAB? numbers subplot positions by row. 
% The first subplot is the first column of the first row, 
% the second subplot is the second column of the first row, 
% and so on. If axes exist in the specified position,
% then this command makes the axes the current axes.