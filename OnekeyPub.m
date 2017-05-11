function []=OnekeyPub(PlotType)
global figureo
figureo=0;
%PlotType整数型变量，取值为10 11 12 13 对应ErAll ErAl ErAlVN ErAlVAl
%    Bandstructure   取值为20 21 22 23 对应EuAll EuAl EuAlVN EuAlVAl
%    Bandstructure   取值为30 31 32 33 对应TmAll TmAl TmAlVN TmAlVAl
%    Bandstructure   取值为100 200 300 对应ErOptic EuOptic TmOptic
%%%#################数组变量赋初值##################################
PPsavefilename{1,:,1}={'ErAl_PBE_BandStr','ErAl_PBE_DOS_Total',...
    'ErAl_PBE_PDOS_Total',... %分波总态密度
    'ErAl_PBE_PDOS_Al','ErAl_PBE_PDOS_N',...
    'ErAl_PBE_PDOS_Er'};
PPsavefilename{2,:,1}={'ErAlVN_PBE_BandStr','ErAlVN_PBE_DOS_Total',...
    'ErAlVN_PBE_PDOS_Total',... %分波总态密度
    'ErAlVN_PBE_PDOS_Al','ErAlVN_PBE_PDOS_N',...
    'ErAlVN_PBE_PDOS_Er'};
PPsavefilename{3,:,1}={'ErAlVAl_PBE_BandStr','ErAlVAl_PBE_DOS_Total',...
    'ErAlVAl_PBE_PDOS_Total',... %分波总态密度
    'ErAlVAl_PBE_PDOS_Al','ErAlVAl_PBE_PDOS_N',...
    'ErAlVAl_PBE_PDOS_Er'};	
%$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
PPsavefilename{1,:,2}={'EuAl_PBE_BandStr','EuAl_PBE_DOS_Total',...
    'EuAl_PBE_PDOS_Total',... %分波总态密度
    'EuAl_PBE_PDOS_Al','EuAl_PBE_PDOS_N',...
    'EuAl_PBE_PDOS_Eu'};
PPsavefilename{2,:,2}={'EuAlVN_PBE_BandStr','EuAlVN_PBE_DOS_Total',...
    'EuAlVN_PBE_PDOS_Total',... %分波总态密度
    'EuAlVN_PBE_PDOS_Al','EuAlVN_PBE_PDOS_N',...
    'EuAlVN_PBE_PDOS_Eu'};
PPsavefilename{3,:,2}={'EuAlVAl_PBE_BandStr','EuAlVAl_PBE_DOS_Total',...
    'EuAlVAl_PBE_PDOS_Total',... %分波总态密度
    'EuAlVAl_PBE_PDOS_Al','EuAlVAl_PBE_PDOS_N',...
    'EuAlVAl_PBE_PDOS_Eu'};
%$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
PPsavefilename{1,:,3}={'TmAl_PBE_BandStr','TmAl_PBE_DOS_Total',...
    'TmAl_PBE_PDOS_Total',... %分波总态密度
    'TmAl_PBE_PDOS_Al','TmAl_PBE_PDOS_N',...
    'TmAl_PBE_PDOS_Tm'};
PPsavefilename{2,:,3}={'TmAlVN_PBE_BandStr','TmAlVN_PBE_DOS_Total',...
    'TmAlVN_PBE_PDOS_Total',... %分波总态密度
    'TmAlVN_PBE_PDOS_Al','TmAlVN_PBE_PDOS_N',...
    'TmAlVN_PBE_PDOS_Tm'};
PPsavefilename{3,:,3}={'TmAlVAl_PBE_BandStr','TmAlVAl_PBE_DOS_Total',...
    'TmAlVAl_PBE_PDOS_Total',... %分波总态密度
    'TmAlVAl_PBE_PDOS_Al','TmAlVAl_PBE_PDOS_N',...
    'TmAlVAl_PBE_PDOS_Tm'};
%PPsavefilename 赋值结束################################
PPMaterialElement={'Al','N','Er';'Al','N','Eu';'Al','N','Tm'};
%MaterialElement={'Al','N','Tm'}  %按照Al N 稀土的次序 Er Eu Tm
PPMaterial={'AlN:Er_{Al}','AlN:Er_{Al}-V_N','AlN:Er_{Al}-V_{Al}';...
          'AlN:Eu_{Al}','AlN:Eu_{Al}-V_N','AlN:Eu_{Al}-V_{Al}';...
          'AlN:Tm_{Al}','AlN:Tm_{Al}-V_N','AlN:Tm_{Al}-V_{Al}'};
PPToSaveFile={'ErAl','ErAlVN','ErAlVAl';...
             'EuAl','EuAlVN','EuAlVAl';...
             'TmAl','TmAlVN','TmAlVAl'};
