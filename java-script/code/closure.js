function f(x) {
    let sum = x;
    let s = function (y) {
        sum = sum + y;
        return s;
    };

    s.toString = function () {
        return sum;
    };
    return s;
}

console.log(f(1)(2)(3)(4).toString())
