%% ErAl�Զ���ͼ�ű�
ErAlPlotSubDosLegendFixed
%% ִ�з���
%ע��ִ�в���
%#���ȵ������޸��ⲿ���ݣ����ʵ�����
%#Ȼ���޸Ľű���Ĳ��� �����ļ�����gap��MainPosition Position 
% Material Label
%#�ʵ��޸�BandLim DosLim OptLim �������.fig������ row of 81
%% �ο�����
%AlN
% AlN:Er$_{Al}$
% $AlN:Er$_{Al}$-V$_N$
%��AlNErAl���ʽű�scripts
% filename = 'myfile01.txt';
% delimiterIn = ' ';
% headerlinesIn = 1;
% A = importdata(filename,delimiterIn,headerlinesIn);
% v(1)=-30;v(2)=7.726;v(1,1:2)=DosLim;v(1,3:4)=BandLim;
%% �����ļ�&ָ������
cd('C:\Users\qingz\Documents\MATLAB\BandStructure')
%ָ����ǰ�ļ��м�����λ��
global MainPosition Material io jo BandLim DosLim OptLim
% MainPosition ������λ�� Position x��tickλ��
% io jo һ�������������� DosLim̬�ܶ������� BandLim �ܴ������� ����������
% ����������һ�γ������������
io=0;
% �·���������ͼǰͳһ��һ��io����������ÿ��figureǰ��1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
gap=1.156  % ָ����϶��˳����GGA HSE06��
Material='AlN:Er_{Al}' %��������
MainPosition=[0.488 0.488]; %���ܴ�������λ��,�������ң�ÿ��λ����������
BandLim=[-30,6];                %�ܴ�ͼ�������ޣ���λ��
DosLim=[-30,7.726] ;       %̬�ܶ������ޣ���λ�� 
OptLim=[0,20];           %��ѧ���������ޣ���λ��
Position=[0 0.488 1];     %x��̶�λ��
Label={'A' 'G' 'F'};  %�̶����� ticklabel
savefilename={'72_ErAl_PBE_BandStr','72_ErAl_PBE_DOS',...
    '72_ErAl_PBE_PDOS_Al','72_ErAl_PBE_PDOS_Er',...
    '72_ErAl_PBE_PDOS_N','72_ErAl_PBE_Optics'}
% ָ����ͼ�ļ�GGA/HSE06���ܴ�/̬�ܶ�/P̬�ܶ�/��ѧ����
% ���ñ�Ǳ����Զ�ʵ��ͼ������������ߴ��븴����
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ������ͼ��
io=io+1;
h(io)=figure(io);
BandStrucPlotFun2(savefilename{io},gap,Position,Label) %���û�ͼ����
% �ܴ���ͼ����
% io=io+1;
% h(io)=figure(io);
% DosPlotFun2(savefilename{io})
% % ̬�ܶ���ͼ����
% ����Dos/PDos
io=io+1;jo=io;
h(jo)=figure(jo);
% subplot(m,n,p)
%ys��̬�ܶ���ͼ
subplot(4,1,1);
DosPlotFun2b(savefilename{jo})
%ys��̬�ܶ���ͼ
subplot(4,1,2);
jo=jo+1;
PDosPlotFun2c(savefilename{jo})
subplot(4,1,3);
jo=jo+1;
PDosPlotFun2c(savefilename{jo})
subplot(4,1,4);
jo=jo+1;
PDosPlotFun2c(savefilename{jo})
%��һ������jo����Ϊ�ж���Ԫ�أ��ж���PDos
    set(gcf, 'PaperUnits', 'centimeters');
    set(gcf, 'PaperSize', [27 15]);
    set(gcf, 'PaperPositionMode', 'manual');
    set(gcf, 'PaperUnits', 'normalized');
    set(gcf, 'PaperPosition', [0.03 0.05 0.94 0.9]);
    saveas(gcf,'DosAndPDos','png')
    % ���ϸ�ʽ�����
%Dos/PDos����  
io=io+1;
jo=jo+1;
h(io)=figure(io);
OpticalProPlotFun(savefilename{jo})
%��ѧ������ͼ����
savefig(h,'AlNErAl.fig');
disp('�������BandStructure & DOS/PDOS Plotting Completed Successfully')
%% ����Ϊ֮ǰ�Ĳο�������
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