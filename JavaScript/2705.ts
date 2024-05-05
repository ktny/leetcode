type JSONValue = null | boolean | number | string | JSONValue[] | { [key: string]: JSONValue };
type Obj = Record<string, JSONValue> | Array<JSONValue>;

function compactObject(obj: Obj): Obj {
    const isArray = Array.isArray(obj);
    const arr = isArray ? [] : {};

    for (const [key, value] of Object.entries(obj)) {
        if (value !== null && typeof value === "object") {
            if (Array.isArray(arr)) {
                arr.push(compactObject(value));
            } else {
                arr[key] = compactObject(value);
            }
        } else if (Boolean(value)) {
            if (Array.isArray(arr)) {
                arr.push(value);
            } else {
                arr[key] = value;
            }
        }
    }

    return arr;
}
