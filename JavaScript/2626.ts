type Fn = (accum: number, curr: number) => number;

function reduce(nums: number[], fn: Fn, init: number): number {
    let accum = init;
    for (const num of nums) {
        accum = fn(accum, num);
    }
    return accum;
    // return nums.reduce(fn, init);
}
