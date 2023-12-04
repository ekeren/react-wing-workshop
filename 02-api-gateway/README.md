## Wing it

1. Run the software
```sh
  wing run 02-api-gateway/main.w
```
2. Locate test "GET hello"
3. Run the test, notice the  `404 !== 200` error 
4. **Challenge** - fix the code
   - [`cloud.Api` docs](https://www.winglang.io/docs/standard-library/cloud/api)
   - [Examples/API Gateway](https://www.winglang.io/docs/examples/api-gateway)
5. Run the `"GET hello"` test
   - From the Wing Console 
   - Using `wing test 02-api-gateway/main.w`
6. Test the `/hello` endpoint from Wing Console
7. Test the `/hello` using your browser


## Bonus Testing on `tf-aws`

You can run the same test on your tf-aws infra
```sh
  wing test 02-api-gateway/main.w -t tf-aws
```
