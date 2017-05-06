%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%复介电函数和吸收系数作图%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%需要三种缺陷结构的数据%%%%%%%%
%%%
%需要MaterialOptic OptLim MaterialOptic savefilename
%%%
cc
cd('C:\Users\qingz\Documents\MATLAB\BandStructure')
%指定当前文件夹,即保存位置%%%%%%%%%
%##############程序赋初值#######################################%%%
global MaterialOptic OptLim OpticLegend
OptLim=[0,34];           %光学性质左右限，两个数
%#############一般只需要赋以下初值中的第一个和第三个##################
MaterialOptic='Eu'      %保存用的文件名，一个字符，如 Er Eu Tm
OpticLegend={[MaterialOptic '_{Al}'],...
             [MaterialOptic '_{Al} -V_N'],...
             [MaterialOptic '_{Al} -V_{Al}']};   
%%%%%%%%%%%%复介电函数图例，三个数组%%%%%%%%%%%%%%%
savefilename={'EuAl_PBE_Optics_Dielectric','EuAl_VN_PBE_Optics_Dielectric',...
    'EuAl_VAl_PBE_Optics_Dielectric','EuAl_PBE_Optics_Absorption',...
    'EuAl_VN_PBE_Optics_Absorption','EuAl_VAl_PBE_Optics_Absorption'};
%%%顺序是TmAl_Di TmAlVN_Di TmAlVAl_Di%%%%%%%%%%%
%%%然后是TmAl_Ab TmAlVN_Ab TmAlVAl_Ab%%%%%%%%%%%
%%%Di for Dielectric  Ab for Absorption%%%%%%%%%%
%%%%%%%%%%%%%%参数赋值结束，开始作图程序%%%%%%%%%%%%%%%%
%###################一般只需要赋以上初值#############################
PubOpticPlotFunc(savefilename)
disp('你真棒！OPtical Dielectric&Absorption Plotting Completed Successfully')