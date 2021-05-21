# spm_batch_preprocess

SPM进行数据预处理的脚本文件

使用SPM对sMRI数据进行预处理，经过了normalize，segment，coregister三个步骤，同时删除了过程文件，对文件位置进行了调整。大部分代码由SPM生成，仅写了少量代码对文件输入进行处理，matlab简直是天坑。

Normalize中Image to Align和Image to Write都直接使用了源图像，这里不太清楚为什么，但看起来效果不错。若Image to Align使用了MNI.nii结果不好看！！

Segment 直接按照MNI进行分割，只使用c1即灰质的部分；

Coregister 将灰质图与MNI图进行配准，使得图像大小一致，方便后续进行ROI提取。

筛选的文件名由python程序筛选获得，导入到matlab中调用，主要是python处理文件时os.walk确实好用，matlab没找到类似的函数。

注意区分matlab中的字符串数组与字符数组，即单引号和双引号的区别，遇到的bug大多是由此引起的。

处理流程可能不太恰当，以后更改处理流程时在此流程上改也比较容易了。先插个眼-。-
