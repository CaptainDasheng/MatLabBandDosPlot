function []=OnekeyPub(PlotType)
global figureo
figureo=0;
%PlotType�����ͱ�����ȡֵΪ10 11 12 13 ��ӦErAll ErAl ErAlVN ErAlVAl
%    Bandstructure   ȡֵΪ20 21 22 23 ��ӦEuAll EuAl EuAlVN EuAlVAl
%    Bandstructure   ȡֵΪ30 31 32 33 ��ӦTmAll TmAl TmAlVN TmAlVAl
%    Bandstructure   ȡֵΪ100 200 300 ��ӦErOptic EuOptic TmOptic
%%%#################�����������ֵ##################################
PPsavefilename{1,:,1}={'ErAl_PBE_BandStr','ErAl_PBE_DOS_Total',...
    'ErAl_PBE_PDOS_Total',... %�ֲ���̬�ܶ�
    'ErAl_PBE_PDOS_Al','ErAl_PBE_PDOS_N',...
    'ErAl_PBE_PDOS_Er'};
PPsavefilename{2,:,1}={'ErAlVN_PBE_BandStr','ErAlVN_PBE_DOS_Total',...
    'ErAlVN_PBE_PDOS_Total',... %�ֲ���̬�ܶ�
    'ErAlVN_PBE_PDOS_Al','ErAlVN_PBE_PDOS_N',...
    'ErAlVN_PBE_PDOS_Er'};
PPsavefilename{3,:,1}={'ErAlVAl_PBE_BandStr','ErAlVAl_PBE_DOS_Total',...
    'ErAlVAl_PBE_PDOS_Total',... %�ֲ���̬�ܶ�
    'ErAlVAl_PBE_PDOS_Al','ErAlVAl_PBE_PDOS_N',...
    'ErAlVAl_PBE_PDOS_Er'};	
%$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
PPsavefilename{1,:,2}={'EuAl_PBE_BandStr','EuAl_PBE_DOS_Total',...
    'EuAl_PBE_PDOS_Total',... %�ֲ���̬�ܶ�
    'EuAl_PBE_PDOS_Al','EuAl_PBE_PDOS_N',...
    'EuAl_PBE_PDOS_Eu'};
PPsavefilename{2,:,2}={'EuAlVN_PBE_BandStr','EuAlVN_PBE_DOS_Total',...
    'EuAlVN_PBE_PDOS_Total',... %�ֲ���̬�ܶ�
    'EuAlVN_PBE_PDOS_Al','EuAlVN_PBE_PDOS_N',...
    'EuAlVN_PBE_PDOS_Eu'};
PPsavefilename{3,:,2}={'EuAlVAl_PBE_BandStr','EuAlVAl_PBE_DOS_Total',...
    'EuAlVAl_PBE_PDOS_Total',... %�ֲ���̬�ܶ�
    'EuAlVAl_PBE_PDOS_Al','EuAlVAl_PBE_PDOS_N',...
    'EuAlVAl_PBE_PDOS_Eu'};
%$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
PPsavefilename{1,:,3}={'TmAl_PBE_BandStr','TmAl_PBE_DOS_Total',...
    'TmAl_PBE_PDOS_Total',... %�ֲ���̬�ܶ�
    'TmAl_PBE_PDOS_Al','TmAl_PBE_PDOS_N',...
    'TmAl_PBE_PDOS_Tm'};
PPsavefilename{2,:,3}={'TmAlVN_PBE_BandStr','TmAlVN_PBE_DOS_Total',...
    'TmAlVN_PBE_PDOS_Total',... %�ֲ���̬�ܶ�
    'TmAlVN_PBE_PDOS_Al','TmAlVN_PBE_PDOS_N',...
    'TmAlVN_PBE_PDOS_Tm'};
PPsavefilename{3,:,3}={'TmAlVAl_PBE_BandStr','TmAlVAl_PBE_DOS_Total',...
    'TmAlVAl_PBE_PDOS_Total',... %�ֲ���̬�ܶ�
    'TmAlVAl_PBE_PDOS_Al','TmAlVAl_PBE_PDOS_N',...
    'TmAlVAl_PBE_PDOS_Tm'};
%PPsavefilename ��ֵ����################################
PPMaterialElement={'Al','N','Er';'Al','N','Eu';'Al','N','Tm'};
%MaterialElement={'Al','N','Tm'}  %����Al N ϡ���Ĵ��� Er Eu Tm
PPMaterial={'AlN:Er_{Al}','AlN:Er_{Al}-V_N','AlN:Er_{Al}-V_{Al}';...
          'AlN:Eu_{Al}','AlN:Eu_{Al}-V_N','AlN:Eu_{Al}-V_{Al}';...
          'AlN:Tm_{Al}','AlN:Tm_{Al}-V_N','AlN:Tm_{Al}-V_{Al}'};
