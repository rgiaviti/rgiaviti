Docker

```bash
$ docker rmi $(docker images -f "dangling=true" -q)
```

Podman

```bash
$ podman rmi $(podman images -f "dangling=true" -q)
```