%%%######################命名文件赋值结束#############################
%%%###########################################################
PTranslationup=[0.000,   0.000,    0.000;...
                0.000,   4.097,    1.224;...
                0.034,   4.365,    2.635];   %%%能带平移量SpinUp
            %1 2 3行分别是Er Eu Tm
PTranslationdown=[0.000,   0.000,   0.000;...
                  0.143,   3.759,   0.918;...
                  0.000,   4.278,   2.662];    %%%能带平移量SpinDown  
%正值向上（右）平移，负值向下（左）平移
%@@@@up@@@ForEr ErAl 0.00  ErAlVN 3.00 ErAlVAl 1.40@@@@@
%@@@@up@@@@@ForEu EuAl 0.000  EuAlVN 4.097 EuAlVAl 1.224@@@@@
%@@@@up@@@@@ForTm TmAl 0.034 TmAlVN 4.365 TmAlVAl 2.635@@@@@@

%@@@down@@@@ForEr ErAl 0.00  ErAlVN 3.00 ErAlVAl 1.40@@@@@
%@@@down@@@@ForEu EuAl 0.143  EuAlVN 3.759 EuAlVAl 0.918@@@@@
%@@@down@@@@ForTm TmAl 0.000  TmAlVN 4.278 TmAlVAl 2.662@@@@@@
%###################################################################
%#########################光学性质赋初值#############################
PPMaterialOptic={'Er','Eu','Tm'};
PPOpticfilename{1,:}={'ErAl_PBE_Optics_Dielectric','ErAlVN_PBE_Optics_Dielectric'...
    'ErAlVAl_PBE_Optics_Dielectric','ErAl_PBE_Optics_Absorption'...
    'ErAlVN_PBE_Optics_Absorption','ErAlVAl_PBE_Optics_Absorption'};
PPOpticfilename{2,:}={'EuAl_PBE_Optics_Dielectric','EuAlVN_PBE_Optics_Dielectric'...
    'EuAlVAl_PBE_Optics_Dielectric','EuAl_PBE_Optics_Absorption'...
    'EuAlVN_PBE_Optics_Absorption','EuAlVAl_PBE_Optics_Absorption'};
PPOpticfilename{3,:}={'TmAl_PBE_Optics_Dielectric','TmAlVN_PBE_Optics_Dielectric'...
    'TmAlVAl_PBE_Optics_Dielectric','TmAl_PBE_Optics_Absorption'...
    'TmAlVN_PBE_Optics_Absorption','TmAlVAl_PBE_Optics_Absorption'};
%#########################光学性质赋初值#############################
%###################################################################


%%%##################主体调用开始#####################
switch PlotType
%%%#################################################################
%%%###########################All作图部分############################
    case 10
        Cho=1;%Choose的简称
        DopePublishFun(PPMaterialElement(Cho,:),PPsavefilename(1,:,Cho),...
        PPMaterial(Cho,1),PPToSaveFile(Cho,1),PTranslationup(Cho,1),PTranslationdown(Cho,1))
    %ErAl 作图
        DopePublishFun(PPMaterialElement(Cho,:),PPsavefilename(2,:,Cho),...
        PPMaterial(Cho,2),PPToSaveFile(Cho,2),PTranslationup(Cho,2),PTranslationdown(Cho,2))
    %ErAlVN  作图
        DopePublishFun(PPMaterialElement(Cho,:),PPsavefilename(3,:,Cho),...
        PPMaterial(Cho,3),PPToSaveFile(Cho,3),PTranslationup(Cho,3),PTranslationdown(Cho,3))  
    %ErAlVNAl  作图
%%%###############Er All作图#######################################
    case 20
        Cho=2;%Choose的简称
        DopePublishFun(PPMaterialElement(Cho,:),PPsavefilename(1,:,Cho),...
        PPMaterial(Cho,1),PPToSaveFile(Cho,1),PTranslationup(Cho,1),PTranslationdown(Cho,1))
    %EuAl 作图
        DopePublishFun(PPMaterialElement(Cho,:),PPsavefilename(2,:,Cho),...
        PPMaterial(Cho,2),PPToSaveFile(Cho,2),PTranslationup(Cho,2),PTranslationdown(Cho,2))
    %EuAlVN  作图
        DopePublishFun(PPMaterialElement(Cho,:),PPsavefilename(3,:,Cho),...
        PPMaterial(Cho,3),PPToSaveFile(Cho,3),PTranslationup(Cho,3),PTranslationdown(Cho,3))  
    %EuAlVNAl  作图
