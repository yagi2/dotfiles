// // // Future versions of Hyper may add additional config options,
// // // which will not automatically be merged into this file.
// // // See https://hyper.is#cfg for all currently supported options.
module.exports = {
    config: {
        hyperSana: {
            opacity: 1,
            overText: true
        },

        summon: {
            hotkey: 'Ctrl+Cmd+I'
        },

        // login shell
        shell: '/usr/local/bin/fish',

        updateChannel: 'stable',

        fontSize: 12,
        fontFamily: "Hack Nerd Font Mono",

        lineHeight: 1.2,
        letterSpacing: 0,

        cursorColor: 'rgba(248,28,229,0.8)',
        cursorAccentColor: '#000',
        cursorShape: 'BLOCK',
        cursorBlink: false,

        foregroundColor: '#fff',
        backgroundColor: '#000',

        selectionColor: 'rgba(248,28,229,0.3)',

        borderColor: '#333',

        padding: '4px 12px 0px 12px',

        colors: {
            black: '#000000',
            red: '#C51E14',
            green: '#1DC121',
            yellow: '#C7C329',
            blue: '#0A2FC4',
            magenta: '#C839C5',
            cyan: '#20C5C6',
            white: '#C7C7C7',
            lightBlack: '#686868',
            lightRed: '#FD6F6B',
            lightGreen: '#67F86F',
            lightYellow: '#FFFA72',
            lightBlue: '#6A76FB',
            lightMagenta: '#FD7CFC',
            lightCyan: '#68FDFE',
            lightWhite: '#FFFFFF',
        },

        shellArgs: ['--login'],

        bell: 'SOUND',

        copyOnSelect: false,
        defaultSSHApp: true,
        quickEdit: false,
        macOptionSelectionMode: 'vertical',
        webGLRenderer: true,
    },

    plugins: [
        "hyper-sana",
        'hyperterm-summon',
        'hyperlinks',
        'hyper-alt-click',
        'gitrocket',
        'space-pull',
    ]
};