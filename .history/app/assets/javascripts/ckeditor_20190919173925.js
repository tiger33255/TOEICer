CKEDITOR.on('dialogDefinition', function (ev) {
    var dialogName = ev.data.name;
    var dialogDefinition = ev.data.definition;

    •••

    if (dialogName === 'image') {
        var uploadTab = dialogDefinition.getContents('Upload');
        if (uploadTab) {
            var upload = uploadTab.get('upload');
            if (upload) upload.label = '画像を選択してください';

            var uploadButton = uploadTab.get('uploadButton');
            if (uploadButton) uploadButton.label = 'アップロード';
        }

        var infoTab = dialogDefinition.getContents('info');
        if (infoTab) {
            infoTab.remove('txtAlt');
            infoTab.get('txtUrl')['hidden'] = true;
            infoTab.remove('txtHSpace');
            infoTab.remove('txtVSpace');
            infoTab.remove('txtBorder');
            infoTab.remove('cmbAlign');

            var browse = infoTab.get('browse');
            if (browse) browse.label = 'アップロード済みの画像を選択';
        }

        // remove unnecessary tabs
        if (dialogDefinition.getContents('Link')) dialogDefinition.removeContents('Link');
        if (dialogDefinition.getContents('advanced')) dialogDefinition.removeContents('advanced');
    }