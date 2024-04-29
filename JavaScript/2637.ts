type Fn = (...params: any[]) => Promise<any>;

function timeLimit(fn: Fn, t: number): Fn {
    return async function (...args) {
        // 本来実行したい非同期関数の結果のPromise。こちらがtimeoutより早く実行されれば結果が返ってくる
        const originalPromise = fn(...args);

        // timeoutのためだけのPromise。tミリ秒後にtimeoutする
        const timeoutPromise = new Promise((_, reject) => {
            setTimeout(() => reject("Time Limit Exceeded"), t);
        });

        // 本来実行したい非同期関数とtimeoutで競争させ、早かった方を返す
        return Promise.race([originalPromise, timeoutPromise]);
    };
}

const fn = async (n) => {
    await new Promise((res) => setTimeout(res, 100));
    return n * n;
};

// 150ミリ秒後にtimeout
const timeLimitFunc1 = timeLimit(fn, 150);
// 100ミリ秒にfnの結果が来るのでtimeoutにならずに結果が返る
timeLimitFunc1(5).then(console.log).catch(console.error);

// 50ミリ秒後にtimeout
const timeLimitFunc2 = timeLimit(fn, 50);
// 100ミリ秒にfnの結果が来るのでtimeoutにならずに結果が返る
timeLimitFunc2(5).then(console.log).catch(console.error);
