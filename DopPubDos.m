%执行方法
%注意执行步骤
%#首先导出、修改外部数据，并适当命名
%#然后修改脚本里的参数 包括文件名，gap，MainPosition Position 
    %##文件名顺序，BS 4Comlums /DOS 4 
    % /PDos Total4 Al16 N16 Er16(Eu,Tm) /Optics 4
% Material Label
%#适当修改BandLim DosLim OptLim 还有最后.fig数据名 row of 81
% 参考代码 物质名称
%AlN
% AlN:Er$_{Al}$
% $AlN:Er$_{Al}$-V$_N$
%画AlNErAl性质脚本scripts
% filename = 'myfile01.txt';
% delimiterIn = ' ';
% headerlinesIn = 1;
% A = importdata(filename,delimiterIn,headerlinesIn);
% v(1)=-30;v(2)=7.726;v(1,1:2)=DosLim;v(1,3:4)=BandLim;
% 导入文件&指定参数
cd('C:\Users\qingz\Documents\MATLAB\BandStructure')
%指定当前文件夹即保存位置
global MaterialElement MainPosition io jo ko BandLim DosLim OptLim ArrowPosit
% MainPosition 划竖线位置 Position x轴tick位置
% io jo 一级二级计数变量 DosLim态密度左右限 BandLim 能带上下限 都是能量限
% ko 能带作图计数变量 ArrowPosit自旋上下箭头的位置
% 可以在运行一次程序后，再做调整
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
io=0;jo=0;ko=0;
% 新方案，在做图前统一加一个io增长变量，每个figure前加1
MaterialElement={'Al' 'N' 'Er'}
MainPosition=[0.488 0.488]; %画能带分区线位置
BandLim=[-6,6];                %能带图像上下限，两位数
DosLim=[-20,7.726] ;       %态密度左右限，两位数 
OptLim=[0,20];           %光学性质左右限，两位数
ArrowPosit=[0.05,2.5];    %掺杂能带图里自旋上下箭头的位置，两位数
Position=[0 0.488 1];     %x轴刻度位置
Label={'A' 'G' 'F'};  %刻度名称 ticklabel
savefilename={'72_ErAl_PBE_BandStr','72_ErAl_PBE_DOS',...
    '72_ErAl_PBE_PDOS_Er',... %分波总态密度
    '72_ErAl_PBE_PDOS_Al','72_ErAl_PBE_PDOS_N',...
    '72_ErAl_PBE_PDOS_Er','72_ErAl_PBE_Optics'}
% 指定画图文件GGA/HSE06，能带/态密度/P态密度/光学性质
% 利用标记变量自动实现图像句柄增长，提高代码复用性
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%画各幅图像%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
io=io+1; ko=io;
% % 态密度做图结束
% 以下总Dos不含分波态密度
io=io+1;
h(io)=figure(io);
DosPlotFun2b(savefilename{io})
%总Dos不含分波态密度结束
%##############
%各个分波态密度
io=io+1;jo=io;
h(jo)=figure(jo);
% subplot(m,n,p)
subplot(4,1,1);
PDosPlotFun2d(savefilename{jo},4)
%分波 总 态密度做图
subplot(4,1,2);
jo=jo+1;
PDosPlotFun2d(savefilename{jo},21)
%分波 Al 态密度做图
subplot(4,1,3);
jo=jo+1;
PDosPlotFun2d(savefilename{jo},22)
%分波 N 态密度做图
subplot(4,1,4);
jo=jo+1;
PDosPlotFun2d(savefilename{jo},3)
%分波 Er 态密度做图
%这一段引入jo是因为有多种元素，有多种PDos
    set(gcf, 'PaperUnits', 'centimeters');
    set(gcf, 'PaperSize', [27 15]);
    set(gcf, 'PaperPositionMode', 'manual');
    set(gcf, 'PaperUnits', 'normalized');
    set(gcf, 'PaperPosition', [0.03 0.05 0.94 0.9]);
    saveas(gcf,'DosAndPDos','png')
    % 以上格式化输出
%Dos/PDos结束  