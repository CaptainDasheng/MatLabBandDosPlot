% AlN
% AlN:Er$_{Al}$
% $AlN:Er$_{Al}$-V$_N$
%画AlNErAl性质脚本scripts
% filename = 'myfile01.txt';
% delimiterIn = ' ';
% headerlinesIn = 1;
% A = importdata(filename,delimiterIn,headerlinesIn);
cd('C:\Users\qingz\Documents\MATLAB\BandStructure')
%指定当前文件夹即保存位置
global MainPosition Material
% 主标记位置即能带分区线
io=0;
% 新方案，在做图前统一加一个io增长变量，每个figure前加1
gap=1.156
Material='AlN:Er_{Al}'
MainPosition=[0.488 0.488];
% 指定带隙（顺序是GGA HSE06）、主标记位置以划画竖线去掉了0和1--去掉了首末位置
Position=[0 0.488 1];     %x轴刻度位置
Label={'A' 'G' 'F'};  %刻度名称
savefilename={'72_ErAl_PBE_BandStr','72_ErAl_PBE_DOS',...
    '72_ErAl_PBE_PDOS_Al','72_ErAl_PBE_PDOS_Er',...
    '72_ErAl_PBE_PDOS_N','72_ErAl_PBE_Optics'}
% 指定画图文件GGA/HSE06，能带/态密度/P态密度/光学性质
io=io+1;
h(io)=figure(io);
BandStrucPlotFun2(savefilename{io},gap,Position,Label) %调用画图函数
% 能带作图结束
io=io+1;
h(io)=figure(io);
DosPlotFun2(savefilename{io})
% 态密度做图结束
% 以下PDos
io=io+1;
h(io)=figure(io);
PDosPlotFun2(savefilename{io})
io=io+1;
h(io)=figure(io);
PDosPlotFun2(savefilename{io})
io=io+1;
h(io)=figure(io);
PDosPlotFun2(savefilename{io})
% PDos结束
io=io+1;
h(io)=figure(io);
OpticalProPlotFun(savefilename{io})
%光学性质
savefig(h,'AlNErAl.fig');
%以下为之前的参考与试作
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