PPToSaveFile={'ErAl','ErAlVN','ErAlVAl';...
             'EuAl','EuAlVN','EuAlVAl';...
             'TmAl','TmAlVN','TmAlVAl'};
%%%######################�����ļ���ֵ����#############################
%%%###########################################################
PTranslationup=[0.000,   0.000,    0.000;...
                0.000,   4.097,    1.224;...
                0.034,   4.365,    2.635];   %%%�ܴ�ƽ����SpinUp
            %1 2 3�зֱ���Er Eu Tm
PTranslationdown=[0.000,   0.000,   0.000;...
                  0.143,   3.759,   0.918;...
                  0.000,   4.278,   2.662];    %%%�ܴ�ƽ����SpinDown  
%��ֵ���ϣ��ң�ƽ�ƣ���ֵ���£���ƽ��
%@@@@up@@@ForEr ErAl 0.00  ErAlVN 3.00 ErAlVAl 1.40@@@@@
%@@@@up@@@@@ForEu EuAl 0.000  EuAlVN 4.097 EuAlVAl 1.224@@@@@
%@@@@up@@@@@ForTm TmAl 0.034 TmAlVN 4.365 TmAlVAl 2.635@@@@@@

%@@@down@@@@ForEr ErAl 0.00  ErAlVN 3.00 ErAlVAl 1.40@@@@@
%@@@down@@@@ForEu EuAl 0.143  EuAlVN 3.759 EuAlVAl 0.918@@@@@
%@@@down@@@@ForTm TmAl 0.000  TmAlVN 4.278 TmAlVAl 2.662@@@@@@
%###################################################################
%#########################��ѧ���ʸ���ֵ#############################
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
%#########################��ѧ���ʸ���ֵ#############################
%###################################################################


%%%##################������ÿ�ʼ#####################
switch PlotType
%%%#################################################################
%%%###########################All��ͼ����############################
    case 10
        Cho=1;%Choose�ļ��
        DopePublishFun(PPMaterialElement(Cho,:),PPsavefilename(1,:,Cho),...
        PPMaterial(Cho,1),PPToSaveFile(Cho,1),PTranslationup(Cho,1),PTranslationdown(Cho,1))
    %ErAl ��ͼ
        DopePublishFun(PPMaterialElement(Cho,:),PPsavefilename(2,:,Cho),...
        PPMaterial(Cho,2),PPToSaveFile(Cho,2),PTranslationup(Cho,2),PTranslationdown(Cho,2))
    %ErAlVN  ��ͼ
        DopePublishFun(PPMaterialElement(Cho,:),PPsavefilename(3,:,Cho),...
        PPMaterial(Cho,3),PPToSaveFile(Cho,3),PTranslationup(Cho,3),PTranslationdown(Cho,3))  
    %ErAlVNAl  ��ͼ
%%%###############Er All��ͼ#######################################
    case 20
        Cho=2;%Choose�ļ��
        DopePublishFun(PPMaterialElement(Cho,:),PPsavefilename(1,:,Cho),...
        PPMaterial(Cho,1),PPToSaveFile(Cho,1),PTranslationup(Cho,1),PTranslationdown(Cho,1))
    %EuAl ��ͼ
        DopePublishFun(PPMaterialElement(Cho,:),PPsavefilename(2,:,Cho),...
        PPMaterial(Cho,2),PPToSaveFile(Cho,2),PTranslationup(Cho,2),PTranslationdown(Cho,2))
    %EuAlVN  ��ͼ
        DopePublishFun(PPMaterialElement(Cho,:),PPsavefilename(3,:,Cho),...
        PPMaterial(Cho,3),PPToSaveFile(Cho,3),PTranslationup(Cho,3),PTranslationdown(Cho,3))  
    %EuAlVNAl  ��ͼ
%%%###############Eu All��ͼ#######################################    
%     function []=DopePublishFun(PMaterialElement,Psavefilename,...
%         PMaterial,PToSaveFile,PBandTranslation)
    case 30
        Cho=3;%Choose�ļ��
        DopePublishFun(PPMaterialElement(Cho,:),PPsavefilename(1,:,Cho),...
        PPMaterial(Cho,1),PPToSaveFile(Cho,1),PTranslationup(Cho,1),PTranslationdown(Cho,1))
    %TmAl ��ͼ
        DopePublishFun(PPMaterialElement(Cho,:),PPsavefilename(2,:,Cho),...
        PPMaterial(Cho,2),PPToSaveFile(Cho,2),PTranslationup(Cho,2),PTranslationdown(Cho,2))
    %TmAlVN  ��ͼ
        DopePublishFun(PPMaterialElement(Cho,:),PPsavefilename(3,:,Cho),...
        PPMaterial(Cho,3),PPToSaveFile(Cho,3),PTranslationup(Cho,3),PTranslationdown(Cho,3))  
    %TmAlVNAl  ��ͼ
