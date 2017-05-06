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
PDosPlotFun2(savefilename{io})
io=io+1;
h(io)=figure(io);
PDosPlotFun2(savefilename{io})
io=io+1;
h(io)=figure(io);
PDosPlotFun2(savefilename{io})
% PDos����
io=io+1;
h(io)=figure(io);
OpticalProPlotFun(savefilename{io})
%��ѧ����
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