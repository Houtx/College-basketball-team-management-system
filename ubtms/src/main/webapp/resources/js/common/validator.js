var myValidator={
    picValidator:function(myFile) {
        var fileNameStr= myFile.name.split('.');
        var extendName =  fileNameStr[fileNameStr.length-1];
        extendName = extendName.toUpperCase();
        if(extendName!='JPG'&& extendName!='PNG'){
            $('#file-error').parent().addClass('has-error');
            $('#file-error').html("请上传jpg、png图片");
            $('#file-error').css('visibility','visible');
            return false;
        }

        if(myFile.size > 1024*1024) {
            $('#file-error').parent().addClass('has-error');
            $('#file-error').html("请选择不大于1MB的图片");
            $('#file-error').css('visibility','visible');
            return false;
        }
        $('#file-error').css('visibility','hidden');
        return true;
    },


}