%%%###############Tm All��ͼ#######################################
%%%###########################All��ͼ���ֽ���########################
%%%#################################################################

%%%#################################################################
%%%###########################Partial ��ͼ����############################
    case 11
        Cho=1;%Choose�ļ��
        DopePublishFun(PPMaterialElement(Cho,:),PPsavefilename(1,:,Cho),...
        PPMaterial(Cho,1),PPToSaveFile(Cho,1),PTranslationup(Cho,1),PTranslationdown(Cho,1))
    %ErAl ��ͼ
    case 12
        Cho=1;%Choose�ļ��
        DopePublishFun(PPMaterialElement(Cho,:),PPsavefilename(2,:,Cho),...
        PPMaterial(Cho,2),PPToSaveFile(Cho,2),PTranslationup(Cho,2),PTranslationdown(Cho,2))
    %ErAlVN  ��ͼ
    case 13
        Cho=1;%Choose�ļ��
        DopePublishFun(PPMaterialElement(Cho,:),PPsavefilename(3,:,Cho),...
        PPMaterial(Cho,3),PPToSaveFile(Cho,3),PTranslationup(Cho,3),PTranslationdown(Cho,3))  
    %ErAlVNAl  ��ͼ
%%%###############Er Partial��ͼ#######################################
    case 21
        Cho=2;%Choose�ļ��
        DopePublishFun(PPMaterialElement(Cho,:),PPsavefilename(1,:,Cho),...
        PPMaterial(Cho,1),PPToSaveFile(Cho,1),PTranslationup(Cho,1),PTranslationdown(Cho,1))
    %EuAl ��ͼ
    case 22
        Cho=2;%Choose�ļ�� 
        DopePublishFun(PPMaterialElement(Cho,:),PPsavefilename(2,:,Cho),...
        PPMaterial(Cho,2),PPToSaveFile(Cho,2),PTranslationup(Cho,2),PTranslationdown(Cho,2))
    %EuAlVN  ��ͼ
    case 23
        Cho=2;%Choose�ļ��    
        DopePublishFun(PPMaterialElement(Cho,:),PPsavefilename(3,:,Cho),...
        PPMaterial(Cho,3),PPToSaveFile(Cho,3),PTranslationup(Cho,3),PTranslationdown(Cho,3))  
    %EuAlVNAl  ��ͼ
%%%###############Eu Partial��ͼ#######################################
    case 31
        Cho=3;%Choose�ļ��
        DopePublishFun(PPMaterialElement(Cho,:),PPsavefilename(1,:,Cho),...
        PPMaterial(Cho,1),PPToSaveFile(Cho,1),PTranslationup(Cho,1),PTranslationdown(Cho,1))
    %TmAl ��ͼ
    case 32
        Cho=3;%Choose�ļ��    
        DopePublishFun(PPMaterialElement(Cho,:),PPsavefilename(2,:,Cho),...
        PPMaterial(Cho,2),PPToSaveFile(Cho,2),PTranslationup(Cho,2),PTranslationdown(Cho,2))
    %TmAlVN  ��ͼ
    case 33
        Cho=3;%Choose�ļ��
        DopePublishFun(PPMaterialElement(Cho,:),PPsavefilename(3,:,Cho),...
        PPMaterial(Cho,3),PPToSaveFile(Cho,3),PTranslationup(Cho,3),PTranslationdown(Cho,3))  
    %TmAlVNAl  ��ͼ
%%%###############Tm Partial��ͼ#######################################
%%%###########################Partial ��ͼ���ֽ���########################
%%%#################################################################

%%%###########################��ѧ������ͼ########################
%%%#################################################################
   %%%%%Er��ѧ������ͼ
    case 100
        OCho=1;%OpticalChoose�ļ��
        PubOpticFun(PPMaterialOptic(1,OCho),PPOpticfilename(OCho,:))
   %%%%%Eu��ѧ������ͼ
    case 200
        OCho=2;%OpticalChoose�ļ��
        PubOpticFun(PPMaterialOptic(1,OCho),PPOpticfilename(OCho,:))
   %%%%%Tm��ѧ������ͼ
    case 300
        OCho=3;%OpticalChoose�ļ��
        PubOpticFun(PPMaterialOptic(1,OCho),PPOpticfilename(OCho,:))

end

end