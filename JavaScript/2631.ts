declare global {
    interface Array<T> {
        groupBy(fn: (item: T) => string): Record<string, T[]>;
    }
}

Array.prototype.groupBy = function (fn) {
    return this.reduce((grouped, item) => {
        const key = fn(item);

        if (!(key in grouped)) {
            grouped[key] = [];
        }
        grouped[key].push(item);

        return grouped;
    }, {});
};

// /**
//  * [1,2,3].groupBy(String) // {"1":[1],"2":[2],"3":[3]}
//  */
