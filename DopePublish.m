%ִ�з���
%ע��ִ�в���
%##���ȵ������޸��ⲿ���ݣ����ʵ�����
%##Ȼ���޸Ľű���Ĳ��� �����ļ�����gap��MainPosition Position 
    %%%BandLim DosLim OptLim RareEarth
    %##�ļ���˳��BS 4Comlums /DOS 4 
    % /PDos Total4 Al16 N16 Er16(Eu,Tm) /Optics 4
%##Material Label
%##�ʵ��޸�BandLim DosLim OptLim
%#############################################################
% �ο����� ��������
%AlN
% AlN:Er$_{Al}$
% $AlN:Er$_{Al}$-V$_N$ AlN:Er_{Al}-V_N
%��AlNErAl���ʽű�scripts
% filename = 'myfile01.txt';
% delimiterIn = ' ';
% headerlinesIn = 1;
% A = importdata(filename,delimiterIn,headerlinesIn);
% v(1)=-30;v(2)=7.726;v(1,1:2)=DosLim;v(1,3:4)=BandLim;
% �����ļ�&ָ������
cc
cd('C:\Users\qingz\Documents\MATLAB\BandStructure')
%ָ����ǰ�ļ��м�����λ��
global Material MainPosition % global RareEarth
global ToSaveFile
global MaterialElement
global BandLim DosLim OptLim BandTranslation
global io jo ko ArrowPosit
% MainPosition ������λ�� Position x��tickλ��
% io jo һ�������������� DosLim̬�ܶ������� BandLim �ܴ������� ����������
% ko �ܴ���ͼ�������� ArrowPosit�������¼�ͷ��λ��
% ����������һ�γ������������
io=0;
% �·���������ͼǰͳһ��һ��io����������ÿ��figureǰ��1
%#################��ͨ������ʼ����ʼ###############################
%RareEarth='Tm'  ;         %ϡ��Ԫ�ص����� һ���ַ���
MaterialElement={'Al' 'N' 'Eu'}  %����Al N ϡ���Ĵ��� Er Eu Tm
%@@@@@@@@@@@@@@@ÿ��Ԫ��ֻ���޸�һ��@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
savefilename={'EuAl_VAl_PBE_BandStr','EuAl_VAl_PBE_DOS_Total',...
    'EuAl_VAl_PBE_PDOS_Total',... %�ֲ���̬�ܶ�
    'EuAl_VAl_PBE_PDOS_Al','EuAl_VAl_PBE_PDOS_N',...
    'EuAl_VAl_PBE_PDOS_Eu'};
% ָ����ͼ�ļ�GGA/HSE06���ܴ�/̬�ܶ�/P̬�ܶ�/��ѧ����
Material='AlN:Eu_{Al}-V_{Al}'        ;
ToSaveFile='EuAlVAl'          ; %Ϊ�˱���̬�ܶȹ�ѧ���ʺϲ�ͼָ�����ļ���
% ������ϵ����
% 'AlN:Er_{Al}' 'AlN:Er_{Al}-V_N'  'AlN:Er_{Al}-V_{Al}'
% 'AlN:Eu_{Al}' 'AlN:Eu_{Al}-V_N'  'AlN:Eu_{Al}-V_{Al}'
% 'AlN:Tm_{Al}' 'AlN:Tm_{Al}-V_N'  'AlN:Tm_{Al}-V_{Al}'
%## 'ErAl'  'ErAlVN'   'ErAlVAl'
%## 'EuAl'  'EuAlVN'   'EuAlVAl'
%## 'TmAl'  'TmAlVN'   'TmAlVAl'
BandTranslation=1.201  ;%�����ܴ�ƽ�������ܴ�DOS�������ã�һ��������
%��ֵ���ϣ��ң�ƽ�ƣ���ֵ���£���ƽ��
%@@@@@@@@@@@ForEr ErAl 0.00  ErAlVN 3.00 ErAlVAl 1.40@@@@@@@@@@@
%@@@@@@@@@@@ForEu EuAl 0.00  EuAlVN 4.026 EuAlVAl 0.80@@@@@@@@@@@
%@@@@@@@@@@@ForTm TmAl 0.00  TmAlVN 4.066 TmAlVAl 0.85@@@@@@@@@@@
%################��ͨ������ʼ������#######################################
MainPosition=[0.276 0.276 0.500 0.500 0.776 0.776]; 
%���ܴ�������λ��%���ܴ�������λ��,���֣�
%��������0,1��ÿ��λ����������

BandLim=[-6,8];          %�ܴ�ͼ�������ޣ���λ��
DosLim=[-11,10] ;       %̬�ܶ������ޣ���λ�� 
OptLim=[0,20];           %��ѧ���������ޣ���λ��
ArrowPosit=[0.05,0.55];     %�����ܴ�ͼ���������¼�ͷ��λ�ã���λ��
Position=[0 0.276 0.500 0.776 1];     %x��̶�λ��
Label={'G' 'F' 'Q' 'Z' 'G'};  %�̶����� ticklabel
% ���ñ�Ǳ����Զ�ʵ��ͼ������������ߴ��븴����
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%������ͼ��%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
io=io+1; ko=io;
h(io)=figure(io);
BandStrucPlotFun3(savefilename{io},Position,Label) %���û�ͼ����
%%%%%%%%%%%%%%%%%%%%%%%%%%%
ko=io+1;
BandStrucPlotFun3(savefilename{io},Position,Label) %���û�ͼ����
% �ܴ���ͼ����
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ������Dos�����ֲ�̬�ܶ�
io=io+1;
h(io)=figure(io);
DosPlotFun2b(savefilename{io})
%��Dos�����ֲ�̬�ܶȽ���
%�����ֲ�̬�ܶ�%%%%%%%%%%%%%%%%%%%%%%
io=io+1;jo=io;
h(jo)=figure(jo);
% subplot(m,n,p)
subplot(4,1,1);
PDosPlotFun2d(savefilename{jo},4)
%�ֲ� �� ̬�ܶ���ͼ%%%%%%%%%%%%%%%%%%%%
subplot(4,1,2);
jo=jo+1;
PDosPlotFun2d(savefilename{jo},21)
%�ֲ� Al ̬�ܶ���ͼ%%%%%%%%%%%%%%%%%
subplot(4,1,3);
jo=jo+1;
PDosPlotFun2d(savefilename{jo},22)
%�ֲ� N ̬�ܶ���ͼ%%%%%%%%%%%%%%%%%%%%%%%%
subplot(4,1,4);
jo=jo+1;
PDosPlotFun2d(savefilename{jo},3)
%�ֲ� Er ̬�ܶ���ͼ%%%%%%%%%%%%%%%%%%%%%%%%
%��һ������jo����Ϊ�ж���Ԫ�أ��ж���PDos%%%%
    set(gcf, 'PaperUnits', 'centimeters');
    set(gcf, 'PaperSize', [27 15]);
    set(gcf, 'PaperPositionMode', 'manual');
    set(gcf, 'PaperUnits', 'normalized');
    set(gcf, 'PaperPosition', [0.03 0.05 0.94 0.9]);
    saveas(gcf,[ToSaveFile 'PDOS'],'png')
    %%���ϸ�ʽ�����%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%Dos/PDos����%%%%%%%%%%%%%%%%%%%%%%%%%%
savefig(h,[ToSaveFile 'BandDOS.fig']);
disp('�������BandStructure & DOS/PDOS Plotting Completed Successfully')