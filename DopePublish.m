%执行方法
%注意执行步骤
%##首先导出、修改外部数据，并适当命名
%##然后修改脚本里的参数 包括文件名，gap，MainPosition Position 
    %%%BandLim DosLim OptLim RareEarth
    %##文件名顺序，BS 4Comlums /DOS 4 
    % /PDos Total4 Al16 N16 Er16(Eu,Tm) /Optics 4
%##Material Label
%##适当修改BandLim DosLim OptLim
%#############################################################
% 参考代码 物质名称
%AlN
% AlN:Er$_{Al}$
% $AlN:Er$_{Al}$-V$_N$ AlN:Er_{Al}-V_N
%画AlNErAl性质脚本scripts
% filename = 'myfile01.txt';
% delimiterIn = ' ';
% headerlinesIn = 1;
% A = importdata(filename,delimiterIn,headerlinesIn);
% v(1)=-30;v(2)=7.726;v(1,1:2)=DosLim;v(1,3:4)=BandLim;
% 导入文件&指定参数
cc
cd('C:\Users\qingz\Documents\MATLAB\BandStructure')
%指定当前文件夹即保存位置
global Material MainPosition % global RareEarth
global ToSaveFile
global MaterialElement
global BandLim DosLim OptLim BandTranslation
global io jo ko ArrowPosit
% MainPosition 划竖线位置 Position x轴tick位置
% io jo 一级二级计数变量 DosLim态密度左右限 BandLim 能带上下限 都是能量限
% ko 能带作图计数变量 ArrowPosit自旋上下箭头的位置
% 可以在运行一次程序后，再做调整
io=0;
% 新方案，在做图前统一加一个io增长变量，每个figure前加1
%#################普通变量初始化开始###############################
%RareEarth='Tm'  ;         %稀土元素的名称 一个字符串
MaterialElement={'Al' 'N' 'Eu'}  %按照Al N 稀土的次序 Er Eu Tm
%@@@@@@@@@@@@@@@每种元素只需修改一次@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
savefilename={'EuAl_VAl_PBE_BandStr','EuAl_VAl_PBE_DOS_Total',...
    'EuAl_VAl_PBE_PDOS_Total',... %分波总态密度
    'EuAl_VAl_PBE_PDOS_Al','EuAl_VAl_PBE_PDOS_N',...
    'EuAl_VAl_PBE_PDOS_Eu'};
% 指定画图文件GGA/HSE06，能带/态密度/P态密度/光学性质
Material='AlN:Eu_{Al}-V_{Al}'        ;
ToSaveFile='EuAlVAl'          ; %为了保存态密度光学性质合并图指定的文件名
% 掺杂体系名称
% 'AlN:Er_{Al}' 'AlN:Er_{Al}-V_N'  'AlN:Er_{Al}-V_{Al}'
% 'AlN:Eu_{Al}' 'AlN:Eu_{Al}-V_N'  'AlN:Eu_{Al}-V_{Al}'
% 'AlN:Tm_{Al}' 'AlN:Tm_{Al}-V_N'  'AlN:Tm_{Al}-V_{Al}'
%## 'ErAl'  'ErAlVN'   'ErAlVAl'
%## 'EuAl'  'EuAlVN'   'EuAlVAl'
%## 'TmAl'  'TmAlVN'   'TmAlVAl'
BandTranslation=1.201  ;%输入能带平移量，能带DOS均起作用，一个浮点数
%正值向上（右）平移，负值向下（左）平移
%@@@@@@@@@@@ForEr ErAl 0.00  ErAlVN 3.00 ErAlVAl 1.40@@@@@@@@@@@
%@@@@@@@@@@@ForEu EuAl 0.00  EuAlVN 4.026 EuAlVAl 0.80@@@@@@@@@@@
%@@@@@@@@@@@ForTm TmAl 0.00  TmAlVN 4.066 TmAlVAl 0.85@@@@@@@@@@@
%################普通变量初始化结束#######################################
MainPosition=[0.276 0.276 0.500 0.500 0.776 0.776]; 
%画能带分区线位置%画能带分区线位置,数字，
%除了左右0,1，每个位置输入两次

BandLim=[-6,8];          %能带图像上下限，两位数
DosLim=[-11,10] ;       %态密度左右限，两位数 
OptLim=[0,20];           %光学性质左右限，两位数
ArrowPosit=[0.05,0.55];     %掺杂能带图里自旋上下箭头的位置，两位数
Position=[0 0.276 0.500 0.776 1];     %x轴刻度位置
Label={'G' 'F' 'Q' 'Z' 'G'};  %刻度名称 ticklabel
% 利用标记变量自动实现图像句柄增长，提高代码复用性
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%画各幅图像%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
io=io+1; ko=io;
h(io)=figure(io);
BandStrucPlotFun3(savefilename{io},Position,Label) %调用画图函数
%%%%%%%%%%%%%%%%%%%%%%%%%%%
ko=io+1;
BandStrucPlotFun3(savefilename{io},Position,Label) %调用画图函数
% 能带作图结束
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 以下总Dos不含分波态密度
io=io+1;
h(io)=figure(io);
DosPlotFun2b(savefilename{io})
%总Dos不含分波态密度结束
%各个分波态密度%%%%%%%%%%%%%%%%%%%%%%
io=io+1;jo=io;
h(jo)=figure(jo);
% subplot(m,n,p)
subplot(4,1,1);
PDosPlotFun2d(savefilename{jo},4)
%分波 总 态密度做图%%%%%%%%%%%%%%%%%%%%
subplot(4,1,2);
jo=jo+1;
PDosPlotFun2d(savefilename{jo},21)
%分波 Al 态密度做图%%%%%%%%%%%%%%%%%
subplot(4,1,3);
jo=jo+1;
PDosPlotFun2d(savefilename{jo},22)
%分波 N 态密度做图%%%%%%%%%%%%%%%%%%%%%%%%
subplot(4,1,4);
jo=jo+1;
PDosPlotFun2d(savefilename{jo},3)
%分波 Er 态密度做图%%%%%%%%%%%%%%%%%%%%%%%%
%这一段引入jo是因为有多种元素，有多种PDos%%%%
    set(gcf, 'PaperUnits', 'centimeters');
    set(gcf, 'PaperSize', [27 15]);
    set(gcf, 'PaperPositionMode', 'manual');
    set(gcf, 'PaperUnits', 'normalized');
    set(gcf, 'PaperPosition', [0.03 0.05 0.94 0.9]);
    saveas(gcf,[ToSaveFile 'PDOS'],'png')
    %%以上格式化输出%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%Dos/PDos结束%%%%%%%%%%%%%%%%%%%%%%%%%%
savefig(h,[ToSaveFile 'BandDOS.fig']);
disp('你真棒！BandStructure & DOS/PDOS Plotting Completed Successfully')