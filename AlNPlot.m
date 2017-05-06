% AlN
% AlN:Er$_{Al}
% $AlN:Er$_{Al}$-V$_N$
%��AlNBulk���ʽű�scripts
% filename = 'myfile01.txt';
% delimiterIn = ' ';
% headerlinesIn = 1;
% A = importdata(filename,delimiterIn,headerlinesIn);
cd('C:\Users\qingz\Documents\MATLAB\BandStructure')
%ָ����ǰ�ļ��м�����λ��
global MainPosition Material
gap=[4.058,5.659]
Material='AlN'
MainPosition=[0.169 0.169 0.260 0.260 0.428 ...
    0.428 0.520 0.520 0.714 0.714 0.805 0.805];
% ָ����϶��˳����GGA HSE06��
% �����λ���Ի�������ȥ����0��1--ȥ������ĩλ��
Position=[0 0.0845 0.169 0.2145 0.260 0.3440 0.428...
    0.4740 0.520 0.6170 0.714 0.7595 0.805 0.9025 1];     %x��̶�λ��
Label={'A' 'R' 'L' 'U' 'M' '��' '��' '��' 'A' 'S'...
    'H' 'P' 'K' 'T' '��'};  %�̶�����
savefilename={'BandStr_GGA','BandStr_HSE06',...
    'DOS_GGA','DOS_HSE06',...
    'PDOS_Al_GGA','PDOS_Al_HSE06','PDOS_N_GGA','PDOS_N_HSE06','PDOS_Total_GGA','PDOS_Total_HSE06',...
    'OpticalPro_GGA','OpticalPro_HSE06'}
% ָ����ͼ�ļ�GGA/HSE06���ܴ�/̬�ܶ�/P̬�ܶ�/��ѧ����
h(1)=figure(1);
BandStrucPlotFun(savefilename{1},gap(1),Position,Label) %���û�ͼ����
h(2)=figure(2);
BandStrucPlotFun(savefilename{2},gap(2),Position,Label)
% �ܴ���ͼ����
h(3)=figure(3);
DosPlotFun(savefilename{3})
h(4)=figure(4);
DosPlotFun(savefilename{4})
% ̬�ܶ���ͼ����
% ����PDos
h(5)=figure(5);
PDosPlotFun(savefilename{5})
h(6)=figure(6);
PDosPlotFun(savefilename{6})
h(7)=figure(7);
PDosPlotFun(savefilename{7})
h(8)=figure(8);
PDosPlotFun(savefilename{8})
h(9)=figure(9);
PDosPlotFun(savefilename{9})
h(10)=figure(10);
PDosPlotFun(savefilename{10})
% PDos����
h(11)=figure(11);
OpticalProPlotFun(savefilename{11})
h(12)=figure(12);
OpticalProPlotFun(savefilename{12})
%��ѧ����
savefig(h,'AlNBulkFigures.fig');
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