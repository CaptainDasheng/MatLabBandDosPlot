%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%����纯��������ϵ����ͼ%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%��Ҫ����ȱ�ݽṹ������%%%%%%%%
%%%
%��ҪMaterialOptic OptLim MaterialOptic savefilename
%%%
cc
cd('C:\Users\qingz\Documents\MATLAB\BandStructure')
%ָ����ǰ�ļ���,������λ��%%%%%%%%%
%##############���򸳳�ֵ#######################################%%%
global MaterialOptic OptLim OpticLegend
OptLim=[0,34];           %��ѧ���������ޣ�������
%#############һ��ֻ��Ҫ�����³�ֵ�еĵ�һ���͵�����##################
MaterialOptic='Eu'      %�����õ��ļ�����һ���ַ����� Er Eu Tm
OpticLegend={[MaterialOptic '_{Al}'],...
             [MaterialOptic '_{Al} -V_N'],...
             [MaterialOptic '_{Al} -V_{Al}']};   
%%%%%%%%%%%%����纯��ͼ������������%%%%%%%%%%%%%%%
savefilename={'EuAl_PBE_Optics_Dielectric','EuAl_VN_PBE_Optics_Dielectric',...
    'EuAl_VAl_PBE_Optics_Dielectric','EuAl_PBE_Optics_Absorption',...
    'EuAl_VN_PBE_Optics_Absorption','EuAl_VAl_PBE_Optics_Absorption'};
%%%˳����TmAl_Di TmAlVN_Di TmAlVAl_Di%%%%%%%%%%%
%%%Ȼ����TmAl_Ab TmAlVN_Ab TmAlVAl_Ab%%%%%%%%%%%
%%%Di for Dielectric  Ab for Absorption%%%%%%%%%%
%%%%%%%%%%%%%%������ֵ��������ʼ��ͼ����%%%%%%%%%%%%%%%%
%###################һ��ֻ��Ҫ�����ϳ�ֵ#############################
PubOpticPlotFunc(savefilename)
disp('�������OPtical Dielectric&Absorption Plotting Completed Successfully')