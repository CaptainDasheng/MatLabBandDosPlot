%% ErAl自动画图脚本
ErAlPlotSubDosLegendFixed
%% 执行方法
%注意执行步骤
%#首先导出、修改外部数据，并适当命名
%#然后修改脚本里的参数 包括文件名，gap，MainPosition Position 
% Material Label
%#适当修改BandLim DosLim OptLim 还有最后.fig数据名 row of 81
%% 参考代码
%AlN
% AlN:Er$_{Al}$
% $AlN:Er$_{Al}$-V$_N$
%画AlNErAl性质脚本scripts
% filename = 'myfile01.txt';
% delimiterIn = ' ';
% headerlinesIn = 1;
% A = importdata(filename,delimiterIn,headerlinesIn);
% v(1)=-30;v(2)=7.726;v(1,1:2)=DosLim;v(1,3:4)=BandLim;
%% 导入文件&指定参数
cd('C:\Users\qingz\Documents\MATLAB\BandStructure')
%指定当前文件夹即保存位置
global MainPosition Material io jo BandLim DosLim OptLim
% MainPosition 划竖线位置 Position x轴tick位置
% io jo 一级二级计数变量 DosLim态密度左右限 BandLim 能带上下限 都是能量限
% 可以在运行一次程序后，再做调整
io=0;
% 新方案，在做图前统一加一个io增长变量，每个figure前加1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
gap=1.156  % 指定带隙（顺序是GGA HSE06）
Material='AlN:Er_{Al}' %物质名称
MainPosition=[0.488 0.488]; %画能带分区线位置,除了左右，每个位置输入两次
BandLim=[-30,6];                %能带图像上下限，两位数
DosLim=[-30,7.726] ;       %态密度左右限，两位数 
OptLim=[0,20];           %光学性质左右限，两位数
Position=[0 0.488 1];     %x轴刻度位置
Label={'A' 'G' 'F'};  %刻度名称 ticklabel
savefilename={'72_ErAl_PBE_BandStr','72_ErAl_PBE_DOS',...
    '72_ErAl_PBE_PDOS_Al','72_ErAl_PBE_PDOS_Er',...
    '72_ErAl_PBE_PDOS_N','72_ErAl_PBE_Optics'}
% 指定画图文件GGA/HSE06，能带/态密度/P态密度/光学性质
% 利用标记变量自动实现图像句柄增长，提高代码复用性
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 画各幅图像
io=io+1;
h(io)=figure(io);
BandStrucPlotFun2(savefilename{io},gap,Position,Label) %调用画图函数
% 能带作图结束
% io=io+1;
% h(io)=figure(io);
% DosPlotFun2(savefilename{io})
% % 态密度做图结束
% 以下Dos/PDos
io=io+1;jo=io;
h(jo)=figure(jo);
% subplot(m,n,p)
%ys总态密度做图
subplot(4,1,1);
DosPlotFun2b(savefilename{jo})
%ys总态密度做图
subplot(4,1,2);
jo=jo+1;
PDosPlotFun2c(savefilename{jo})
subplot(4,1,3);
jo=jo+1;
PDosPlotFun2c(savefilename{jo})
subplot(4,1,4);
jo=jo+1;
PDosPlotFun2c(savefilename{jo})
%这一段引入jo是因为有多种元素，有多种PDos
    set(gcf, 'PaperUnits', 'centimeters');
    set(gcf, 'PaperSize', [27 15]);
    set(gcf, 'PaperPositionMode', 'manual');
    set(gcf, 'PaperUnits', 'normalized');
    set(gcf, 'PaperPosition', [0.03 0.05 0.94 0.9]);
    saveas(gcf,'DosAndPDos','png')
    % 以上格式化输出
%Dos/PDos结束  
io=io+1;
jo=jo+1;
h(io)=figure(io);
OpticalProPlotFun(savefilename{jo})
%光学性质作图结束
savefig(h,'AlNErAl.fig');
disp('你真棒！BandStructure & DOS/PDOS Plotting Completed Successfully')
%% 以下为之前的参考与试作
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
%以上两句用以全屏化窗口作图以及全屏化打印
% pause(2)%等待窗口张开
% set(gca,'PaperUnits','inches','PaperSize',[15 13])
% % % 画子图像% % % % % 
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