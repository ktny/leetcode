type JSONValue = null | boolean | number | string | JSONValue[] | { [key: string]: JSONValue };
type ArrayType = { id: number } & Record<string, JSONValue>;

function join(arr1: ArrayType[], arr2: ArrayType[]): ArrayType[] {
    const arr1Object: Record<number, ArrayType> = arr1.reduce((acc, item) => {
        acc[item.id] = item;
        return acc;
    }, {});

    const merged: Record<number, ArrayType> = arr2.reduce((acc, item) => {
        acc[item.id] = item.id in acc ? Object.assign(acc[item.id], item) : item;
        return acc;
    }, arr1Object);

    return Object.values(merged);
}
