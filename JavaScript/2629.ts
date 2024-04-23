type F = (x: number) => number;

function compose(functions: F[]): F {
    return function (x) {
        let ret = x;
        while (functions.length > 0) {
            const f = functions.pop();
            if (f) {
                ret = f(ret);
            }
        }

        return ret;
    };
}

/**
 * const fn = compose([x => x + 1, x => 2 * x])
 * fn(4) // 9
 */
