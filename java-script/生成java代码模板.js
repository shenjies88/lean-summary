const names = ['security_person','security_number','employees_total']
const types = ['String','String','Integer']
const comments = ['安全负责人','安全负责人手机','职工人数(从业人数)']

const s = (type,name,comment) => `
        /**
        * ${comment}
        */
        private ${type} ${name};
`
for(var i = 0 ; i < names.length ; i++){
    console.log(s(types[i],names[i],comments[i]))
}