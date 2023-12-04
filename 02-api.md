## Wing it

1. Create api.main.w
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
2. Run the software
```sh
  wing run api.main.w
```
3. From the console Run the test, notice the  `404 !== 200` error 
4. Can you fix the code? check out [`cloud.Api` docs](https://www.winglang.io/docs/standard-library/cloud/api)
5. Verify the `"GET hello"` test is working 
   
You can now use different options to see that your api gateway is working: 
- Run tests from the Wing Console 
- Run tests using the cli `wing test api.main.w`
- Interactively test the `/hello` endpoint from Wing Console
- Interactively test  the `/hello` endpoint using your browser

## Wing it

## Bonus Testing on `tf-aws`

**Note**: in order to test on `tf-aws` you must have  `terraform` cli installed AWS credentials setup with 
permissions to run `terraform apply`.
  

You can run the same test on your tf-aws infra
```sh
  wing test api.main.w -t tf-aws
```


