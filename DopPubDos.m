%ִ�з���
%ע��ִ�в���
%#���ȵ������޸��ⲿ���ݣ����ʵ�����
%#Ȼ���޸Ľű���Ĳ��� �����ļ�����gap��MainPosition Position 
    %##�ļ���˳��BS 4Comlums /DOS 4 
    % /PDos Total4 Al16 N16 Er16(Eu,Tm) /Optics 4
% Material Label
%#�ʵ��޸�BandLim DosLim OptLim �������.fig������ row of 81
% �ο����� ��������
%AlN
% AlN:Er$_{Al}$
% $AlN:Er$_{Al}$-V$_N$
%��AlNErAl���ʽű�scripts
% filename = 'myfile01.txt';
% delimiterIn = ' ';
% headerlinesIn = 1;
% A = importdata(filename,delimiterIn,headerlinesIn);
% v(1)=-30;v(2)=7.726;v(1,1:2)=DosLim;v(1,3:4)=BandLim;
% �����ļ�&ָ������
cd('C:\Users\qingz\Documents\MATLAB\BandStructure')
%ָ����ǰ�ļ��м�����λ��
global MaterialElement MainPosition io jo ko BandLim DosLim OptLim ArrowPosit
% MainPosition ������λ�� Position x��tickλ��
% io jo һ�������������� DosLim̬�ܶ������� BandLim �ܴ������� ����������
% ko �ܴ���ͼ�������� ArrowPosit�������¼�ͷ��λ��
% ����������һ�γ������������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
io=0;jo=0;ko=0;
% �·���������ͼǰͳһ��һ��io����������ÿ��figureǰ��1
MaterialElement={'Al' 'N' 'Er'}
MainPosition=[0.488 0.488]; %���ܴ�������λ��
BandLim=[-6,6];                %�ܴ�ͼ�������ޣ���λ��
DosLim=[-20,7.726] ;       %̬�ܶ������ޣ���λ�� 
OptLim=[0,20];           %��ѧ���������ޣ���λ��
ArrowPosit=[0.05,2.5];    %�����ܴ�ͼ���������¼�ͷ��λ�ã���λ��
Position=[0 0.488 1];     %x��̶�λ��
Label={'A' 'G' 'F'};  %�̶����� ticklabel
savefilename={'72_ErAl_PBE_BandStr','72_ErAl_PBE_DOS',...
    '72_ErAl_PBE_PDOS_Er',... %�ֲ���̬�ܶ�
    '72_ErAl_PBE_PDOS_Al','72_ErAl_PBE_PDOS_N',...
    '72_ErAl_PBE_PDOS_Er','72_ErAl_PBE_Optics'}
% ָ����ͼ�ļ�GGA/HSE06���ܴ�/̬�ܶ�/P̬�ܶ�/��ѧ����
% ���ñ�Ǳ����Զ�ʵ��ͼ������������ߴ��븴����
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%������ͼ��%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
io=io+1; ko=io;
% % ̬�ܶ���ͼ����
% ������Dos�����ֲ�̬�ܶ�
io=io+1;
h(io)=figure(io);
DosPlotFun2b(savefilename{io})
%��Dos�����ֲ�̬�ܶȽ���
%##############
%�����ֲ�̬�ܶ�
io=io+1;jo=io;
h(jo)=figure(jo);
% subplot(m,n,p)
subplot(4,1,1);
PDosPlotFun2d(savefilename{jo},4)
%�ֲ� �� ̬�ܶ���ͼ
subplot(4,1,2);
jo=jo+1;
PDosPlotFun2d(savefilename{jo},21)
%�ֲ� Al ̬�ܶ���ͼ
subplot(4,1,3);
jo=jo+1;
PDosPlotFun2d(savefilename{jo},22)
%�ֲ� N ̬�ܶ���ͼ
subplot(4,1,4);
jo=jo+1;
PDosPlotFun2d(savefilename{jo},3)
%�ֲ� Er ̬�ܶ���ͼ
%��һ������jo����Ϊ�ж���Ԫ�أ��ж���PDos
    set(gcf, 'PaperUnits', 'centimeters');
    set(gcf, 'PaperSize', [27 15]);
    set(gcf, 'PaperPositionMode', 'manual');
    set(gcf, 'PaperUnits', 'normalized');
    set(gcf, 'PaperPosition', [0.03 0.05 0.94 0.9]);
    saveas(gcf,'DosAndPDos','png')
    % ���ϸ�ʽ�����
%Dos/PDos����  