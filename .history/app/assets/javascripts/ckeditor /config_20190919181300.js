CKEDITOR.editorConfig = function( config ) {
    language: 'ja',
    uiColor: '#EEEEEE',
    height: 400,
    //ツールバーグループのカスタマイズ
    toolbarGroups: [
    { name: 'clipboard', groups: [ 'clipboard', 'undo' ] },
    { name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi', 'paragraph' ] },
    { name: 'links', groups: [ 'links' ] },
    { name: 'insert', groups: [ 'insert' ] },
    '/',
    { name: 'styles', groups: [ 'styles' ] },
    { name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
    { name: 'colors', groups: [ 'colors' ] },
    { name: 'tools', groups: [ 'tools' ] },
    { name: 'others', groups: [ 'others' ] },
    { name: 'about', groups: [ 'about' ] },
    { name: 'document', groups: [ 'mode', 'document', 'doctools' ] }
    ],
    //不要なボタンを削除
    removeButtons: 'Source,Save,NewPage,Print,Templates,' +
    'Find,Replace,SelectAll,Scayt,Cut,Styles,Font,' +
    'Copy,Paste,PasteText,PasteFromWord,BidiLtr,Smiley,' +
    'BidiRtl,Language,Unlink,Anchor,Flash,Outdent,Indent,' +
    'PageBreak,CreateDiv,RemoveFormat,CopyFormatting,' +
    'Superscript,Subscript,Strike,Form,Checkbox,Radio,TextField,' +
    'Textarea,Select,Button,ImageButton,HiddenField,ShowBlocks,About,SpecialChar',
};