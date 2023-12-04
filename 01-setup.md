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


Create `hello.main.w` with the following:
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
  wing run hello.main.w
  ```

## Challenge

Verify that docker is installed correctly by replacing `cloud.Bucket` with [`ex.Redis`](https://www.winglang.io/docs/standard-library/ex/redis) 

## A Bigger Challenge :thinking:

Can you build an abstraction on top of them?
