%ִ�з���
%ע��ִ�в���
%#���ȵ������޸��ⲿ���ݣ����ʵ�����
%#Ȼ���޸Ľű���Ĳ��� �����ļ�����gap��MainPosition Position 
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
cc
global Material MainPosition io jo ko BandTranslation
global BandLim DosLim OptLim ArrowPosit
BandTranslation=0.9396;
% MainPosition ������λ�� Position x��tickλ��
% io jo һ�������������� DosLim̬�ܶ������� BandLim �ܴ������� ����������
% ko �ܴ���ͼ�������� ArrowPosit�������¼�ͷ��λ��
% ����������һ�γ������������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
io=0;
% �·���������ͼǰͳһ��һ��io����������ÿ��figureǰ��1
Material='AlN:Tm_{Al}' %��������
MainPosition=[0.276 0.276 0.500 0.500 0.776 0.776]; 
BandLim=[-6,6];                %�ܴ�ͼ�������ޣ���λ��
DosLim=[-30,7.726] ;       %̬�ܶ������ޣ���λ�� 
OptLim=[0,20];           %��ѧ���������ޣ���λ��
ArrowPosit=[0.05,0.55];    %�����ܴ�ͼ���������¼�ͷ��λ�ã���λ��
Position=[0 0.276 0.500 0.776 1];     %x��̶�λ��
Label={'G' 'F' 'Q' 'Z' 'G'};  %�̶����� ticklabel
savefilename={'TmAl_HSE06_BandStr','TmAl_HSE06_DOS_Total',...
    'TmAl_HSE06_PDOS_Total',... %�ֲ���̬�ܶ�
    'TmAl_HSE06_PDOS_Al','TmAl_HSE06_PDOS_N',...
    'TmAl_HSE06_PDOS_Tm'};
% ָ����ͼ�ļ�GGA/HSE06���ܴ�/̬�ܶ�/P̬�ܶ�/��ѧ����
% ���ñ�Ǳ����Զ�ʵ��ͼ������������ߴ��븴����
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%������ͼ��%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
io=io+1; ko=io;
h(io)=figure(io);
BandStrucPlotFun3(savefilename{io},Position,Label) %���û�ͼ����
%#########
ko=io+1;
BandStrucPlotFun3(savefilename{io},Position,Label) %���û�ͼ����
% �ܴ���ͼ����

