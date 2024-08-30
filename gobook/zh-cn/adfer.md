## QuickStart

This Go library provides a flexible way to handle panics across your application, including in goroutines.
It allows for custom error handling, dumping errors to a file, optionally exiting the program after a panic occurs,
including system information in crash reports, and managing crash reports.

## Features

- Custom error handling
- Panic recovery in goroutines
- Option to dump errors to a JSON file
- Option to exit the program after handling a panic
- Option to include system information in crash reports
- Retrieve last N crash reports
- Wipe crash file on startup or initialization
- Add custom metadata to crash reports
- Easy integration with existing Go applications

## Installation

```bash
go get github.com/leaanthony/adfer
```

## Usage

### Basic Usage

```go
package main

import (
  "github.com/leaanthony/adfer"
)

func main() {
  ph := adfer.New(adfer.Options{
    DumpToFile: true,
    FilePath:   "crash_reports.json",
  })
  defer ph.Recover()

  // Your code here
  panic("Oh no!")
}
```

### Advanced Usage

```go
package main

import (
  "fmt"
  "github.com/leaanthony/adfer"
)

func main() {
  ph := adfer.New(adfer.Options{
    DumpToFile:        true,
    FilePath:          "crash_reports.json",
    ExitOnPanic:       true,
    IncludeSystemInfo: true,
    Metadata:          map[string]string{"version": "1.0.0"},
    WipeFile:          true,
    ErrorHandler:      customErrorHandler,
  })

  // Safe goroutine execution
  ph.SafeGo(func() {
    // Your code here
    panic("Goroutine panic!")
  })

  // Retrieve last 5 crash reports
  reports, err := ph.GetLastNCrashReports(5)
  if err != nil {
    fmt.Printf("Error retrieving crash reports: %v\n", err)
  }

  // Wipe crash file
  err = ph.WipeCrashFile()
  if err != nil {
    fmt.Printf("Error wiping crash file: %v\n", err)
  }
}

func customErrorHandler(err error, stack []byte) {
  fmt.Printf("Custom error handler:\nError: %v\nStack:\n%s\n", err, stack)
}
```

## API

### Types

- `CrashReport`: Represents a single crash report
- `SystemInfo`: Represents system information
- `ErrorHandler`: Function type for custom error handling
- `Options`: Configuration options for panic handling
- `PanicHandler`: Main struct for panic handling

### Functions

- `New(options Options) *PanicHandler`: Creates a new PanicHandler
- `(ph *PanicHandler) Recover()`: Recovers from panics
- `(ph *PanicHandler) SafeGo(f func())`: Executes a function in a goroutine with panic recovery
- `(ph *PanicHandler) GetLastNCrashReports(n int) ([]CrashReport, error)`: Retrieves the last N crash reports
- `(ph *PanicHandler) WipeCrashFile() error`: Clears all crash reports from the log file
 
## References

- [github adfer](https://github.com/leaanthony/adfer)