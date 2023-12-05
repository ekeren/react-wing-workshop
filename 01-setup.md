In this section we will make sure Wing is installed and working locally on your 
machine.

## Prerequisites

* [Node.js](https://nodejs.org/en/) (>= 18.13.0)
* [VSCode](https://code.visualstudio.com/download)
* [Docker](https://www.docker.com/) or [OrbStack](https://orbstack.dev/) installed

## Wing Toolchain

The Wing Toolchain is distributed via [npm](https://www.npmjs.com/):

```sh
npm install -g winglang
```

Verify your installation:

```sh
wing --version
```

## Wing VSCode Extension

The Wing VSCode Extension adds syntax highlighting and other conveniences for the Wing Programming Language in [VSCode].

To install the Wing VSCode extension, [download](https://marketplace.visualstudio.com/items?itemName=Monada.vscode-wing) it from the VSCode Marketplace. It is distributed via the VSCode Marketplace.

[VSCode]: https://code.visualstudio.com/

## Wing it

1. Create a new directory on your filesystem (e.g. `/tmp/wing-workshop`)
2. Start vscode from this directory
3. Create a `backend` directory
4. Create `backend/main.w` with the following content:
```ts
bring cloud;

let queue = new cloud.Queue(timeout: 2m);
let bucket = new cloud.Bucket();
let counter = new cloud.Counter();

queue.setConsumer(inflight (body: str): str => {
  let next = counter.inc();
  let key = "key-{next}";
  bucket.put(key, body);
});
```

Verify that Wing toolchain is working as expected
  ```sh
  wing run backend/main.w
  ```

## Challenge

Replace `cloud.Bucket` with `ex.Redis` as our key value storage.

1. Make sure you have docker running by doing: (you might need to start the docker daemon on your machine)
```
docker ps
```
2. Go to Redis [docs](https://www.winglang.io/docs/standard-library/ex/redis) to find how to use `Redis` in Winglang
3. Create the Redis instance instead of the `cloud.Bucket` one
4. Use `set` inflight method instead of `cloud.Bucket`'s `put` method

<details>
  <summary>Solution</summary>

        bring cloud;
        bring ex;
        
        let queue = new cloud.Queue(timeout: 2m);
        let redis = new ex.Redis();
        let counter = new cloud.Counter();
        
        queue.setConsumer(inflight (body: str): str => {
          let next = counter.inc();
          let key = "key-{next}";
          redis.set(key, body);
        });    

</details>

In Wing Console, you can click on the Redis resource and interact with the REPL (right hand side) 
