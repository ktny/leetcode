type Fn = (n: number, i: number) => any;

function filter(arr: number[], fn: Fn): number[] {
    const ret: number[] = [];
    for (let i = 0; i < arr.length; i++) {
        if (fn(arr[i], i)) {
            ret.push(arr[i]);
        }
    }
    return ret;
}
