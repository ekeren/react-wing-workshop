bring cloud;

let queue = new cloud.Queue(timeout: 2m);
let bucket = new cloud.Bucket();
let counter = new cloud.Counter();

queue.setConsumer(inflight (body: str): str => {
  let next = counter.inc();
  let key = "key-{next}";
  bucket.put(key, body);
});