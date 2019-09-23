CKEDITOR.editorConfig = function(config) {
    config.language = 'ja';
    config.filebrowserBrowseUrl = "/ckeditor/attachment_files";
    config.filebrowserImageBrowseLinkUrl = "/ckeditor/pictures";
    config.filebrowserImageBrowseUrl = "/ckeditor/pictures";
    config.filebrowserImageUploadUrl = "/ckeditor/pictures";
    config.filebrowserUploadUrl = "/ckeditor/attachment_files";
    config.allowedContent = true;
    config.height = '400px';
  }

CKEDITOR.on('dialogDefinition', function (ev) {
    var dialogName = ev.data.name;
    var dialogDefinition = ev.data.definition;

    if (dialogName === 'link') {
        var infoTab = dialogDefinition.getContents('info');
        if (infoTab) {
            var urlField = infoTab.get('url');
            urlField['default'] = 'www.example.com';
        }

        if (dialogDefinition.getContents('advanced')) dialogDefinition.removeContents('advanced');
    }
}