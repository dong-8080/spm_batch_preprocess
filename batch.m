% 存放源数据的文件夹
basePath = 'D:\data\partdata\ADNI_subejct';
% 存放预处理后数据的文件夹
rootDir = 'C:\Users\Administrator\Desktop\data3';
array = table2array(filelist);
for i=1:length(array)
    filename = [basePath filesep char(array(i))];
    % 获取nii文件上一级文件的名称
    split = strsplit(string(filename), '\');
    subDir = char(split(5));
    % 调用批处理函数
    spm_jobman('run', batch(filename, rootDir, subDir))
end

function matlabbatch = batch(filename, rootDir, subDir)
    %-----------------------------------------------------------------------
    % Job saved on 21-May-2021 15:33:48 by cfg_util (rev $Rev: 7345 $)
    % spm SPM - SPM12 (7771)
    % cfg_basicio BasicIO - Unknown
    %-----------------------------------------------------------------------
    
    % 1. sleect file
    matlabbatch{1}.cfg_basicio.file_dir.file_ops.cfg_named_file.name = 'rawData';
    matlabbatch{1}.cfg_basicio.file_dir.file_ops.cfg_named_file.files = {{filename}};
    % 2. normalise
    matlabbatch{2}.spm.spatial.normalise.estwrite.subj.vol(1) = cfg_dep('Named File Selector: rawData(1) - Files', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files', '{}',{1}));
    matlabbatch{2}.spm.spatial.normalise.estwrite.subj.resample(1) = cfg_dep('Named File Selector: rawData(1) - Files', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files', '{}',{1}));
    matlabbatch{2}.spm.spatial.normalise.estwrite.eoptions.biasreg = 0.0001;
    matlabbatch{2}.spm.spatial.normalise.estwrite.eoptions.biasfwhm = 60;
    matlabbatch{2}.spm.spatial.normalise.estwrite.eoptions.tpm = {'D:\software\matlab\toolbox\spm12\tpm\TPM.nii'};
    matlabbatch{2}.spm.spatial.normalise.estwrite.eoptions.affreg = 'mni';
    matlabbatch{2}.spm.spatial.normalise.estwrite.eoptions.reg = [0 0.001 0.5 0.05 0.2];
    matlabbatch{2}.spm.spatial.normalise.estwrite.eoptions.fwhm = 0;
    matlabbatch{2}.spm.spatial.normalise.estwrite.eoptions.samp = 3;
    matlabbatch{2}.spm.spatial.normalise.estwrite.woptions.bb = [-78 -112 -70
                                                                 78 76 85];
    matlabbatch{2}.spm.spatial.normalise.estwrite.woptions.vox = [2 2 2];
    matlabbatch{2}.spm.spatial.normalise.estwrite.woptions.interp = 4;
    matlabbatch{2}.spm.spatial.normalise.estwrite.woptions.prefix = 'w';
    % segment
    matlabbatch{3}.spm.spatial.preproc.channel.vols(1) = cfg_dep('Normalise: Estimate & Write: Normalised Images (Subj 1)', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('()',{1}, '.','files'));
    matlabbatch{3}.spm.spatial.preproc.channel.biasreg = 0.001;
    matlabbatch{3}.spm.spatial.preproc.channel.biasfwhm = 60;
    matlabbatch{3}.spm.spatial.preproc.channel.write = [0 0];
    matlabbatch{3}.spm.spatial.preproc.tissue(1).tpm = {'D:\software\matlab\toolbox\spm12\tpm\TPM.nii,1'};
    matlabbatch{3}.spm.spatial.preproc.tissue(1).ngaus = 1;
    matlabbatch{3}.spm.spatial.preproc.tissue(1).native = [1 0];
    matlabbatch{3}.spm.spatial.preproc.tissue(1).warped = [0 0];
    matlabbatch{3}.spm.spatial.preproc.tissue(2).tpm = {'D:\software\matlab\toolbox\spm12\tpm\TPM.nii,2'};
    matlabbatch{3}.spm.spatial.preproc.tissue(2).ngaus = 1;
    matlabbatch{3}.spm.spatial.preproc.tissue(2).native = [1 0];
    matlabbatch{3}.spm.spatial.preproc.tissue(2).warped = [0 0];
    matlabbatch{3}.spm.spatial.preproc.tissue(3).tpm = {'D:\software\matlab\toolbox\spm12\tpm\TPM.nii,3'};
    matlabbatch{3}.spm.spatial.preproc.tissue(3).ngaus = 2;
    matlabbatch{3}.spm.spatial.preproc.tissue(3).native = [1 0];
    matlabbatch{3}.spm.spatial.preproc.tissue(3).warped = [0 0];
    matlabbatch{3}.spm.spatial.preproc.tissue(4).tpm = {'D:\software\matlab\toolbox\spm12\tpm\TPM.nii,4'};
    matlabbatch{3}.spm.spatial.preproc.tissue(4).ngaus = 3;
    matlabbatch{3}.spm.spatial.preproc.tissue(4).native = [1 0];
    matlabbatch{3}.spm.spatial.preproc.tissue(4).warped = [0 0];
    matlabbatch{3}.spm.spatial.preproc.tissue(5).tpm = {'D:\software\matlab\toolbox\spm12\tpm\TPM.nii,5'};
    matlabbatch{3}.spm.spatial.preproc.tissue(5).ngaus = 4;
    matlabbatch{3}.spm.spatial.preproc.tissue(5).native = [1 0];
    matlabbatch{3}.spm.spatial.preproc.tissue(5).warped = [0 0];
    matlabbatch{3}.spm.spatial.preproc.tissue(6).tpm = {'D:\software\matlab\toolbox\spm12\tpm\TPM.nii,6'};
    matlabbatch{3}.spm.spatial.preproc.tissue(6).ngaus = 2;
    matlabbatch{3}.spm.spatial.preproc.tissue(6).native = [0 0];
    matlabbatch{3}.spm.spatial.preproc.tissue(6).warped = [0 0];
    matlabbatch{3}.spm.spatial.preproc.warp.mrf = 1;
    matlabbatch{3}.spm.spatial.preproc.warp.cleanup = 1;
    matlabbatch{3}.spm.spatial.preproc.warp.reg = [0 0.001 0.5 0.05 0.2];
    matlabbatch{3}.spm.spatial.preproc.warp.affreg = 'mni';
    matlabbatch{3}.spm.spatial.preproc.warp.fwhm = 0;
    matlabbatch{3}.spm.spatial.preproc.warp.samp = 3;
    matlabbatch{3}.spm.spatial.preproc.warp.write = [0 0];
    matlabbatch{3}.spm.spatial.preproc.warp.vox = NaN;
    matlabbatch{3}.spm.spatial.preproc.warp.bb = [NaN NaN NaN
                                                  NaN NaN NaN];
    % coregister
    matlabbatch{4}.spm.spatial.coreg.write.ref = {'D:\software\matlab\toolbox\spm12\tpm\TPM.nii,1'};
    matlabbatch{4}.spm.spatial.coreg.write.source(1) = cfg_dep('Segment: c1 Images', substruct('.','val', '{}',{3}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','tiss', '()',{1}, '.','c', '()',{':'}));
    matlabbatch{4}.spm.spatial.coreg.write.roptions.interp = 4;
    matlabbatch{4}.spm.spatial.coreg.write.roptions.wrap = [0 0 0];
    matlabbatch{4}.spm.spatial.coreg.write.roptions.mask = 0;
    matlabbatch{4}.spm.spatial.coreg.write.roptions.prefix = 'r';
    % delete file
    matlabbatch{5}.cfg_basicio.file_dir.file_ops.file_move.files(1) = cfg_dep('Normalise: Estimate & Write: Deformation (Subj 1)', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('()',{1}, '.','def'));
    matlabbatch{5}.cfg_basicio.file_dir.file_ops.file_move.files(2) = cfg_dep('Normalise: Estimate & Write: Normalised Images (Subj 1)', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('()',{1}, '.','files'));
    matlabbatch{5}.cfg_basicio.file_dir.file_ops.file_move.files(3) = cfg_dep('Segment: Seg Params', substruct('.','val', '{}',{3}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','param', '()',{':'}));
    matlabbatch{5}.cfg_basicio.file_dir.file_ops.file_move.files(4) = cfg_dep('Segment: c1 Images', substruct('.','val', '{}',{3}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','tiss', '()',{1}, '.','c', '()',{':'}));
    matlabbatch{5}.cfg_basicio.file_dir.file_ops.file_move.files(5) = cfg_dep('Segment: c2 Images', substruct('.','val', '{}',{3}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','tiss', '()',{2}, '.','c', '()',{':'}));
    matlabbatch{5}.cfg_basicio.file_dir.file_ops.file_move.files(6) = cfg_dep('Segment: c3 Images', substruct('.','val', '{}',{3}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','tiss', '()',{3}, '.','c', '()',{':'}));
    matlabbatch{5}.cfg_basicio.file_dir.file_ops.file_move.files(7) = cfg_dep('Segment: c4 Images', substruct('.','val', '{}',{3}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','tiss', '()',{4}, '.','c', '()',{':'}));
    matlabbatch{5}.cfg_basicio.file_dir.file_ops.file_move.files(8) = cfg_dep('Segment: c5 Images', substruct('.','val', '{}',{3}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','tiss', '()',{5}, '.','c', '()',{':'}));
    matlabbatch{5}.cfg_basicio.file_dir.file_ops.file_move.action.delete = false;
    % create directory
    matlabbatch{6}.cfg_basicio.file_dir.dir_ops.cfg_mkdir.parent = {rootDir};
    matlabbatch{6}.cfg_basicio.file_dir.dir_ops.cfg_mkdir.name = subDir;
    % move file
    matlabbatch{7}.cfg_basicio.file_dir.file_ops.file_move.files(1) = cfg_dep('Coregister: Reslice: Resliced Images', substruct('.','val', '{}',{4}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','rfiles'));
    matlabbatch{7}.cfg_basicio.file_dir.file_ops.file_move.action.moveto(1) = cfg_dep('Make Directory: Make Directory ''subdir''', substruct('.','val', '{}',{6}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','dir'));
    matlabbatch{7}.cfg_basicio.file_dir.file_ops.file_move.action.moveto(1) = cfg_dep(['Make Directory: Make Directory ' '''' subDir ''''], substruct('.','val', '{}',{6}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','dir'));
end