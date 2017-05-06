% AlN
% AlN:Er$_{Al}
% $AlN:Er$_{Al}$-V$_N$
%画AlNBulk性质脚本scripts
% filename = 'myfile01.txt';
% delimiterIn = ' ';
% headerlinesIn = 1;
% A = importdata(filename,delimiterIn,headerlinesIn);
cd('C:\Users\qingz\Documents\MATLAB\BandStructure')
%指定当前文件夹即保存位置
global MainPosition Material
gap=[4.058,5.659]
Material='AlN'
MainPosition=[0.169 0.169 0.260 0.260 0.428 ...
    0.428 0.520 0.520 0.714 0.714 0.805 0.805];
% 指定带隙（顺序是GGA HSE06）
% 主标记位置以划画竖线去掉了0和1--去掉了首末位置
Position=[0 0.0845 0.169 0.2145 0.260 0.3440 0.428...
    0.4740 0.520 0.6170 0.714 0.7595 0.805 0.9025 1];     %x轴刻度位置
Label={'A' 'R' 'L' 'U' 'M' 'Σ' 'Γ' 'Δ' 'A' 'S'...
    'H' 'P' 'K' 'T' 'Γ'};  %刻度名称
savefilename={'BandStr_GGA','BandStr_HSE06',...
    'DOS_GGA','DOS_HSE06',...
    'PDOS_Al_GGA','PDOS_Al_HSE06','PDOS_N_GGA','PDOS_N_HSE06','PDOS_Total_GGA','PDOS_Total_HSE06',...
    'OpticalPro_GGA','OpticalPro_HSE06'}
% 指定画图文件GGA/HSE06，能带/态密度/P态密度/光学性质
h(1)=figure(1);
BandStrucPlotFun(savefilename{1},gap(1),Position,Label) %调用画图函数
h(2)=figure(2);
BandStrucPlotFun(savefilename{2},gap(2),Position,Label)
% 能带作图结束
h(3)=figure(3);
DosPlotFun(savefilename{3})
h(4)=figure(4);
DosPlotFun(savefilename{4})
% 态密度做图结束
% 以下PDos
h(5)=figure(5);
PDosPlotFun(savefilename{5})
h(6)=figure(6);
PDosPlotFun(savefilename{6})
h(7)=figure(7);
PDosPlotFun(savefilename{7})
h(8)=figure(8);
PDosPlotFun(savefilename{8})
h(9)=figure(9);
PDosPlotFun(savefilename{9})
h(10)=figure(10);
PDosPlotFun(savefilename{10})
% PDos结束
h(11)=figure(11);
OpticalProPlotFun(savefilename{11})
h(12)=figure(12);
OpticalProPlotFun(savefilename{12})
%光学性质
savefig(h,'AlNBulkFigures.fig');
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