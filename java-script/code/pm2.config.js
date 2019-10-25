module.exports = {
    apps: [
        {
            name: '${应用名}',
            script: 'java',
            args: [
                '-jar',
                '${jar包路径}'
            ],
            cwd: '.',
            interpreter: ''
        }
    ]
}
