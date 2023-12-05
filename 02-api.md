In this section we will create a simple API Gateway that responds to `GET /hello`

## Instructions

1. Create `api.main.w`
  ```ts
  bring cloud;
  bring http;
  bring expect;

  let api = new cloud.Api();

  test "GET hello" {
    let url = api.url;
    let res = http.get("{url}/hello");
    expect.equal(res.status, 200);
    expect.equal(res.body, "React Wing Workshop");
  }
  ```
2. Run it locally
```sh
  wing run api.main.w
```
3. Run the test from the console and examine the output
   <img width="1134" alt="image" src="https://github.com/ekeren/react-wing-workshop/assets/1727147/28a3f485-d589-46f0-a154-a1968bc56949">

5. Can you fix the code? (Hint: [`cloud.Api`docs](https://www.winglang.io/docs/standard-library/cloud/api))

  <details>
    <summary>Solution</summary>
``` 
    api.get("/hello", inflight () => {
      return {
        status:200,
        body:"React Wing Workshop"
      };
    });
```
  </details>

You can now use different options to see that your api gateway is working: 
- Run tests from the Wing Console 
- Run tests using the cli `wing test api.main.w`
- Interactively test the `/hello` endpoint from Wing Console
- Interactively test  the `/hello` endpoint using your browser

## Bonus Testing on `tf-aws`

**Note**: in order to test on `tf-aws` you must have  `terraform` cli installed AWS credentials setup with 
permissions to run `terraform apply`.
  

You can run the same test on your tf-aws infra
```sh
  wing test api.main.w -t tf-aws
```


