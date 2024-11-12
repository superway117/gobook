zgrab2

Fast Go Application Scanner


## Usage

````
$ go run cmd/zgrab2/main.go --help
Usage:
  C:\Users\super\AppData\Local\Temp\go-build2325384754\b001\exe\main.exe [OPTIONS] <command>

Application Options:
  /o, /output-file:           Output filename, use - for stdout (default: -)
  /f, /input-file:            Input filename, use - for stdin (default: -)
  /m, /metadata-file:         Metadata filename, use - for stderr (default: -)
  /l, /log-file:              Log filename, use - for stderr (default: -)
  /s, /senders:               Number of send goroutines to use (default: 1000)
      /debug                  Include debug fields in the output.
      /flush                  Flush after each line of output.
      /gomaxprocs:            Set GOMAXPROCS (default: 0)
      /connections-per-host:  Number of times to connect to each host (results
                              in more output) (default: 1)
      /read-limit-per-host:   Maximum total kilobytes to read for a single host
                              (default 96kb) (default: 96)
      /prometheus:            Address to use for Prometheus server (e.g.
                              localhost:8080). If empty, Prometheus is disabled.
      /dns:                   Address of a custom DNS server for lookups.
                              Default port is 53.

Help Options:
  /?                          Show this help message
  /h, /help                   Show this help message

Available commands:
  amqp091   amqp091
  bacnet    bacnet
  banner    Banner
  dnp3      dnp3
  fox       fox
  ftp       FTP
  http      HTTP Banner Grab
  imap      imap
  ipp       ipp
  jarm      jarm
  modbus    modbus
  mongodb   mongodb
  mssql     MSSQL
  multiple  Multiple module actions
  mysql     MySQL
  ntp       NTP
  oracle    oracle
  pop3      pop3
  postgres  Postgres
  redis     redis
  siemens   siemens
  smb       smb
  smtp      smtp
  ssh       SSH Banner Grab
  telnet    telnet
  tls       TLS Banner Grab
```


## References

- [github zgrab2](https://github.com/zmap/zgrab2)