CKEDITOR.editorConfig = function(config) {
    config.language = 'ja';
    config.filebrowserBrowseUrl = "/ckeditor/attachment_files";
    config.filebrowserImageBrowseLinkUrl = "/ckeditor/pictures";
    config.filebrowserImageBrowseUrl = "/ckeditor/pictures";
    config.filebrowserImageUploadUrl = "/ckeditor/pictures";
    config.filebrowserUploadUrl = "/ckeditor/attachment_files";
    config.allowedContent = true;
    extraPlugins: [ 'image2', 'uploadfile', ],
  }