%执行方法
%注意执行步骤
%#首先导出、修改外部数据，并适当命名
%#然后修改脚本里的参数 包括文件名，gap，MainPosition Position 
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
cc
global Material MainPosition io jo ko BandTranslation
global BandLim DosLim OptLim ArrowPosit
BandTranslation=0.9396;
% MainPosition 划竖线位置 Position x轴tick位置
% io jo 一级二级计数变量 DosLim态密度左右限 BandLim 能带上下限 都是能量限
% ko 能带作图计数变量 ArrowPosit自旋上下箭头的位置
% 可以在运行一次程序后，再做调整
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
io=0;
% 新方案，在做图前统一加一个io增长变量，每个figure前加1
Material='AlN:Tm_{Al}' %物质名称
MainPosition=[0.276 0.276 0.500 0.500 0.776 0.776]; 
BandLim=[-6,6];                %能带图像上下限，两位数
DosLim=[-30,7.726] ;       %态密度左右限，两位数 
OptLim=[0,20];           %光学性质左右限，两位数
ArrowPosit=[0.05,0.55];    %掺杂能带图里自旋上下箭头的位置，两位数
Position=[0 0.276 0.500 0.776 1];     %x轴刻度位置
Label={'G' 'F' 'Q' 'Z' 'G'};  %刻度名称 ticklabel
savefilename={'TmAl_HSE06_BandStr','TmAl_HSE06_DOS_Total',...
    'TmAl_HSE06_PDOS_Total',... %分波总态密度
    'TmAl_HSE06_PDOS_Al','TmAl_HSE06_PDOS_N',...
    'TmAl_HSE06_PDOS_Tm'};
% 指定画图文件GGA/HSE06，能带/态密度/P态密度/光学性质
% 利用标记变量自动实现图像句柄增长，提高代码复用性
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%画各幅图像%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
io=io+1; ko=io;
h(io)=figure(io);
BandStrucPlotFun3(savefilename{io},Position,Label) %调用画图函数
%#########
ko=io+1;
BandStrucPlotFun3(savefilename{io},Position,Label) %调用画图函数
% 能带作图结束

