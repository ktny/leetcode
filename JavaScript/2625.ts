type MultiDimensionalArray = (number | MultiDimensionalArray)[];

var flat = function (arr: MultiDimensionalArray, n: number): MultiDimensionalArray {
    if (n == 0) {
        return arr;
    }

    const result: MultiDimensionalArray = [];

    arr.forEach((item) => {
        if (Array.isArray(item)) {
            result.push(...flat(item, n - 1));
        } else {
            result.push(item);
        }
    });

    return result;
};
