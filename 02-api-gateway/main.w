bring cloud;
bring http;
bring expect;

let api = new cloud.Api();

api.get("/hello", inflight () => {
  return {
    status: 200,
    body: "React Wing Workshop"
  };
});


test "GET hello" {
  let url = api.url;
  let res = http.get("{url}/hello");
  expect.equal(res.status, 200);
  expect.equal(res.body, "React Wing Workshop");
}