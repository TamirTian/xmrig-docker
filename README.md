# Docker image for [xmrig](https://github.com/xmrig/xmrig)

## Usage
docker run --cpus=0.5 --name xmrig -d 94tamir/xmrig:v2.8.3 --algo cryptonight --url 矿池地址 -u 收款地址.自定义矿工名称 --threads 1 --cpu-priority 1 -k

```
docker run --cpus=0.5 --name xmrig -d 94tamir/xmrig:v2.8.3 --algo cryptonight --url xmr-cn.sparkpool.com:11000 -u 8Ahg4aYFD5k76DtZ4ExuAhZckyvmf7c3YeLgzaxKsCsHetmh4F7YhzsDGpEGa3uVgEiN9i2JJxHat371XV5dQMNFJzDjjwH.custom --threads 1 --cpu-priority 1 -k
```
### Options
```
  -a, --algo=ALGO          specify the algorithm to use
                             cryptonight
                             cryptonight-lite
                             cryptonight-heavy
  -o, --url=URL            URL of mining server
  -O, --userpass=U:P       username:password pair for mining server
  -u, --user=USERNAME      username for mining server
  -p, --pass=PASSWORD      password for mining server
      --rig-id=ID          rig identifier for pool-side statistics (needs pool support)
  -t, --threads=N          number of miner threads
  -v, --av=N               algorithm variation, 0 auto select
  -k, --keepalive          send keepalived packet for prevent timeout (needs pool support)
      --nicehash           enable nicehash.com support
      --tls                enable SSL/TLS support (needs pool support)
      --tls-fingerprint=F  pool TLS certificate fingerprint, if set enable strict certificate pinning
  -r, --retries=N          number of times to retry before switch to backup server (default: 5)
  -R, --retry-pause=N      time to pause between retries (default: 5)
      --cpu-affinity       set process affinity to CPU core(s), mask 0x3 for cores 0 and 1
      --cpu-priority       set process priority (0 idle, 2 normal to 5 highest)
      --no-huge-pages      disable huge pages support
      --no-color           disable colored output
      --variant            algorithm PoW variant
      --donate-level=N     donate level, default 5% (5 minutes in 100 minutes)
      --user-agent         set custom user-agent string for pool
  -B, --background         run the miner in the background
  -c, --config=FILE        load a JSON-format configuration file
  -l, --log-file=FILE      log all output to a file
  -S, --syslog             use system log for output messages
      --max-cpu-usage=N    maximum CPU usage for automatic threads mode (default 75)
      --safe               safe adjust threads and av settings for current CPU
      --asm=ASM            ASM code for cn/2, possible values: auto, none, intel, ryzen.
      --print-time=N       print hashrate report every N seconds
      --api-port=N         port for the miner API
      --api-access-token=T access token for API
      --api-worker-id=ID   custom worker-id for API
      --api-id=ID          custom instance ID for API
      --api-ipv6           enable IPv6 support for API
      --api-no-restricted  enable full remote access (only if API token set)
      --dry-run            test configuration and exit
  -h, --help               display this help and exit
  -V, --version            output version information and exit
```

### Install docker
```
curl -sSL https://get.docker.com/ | sh
```
### Other
#### [下载钱包和生成地址](https://getmonero.org/downloads/)

#### [查看收益](https://xmr.sparkpool.com/)

#### 停止
```
docker stop xmrig
```
#### 查看log
```
docker logs --follow --tail 10 xmrig
```
