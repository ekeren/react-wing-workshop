In this session we will use the FlatFileSystem module in our API, 
and add the relevant code on the client to interact with REST API provided by `cloud.API`

## Instructions 

1. Override the current client directory by downloading and unzipping
<a id="raw-url" href="https://raw.githubusercontent.com/ekeren/react-wing-workshop/main/assets/client.zip">assets/client.zip</a>

3. Paste the following code into `backend/main.w`:
```ts
bring ex;
bring cloud;
bring "./flat-file-system.w" as f;

let fileStorage = new f.FlatFileSystem();

let website = new ex.ReactApp(
  projectPath: "./../client",
  localPort: 4002
);
  
let api = new cloud.Api(
  cors: true
);

website.addEnvironment("apiUrl", api.url);

api.get("/api/folders", inflight (req) => {
  return {
    status: 200,
    body: Json.stringify(fileStorage.listFolders())
  };
});

api.post("/api/folders", inflight (req) => {
  if let body = req.body {
    let folder = Json.parse(body).get("folder").asStr();
    fileStorage.createFolder(folder);
    return {
      status: 200,
      body: str.fromJson(folder)
    };
  }
  return {
      status: 500,
      body: "missing body"
    };
});

api.get("/api/folders/:folder", inflight (req) => {
  let folder = req.vars.get("folder");
  return {
    status: 200,
    body: Json.stringify(fileStorage.listFiles(folder))
  };
});

api.get("/api/folders/:folder/:file", inflight (req) => {
  let folder = req.vars.get("folder");
  let file = req.vars.get("file");
  return {
    status: 200,
    body: fileStorage.getFile(folder, file)
  };
});

api.put("/api/folders/:folder/:file", inflight (req) => {
  let folder = req.vars.get("folder");
  let file = req.vars.get("file");
  let content = req.body ?? "";
  fileStorage.createFile(folder, file, content); 
  return {
    status: 200,
    body: Json.stringify({filename: file, content: content})
  };
});
```
2. 
