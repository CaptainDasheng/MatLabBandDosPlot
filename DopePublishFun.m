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
% AlN:Er$_(Al)$
% $AlN:Er$_(Al)$-V$_N$ AlN:Er_(Al)-V_N
%��AlNErAl���ʽű�scripts
% filename = 'myfile01.txt';
% delimiterIn = ' ';
% headerlinesIn = 1;
% A = importdata(filename,delimiterIn,headerlinesIn);
% v(1)=-30;v(2)=7.726;v(1,1:2)=DosLim;v(1,3:4)=BandLim;
% �����ļ�&ָ������
function []=DopePublishFun(PMaterialElement,Psavefilename,...
    PMaterial,PToSaveFile,PTranslationup,PTranslationdown)
% �ĸ��ַ�������һ������������ P��ʾ���ݱ�������˼
cd('C:\Users\qingz\Documents\MATLAB\BandStructure')
%ָ����ǰ�ļ��м�����λ��
global Material MainPosition % global RareEarth
global ToSaveFile
global MaterialElement
global BandLim DosLim OptLim 
global Translationup Translationdown
global io jo ko ArrowPosit figureo %figureo ��������
% MainPosition ������λ�� Position x��tickλ��
% io jo һ�������������� DosLim̬�ܶ������� BandLim �ܴ������� ����������
% ko �ܴ���ͼ�������� ArrowPosit�������¼�ͷ��λ��
% ����������һ�γ������������
io=0;jo=0;ko=0;
% �·���������ͼǰͳһ��һ��io����������ÿ��figureǰ��1
%!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
%!!!!!!!!!!!!!!!!!!!!��ͨ������ʼ����ʼ!!!!!!!!!!!!!!!!!!!!!!!!!
%RareEarth='Tm'  ;         %ϡ��Ԫ�ص����� һ���ַ���
MaterialElement=PMaterialElement  ;%����Al N ϡ���Ĵ��� Er Eu Tm��cell����
%@@@@@@@@@@@@@@@ÿ��Ԫ��ֻ���޸�һ��@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
savefilename=Psavefilename{1,1};  %�ַ�������
% ָ����ͼ�ļ�GGA/HSE06���ܴ�/̬�ܶ�/P̬�ܶ�/��ѧ����
Material=PMaterial{1,1}        ; %ÿ��ѡ��һ�������·�ѡ���ַ�������
ToSaveFile=PToSaveFile{1,1}     %Ϊ�˱���̬�ܶȹ�ѧ���ʺϲ�ͼָ�����ļ���
% ������ϵ����
% 'AlN:Er_(Al)' 'AlN:Er_(Al)-V_N'  'AlN:Er_(Al)-V_(Al)'
% 'AlN:Eu_(Al)' 'AlN:Eu_(Al)-V_N'  'AlN:Eu_(Al)-V_(Al)'
% 'AlN:Tm_(Al)' 'AlN:Tm_(Al)-V_N'  'AlN:Tm_(Al)-V_(Al)'
%###############################
%## 'ErAl'  'ErAlVN'   'ErAlVAl'
%## 'EuAl'  'EuAlVN'   'EuAlVAl'
%## 'TmAl'  'TmAlVN'   'TmAlVAl'
Translationup=PTranslationup;
Translationdown=PTranslationdown;
%�����ܴ�ƽ�������ܴ�DOS�������ã�һ��������
%��ֵ���ϣ��ң�ƽ�ƣ���ֵ���£���ƽ��
%@@@@@@@@@@@ForEr ErAl 0.00  ErAlVN 3.00 ErAlVAl 1.40@@@@@@@@@@@
%@@@@@@@@@@@ForEu EuAl 0.00  EuAlVN 4.026 EuAlVAl 0.80@@@@@@@@@@@
%@@@@@@@@@@@ForTm TmAl 0.00  TmAlVN 4.324 TmAlVAl 2.591@@@@@@@@@@@
%!!!!!!!!!!!!!!!!!!!!!!!!��ͨ������ʼ������!!!!!!!!!!!!!!!!!!!!!!!!!!!
%!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
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


%%%%%%%%������ͼ��######################################
hfigure=[];
%%%%%%%%������ͼ��######################################
io=io+1; ko=io;figureo=figureo+1;
hfigure(io)=figure(figureo);
BandStrucPlotFun4(savefilename{1,io},Position,Label) %���û�ͼ����
%%%%%%%%%%%%%%%%%%%%%%%%%%%
ko=io+1;
BandStrucPlotFun4(savefilename{1,io},Position,Label) %���û�ͼ����
% �ܴ���ͼ����
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ������Dos�����ֲ�̬�ܶ�
io=io+1;figureo=figureo+1;
hfigure(io)=figure(figureo);
DosPlotFun4(savefilename{1,io})
%��Dos�����ֲ�̬�ܶȽ���
%�����ֲ�̬�ܶ�%%%%%%%%%%%%%%%%%%%%%%
io=io+1;jo=io;figureo=figureo+1;
hfigure(jo)=figure(figureo);
% subplot(m,n,p)
subplot(4,1,1);
PDosPlotFun4(savefilename{1,jo},4)
%�ֲ� �� ̬�ܶ���ͼ%%%%%%%%%%%%%%%%%%%%
subplot(4,1,2);
jo=jo+1;
PDosPlotFun4(savefilename{1,jo},21)
%�ֲ� Al ̬�ܶ���ͼ%%%%%%%%%%%%%%%%%
subplot(4,1,3);
jo=jo+1;
PDosPlotFun4(savefilename{1,jo},22)
%�ֲ� N ̬�ܶ���ͼ%%%%%%%%%%%%%%%%%%%%%%%%
subplot(4,1,4);
jo=jo+1;
PDosPlotFun4(savefilename{1,jo},3)
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
savefig(hfigure,[ToSaveFile 'BandDOS.fig']);
disp('�������BandStructure & DOS/PDOS Plotting Completed Successfully')
end