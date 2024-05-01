interface valueWithTTL {
    value: number;
    ttl: ReturnType<typeof setTimeout>;
}

class TimeLimitedCache {
    private cache = new Map<number, valueWithTTL>();

    constructor() {}

    set(key: number, value: number, duration: number): boolean {
        const hasKey = this.cache.has(key);

        if (hasKey) {
            clearTimeout(this.cache.get(key)?.ttl);
        }
        this.cache.set(key, { value, ttl: setTimeout(() => this.cache.delete(key), duration) });
        return hasKey;
    }

    get(key: number): number {
        return this.cache.get(key)?.value ?? -1;
    }

    count(): number {
        return this.cache.size;
    }
}