%%%###############Eu All作图#######################################    
%     function []=DopePublishFun(PMaterialElement,Psavefilename,...
%         PMaterial,PToSaveFile,PBandTranslation)
    case 30
        Cho=3;%Choose的简称
        DopePublishFun(PPMaterialElement(Cho,:),PPsavefilename(1,:,Cho),...
        PPMaterial(Cho,1),PPToSaveFile(Cho,1),PTranslationup(Cho,1),PTranslationdown(Cho,1))
    %TmAl 作图
        DopePublishFun(PPMaterialElement(Cho,:),PPsavefilename(2,:,Cho),...
        PPMaterial(Cho,2),PPToSaveFile(Cho,2),PTranslationup(Cho,2),PTranslationdown(Cho,2))
    %TmAlVN  作图
        DopePublishFun(PPMaterialElement(Cho,:),PPsavefilename(3,:,Cho),...
        PPMaterial(Cho,3),PPToSaveFile(Cho,3),PTranslationup(Cho,3),PTranslationdown(Cho,3))  
    %TmAlVNAl  作图
%%%###############Tm All作图#######################################
%%%###########################All作图部分结束########################
%%%#################################################################

%%%#################################################################
%%%###########################Partial 作图部分############################
    case 11
        Cho=1;%Choose的简称
        DopePublishFun(PPMaterialElement(Cho,:),PPsavefilename(1,:,Cho),...
        PPMaterial(Cho,1),PPToSaveFile(Cho,1),PTranslationup(Cho,1),PTranslationdown(Cho,1))
    %ErAl 作图
    case 12
        Cho=1;%Choose的简称
        DopePublishFun(PPMaterialElement(Cho,:),PPsavefilename(2,:,Cho),...
        PPMaterial(Cho,2),PPToSaveFile(Cho,2),PTranslationup(Cho,2),PTranslationdown(Cho,2))
    %ErAlVN  作图
    case 13
        Cho=1;%Choose的简称
        DopePublishFun(PPMaterialElement(Cho,:),PPsavefilename(3,:,Cho),...
        PPMaterial(Cho,3),PPToSaveFile(Cho,3),PTranslationup(Cho,3),PTranslationdown(Cho,3))  
    %ErAlVNAl  作图
%%%###############Er Partial作图#######################################
    case 21
        Cho=2;%Choose的简称
        DopePublishFun(PPMaterialElement(Cho,:),PPsavefilename(1,:,Cho),...
        PPMaterial(Cho,1),PPToSaveFile(Cho,1),PTranslationup(Cho,1),PTranslationdown(Cho,1))
    %EuAl 作图
    case 22
        Cho=2;%Choose的简称 
        DopePublishFun(PPMaterialElement(Cho,:),PPsavefilename(2,:,Cho),...
        PPMaterial(Cho,2),PPToSaveFile(Cho,2),PTranslationup(Cho,2),PTranslationdown(Cho,2))
    %EuAlVN  作图
    case 23
        Cho=2;%Choose的简称    
        DopePublishFun(PPMaterialElement(Cho,:),PPsavefilename(3,:,Cho),...
        PPMaterial(Cho,3),PPToSaveFile(Cho,3),PTranslationup(Cho,3),PTranslationdown(Cho,3))  
    %EuAlVNAl  作图
%%%###############Eu Partial作图#######################################
    case 31
        Cho=3;%Choose的简称
        DopePublishFun(PPMaterialElement(Cho,:),PPsavefilename(1,:,Cho),...
        PPMaterial(Cho,1),PPToSaveFile(Cho,1),PTranslationup(Cho,1),PTranslationdown(Cho,1))
    %TmAl 作图
    case 32
        Cho=3;%Choose的简称    
        DopePublishFun(PPMaterialElement(Cho,:),PPsavefilename(2,:,Cho),...
        PPMaterial(Cho,2),PPToSaveFile(Cho,2),PTranslationup(Cho,2),PTranslationdown(Cho,2))
    %TmAlVN  作图
    case 33
        Cho=3;%Choose的简称
        DopePublishFun(PPMaterialElement(Cho,:),PPsavefilename(3,:,Cho),...
        PPMaterial(Cho,3),PPToSaveFile(Cho,3),PTranslationup(Cho,3),PTranslationdown(Cho,3))  
    %TmAlVNAl  作图
%%%###############Tm Partial作图#######################################
%%%###########################Partial 作图部分结束########################
%%%#################################################################

%%%###########################光学性质作图########################
%%%#################################################################
   %%%%%Er光学性质作图
    case 100
        OCho=1;%OpticalChoose的简称
        PubOpticFun(PPMaterialOptic(1,OCho),PPOpticfilename(OCho,:))
   %%%%%Eu光学性质作图
    case 200
        OCho=2;%OpticalChoose的简称
        PubOpticFun(PPMaterialOptic(1,OCho),PPOpticfilename(OCho,:))
   %%%%%Tm光学性质作图
    case 300
        OCho=3;%OpticalChoose的简称
        PubOpticFun(PPMaterialOptic(1,OCho),PPOpticfilename(OCho,:))

end

end