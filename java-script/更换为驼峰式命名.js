const fs = require('fs')

const filename = 'enterprise-service/security/occupation.md'

const file = fs.readFileSync(filename)
const s = file.toString()

function camelCase(string) {
    return string.replace(/_([a-z])/g, (all,letter) => letter.toUpperCase())
  }

  fs.renameSync(filename, filename + '_')

  fs.writeFile(filename,camelCase(s),function(err, written, buffer) {})

  console.log(s);
  