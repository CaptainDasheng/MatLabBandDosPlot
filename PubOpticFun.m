%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%����纯��������ϵ����ͼ%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%��Ҫ����ȱ�ݽṹ������%%%%%%%%
%%%
%��ҪMaterialOptic OptLim MaterialOptic savefilename
%%%
function []=PubOpticFun(PMaterialOptic,POpticfilename)
cd('C:\Users\qingz\Documents\MATLAB\BandStructure')
%ָ����ǰ�ļ���,������λ��%%%%%%%%%
%##############���򸳳�ֵ#######################################%%%
global MaterialOptic OptLim OpticLegend
OptLim=[0,37];           %��ѧ���������ޣ�������
%!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
%!!!!!!!!!!!!!!!!!һ��ֻ��Ҫ�����³�ֵ�еĵ�һ���͵�����!!!!!!!!!!!!!!!!!
MaterialOptic=PMaterialOptic{1,1}   %�����õ��ļ�����һ���ַ����� Er Eu Tm
OpticLegend={[MaterialOptic '_{Al}'],...
             [MaterialOptic '_{Al} -V_N'],...
             [MaterialOptic '_{Al} -V_{Al}']};   
%%%%%%%%%%%%����纯��ͼ������������%%%%%%%%%%%%%%%
savefilename=POpticfilename{1,1};
%%%˳����TmAl_Di TmAlVN_Di TmAlVAl_Di%%%%%%%%%%%
%%%Ȼ����TmAl_Ab TmAlVN_Ab TmAlVAl_Ab%%%%%%%%%%%
%%%Di for Dielectric  Ab for Absorption%%%%%%%%%%
%!!!!!!!!!!!!!!!!!!!һ��ֻ��Ҫ�����ϳ�ֵ!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
%!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
%%%%%%%%%%%%%%������ֵ��������ʼ��ͼ����%%%%%%%%%%%%%%%%
PubOpticPlotFunc(savefilename)
disp('�������OPtical Dielectric&Absorption Plotting Completed Successfully')
end