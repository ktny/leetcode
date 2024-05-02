type Fn<T> = () => Promise<T>;

async function promiseAll<T>(functions: Fn<T>[]): Promise<T[]> {
    return new Promise((resolve, reject) => {
        let resolvedCount = 0;
        const results: T[] = new Array(functions.length);

        for (let i = 0; i < functions.length; i++) {
            functions[i]()
                .then((v) => {
                    results[i] = v;
                    resolvedCount++;
                    if (resolvedCount === functions.length) {
                        resolve(results);
                    }
                })
                .catch((e) => reject(e));
        }
    });
}

/**
 * const promise = promiseAll([() => new Promise(res => res(42))])
 * promise.then(console.log); // [42]
 */
