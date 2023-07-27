<div>

    <div id="gjs">
        <h1 style="padding: 25px">Hello world!</h1>
    </div>

</div>

<script>
var editor = grapesjs.init({
    container: '#gjs',
    fromElement: true,
    height: '100%',
    showOffsets: 1,
    noticeOnUnload: 0,
    storageManager: false,



    plugins: ['grapesjs-preset-webpage', "gjs-blocks-basic", 'grapesjs-plugin-forms',
        'grapesjs-custom-code', 'grapesjs-component-countdown', 'grapesjs-navbar', 'grapesjs-typed',
        'grapesjs-tooltip', 'grapesjs-tabs'
    ],
    pluginsOpts: {
        'grapesjs-preset-webpage': {},
        "gjs-blocks-basic": {},
        'grapes.js-plugin-forms': {},
        'grapesjs-custom-code': {},
        'grapesjs-component-countdown': {},
        'grapesjs-navbar': {},
        'grapesjs-typed': {},
        'grapesjs-tooltip': {},
        'grapesjs-tabs': {},
    },
});
</script>