

- [Microsoft IntelliTest](https://docs.microsoft.com/en-us/visualstudio/test/intellitest-manual/getting-started?view=vs-2019) — Generate a candidate suite of tests for your .NET code.
  

- [Pex and Moles](https://www.microsoft.com/en-us/research/project/pex-and-moles-isolation-and-white-box-unit-testing-for-net/) — Pex automatically generates test suites with high code coverage using automated white box analysis.
  

<h2 id="c">C</h2>



- [CHAP](https://github.com/vmware/chap) — Analyzes un-instrumented ELF core files for leaks, memory growth, and corruption. It helps explain memory growth, can identify some forms of corruption, and  supplements a debugger by giving the status of various memory locations.
  

- [KLEE](https://github.com/klee/klee) — Symbolic virtual machine built on top of the LLVM compiler infrastructure.
  

- [LDRA](https://ldra.com) :copyright: — A tool suite including dynamic analysis and test to various standards can ensure test coverage to 100% op-code, branch & decsion coverage.
  

- [LLVM/Clang Sanitizers](https://github.com/google/sanitizers) — <ul> <li><a href="https://github.com/google/sanitizers/wiki/AddressSanitizer">AddressSanitizer</a> - A memory error detector for C/C++</li> <li><a href="https://github.com/google/sanitizers/wiki/MemorySanitizer">MemorySanitizer</a> - A detector of uninitialized memory reads in C/C++ programs.</li> <li><a href="https://github.com/google/sanitizers/wiki/ThreadSanitizerCppManual">ThreadSanitizer</a> - A data race detector for C/C++</li> </ul>
  

- [tis-interpreter](https://github.com/TrustInSoft/tis-interpreter) — An interpreter for finding subtle bugs in programs written in standard C.
  

- [Valgrind](https://valgrind.org/) — An instrumentation framework for building dynamic analysis tools.
  

<h2 id="cpp">C++</h2>



- [CHAP](https://github.com/vmware/chap) — Analyzes un-instrumented ELF core files for leaks, memory growth, and corruption. It helps explain memory growth, can identify some forms of corruption, and  supplements a debugger by giving the status of various memory locations.
  

- [KLEE](https://github.com/klee/klee) — Symbolic virtual machine built on top of the LLVM compiler infrastructure.
  

- [LDRA](https://ldra.com) :copyright: — A tool suite including dynamic analysis and test to various standards can ensure test coverage to 100% op-code, branch & decsion coverage.
  

- [LLVM/Clang Sanitizers](https://github.com/google/sanitizers) — <ul> <li><a href="https://github.com/google/sanitizers/wiki/AddressSanitizer">AddressSanitizer</a> - A memory error detector for C/C++</li> <li><a href="https://github.com/google/sanitizers/wiki/MemorySanitizer">MemorySanitizer</a> - A detector of uninitialized memory reads in C/C++ programs.</li> <li><a href="https://github.com/google/sanitizers/wiki/ThreadSanitizerCppManual">ThreadSanitizer</a> - A data race detector for C/C++</li> </ul>
  

- [tis-interpreter](https://github.com/TrustInSoft/tis-interpreter) — An interpreter for finding subtle bugs in programs written in standard C.
  

- [Valgrind](https://valgrind.org/) — An instrumentation framework for building dynamic analysis tools.
  

<h2 id="go">Go</h2>



- [statsviz](https://github.com/arl/statsviz) — Instant live visualization of your Go application runtime statistics in the browser. It plots heap usage, MSpans/MCaches, Object counts, Goroutines and GC/CPU fraction.
  

<h2 id="java">Java</h2>



- [Java PathFinder](https://github.com/javapathfinder/jpf-core) — An extensible software model checking framework for Java bytecode programs.
  

- [Parasoft Jtest](https://www.parasoft.com/products/jtest) :copyright: — Jtest is an automated Java software testing and static analysis product that is made by Parasoft. The product includes technology for Data-flow analysis Unit test-case generation and execution, static analysis, regression testing, code coverage, and runtime error detection.
  

<h2 id="javascript">JavaScript</h2>



- [Iroh.js](https://github.com/maierfelix/Iroh) — A dynamic code analysis tool for JavaScript. Iroh allows to record your code flow in realtime, intercept runtime informations and manipulate program behaviour on the fly.
  

- [Jalangi2](https://github.com/Samsung/jalangi2) — Jalangi2 is a popular framework for writing dynamic analyses for JavaScript.
  

<h2 id="php">PHP</h2>



- [Enlightn](https://www.laravel-enlightn.com/) — A static and dynamic analysis tool for Laravel applications that provides recommendations to improve the performance, security and code reliability of Laravel apps. Contains 120 automated checks.
  

<h2 id="python">Python</h2>



- [CrossHair](https://github.com/pschanely/CrossHair) — Symbolic execution engine for testing Python contracts.
  

- [DynaPyt](https://github.com/sola-st/DynaPyt) — DynaPyt is a framework for writing dynamic analyses for Python. The analyses can also modify runtime values to alter the execution.
  

- [icontract](https://github.com/Parquery/icontract) — Design-by-contract library supporting behavioral subtyping
There is also a wider tooling around the icontract library such as  a linter (pyicontract-lint) and a plug-in for Sphinx (sphinx-icontract).
  

- [Scalene](https://github.com/emeryberger/scalene) — A high-performance, high-precision CPU and memory profiler for Python
  

- [typo](https://github.com/aldanor/typo) — Runtime Type Checking for Python 3.
  

<h2 id="ruby">Ruby</h2>



- [suture](https://github.com/testdouble/suture) — A Ruby gem that helps you refactor your legacy code  by the result of some old behavior with a new version.
  

<h2 id="rust">Rust</h2>



- [cargo-careful](https://github.com/RalfJung/cargo-careful) — Execute Rust code carefully, with extra checking along the way. It builds the standard library with debug assertions.
Here are some of the checks this enables:
* `get_unchecked` in slices performs bounds checks * `copy`, `copy_nonoverlapping`, and `write_bytes` check that pointers are aligned and non-null and (if applicable) non-overlapping `{NonNull,NonZero*,...}::new_unchecked` check that the value is valid * plenty of internal consistency checks in the collection types * mem::zeroed and the deprecated mem::uninitialized panic if the type does not allow that kind of initialization
  

- [hyperfine](https://github.com/sharkdp/hyperfine) — A command-line benchmarking tool It features statistical analysis across multiple runs, support for arbitrary shell commands, constant feedback about the benchmark progress and current estimates, warmup runs, a simple and expressive syntax, and more.
  

- [loom](https://github.com/tokio-rs/loom) — Concurrency permutation testing tool for Rust.  It runs a test many times, permuting the possible concurrent executions of that test.
  

- [MIRI](https://github.com/rust-lang/miri) — An interpreter for Rust's mid-level intermediate representation, which can detect certain classes of undefined behavior like out-of-bounds memory accesses and use-after-free.
  

- [puffin](https://github.com/EmbarkStudios/puffin) — Instrumentation profiler for Rust.
  

- [rust-san](https://github.com/japaric/rust-san) — How-to sanitize your Rust code with built-in Rust dynamic analyzers
  

- [stuck](https://github.com/jonhoo/stuck) — provides a visualization for quickly identifying common bottlenecks in running, asynchronous, and concurrent applications.
  

<h2 id="sql">SQL</h2>



- [WhiteHat Sentinel Dynamic](https://www.synopsys.com/software-integrity/security-testing/dast.html) :copyright: — Part of the WhiteHat Application Security Platform. Dynamic application security scanner that covers the OWASP Top 10.
  

<h2 id="vbasic">Visual Basic</h2>



- [VB Watch](https://www.aivosto.com/vbwatch.html) :copyright: — Profiler, Protector and Debugger for VB6. Profiler measures performance and test coverage. Protector implements robust error handling. Debugger helps monitor your executables.
  

<h2 id="zig">Zig</h2>



- [poop](https://github.com/andrewrk/poop) — Performance Optimizer Observation Platform This command line tool uses Linux's `perf_event_open` functionality to compare the performance of multiple commands with a colorful terminal user interface. It is similar to `hyperfine`.
  

## Multiple languages



- [allocscope](https://github.com/matt-kimball/allocscope) — allocscope is a tool for tracking down where the most egregiously large allocations are occurring in a C, C++ or Rust codebase. It is particularly intendend to be useful for developers who want to get a handle on excessive allocations and are working in a large codebase with multiple contributors with allocations occuring in many modules or libraries.
  

- [bytehound](https://github.com/koute/bytehound) — A memory profiler for Linux. Can be used to analyze memory leaks, see where exactly the memory is being consumed, identify temporary allocations and investigate excessive memory fragmentation.
  

- [CASR](https://crates.io/crates/casr) — Crash Analysis and Severity Report.
  

- [Code Pulse](http://code-pulse.com/) — Code Pulse is a free real-time code coverage tool for penetration testing activities by OWASP and Code Dx ([GitHub](https://github.com/codedx/codepulse)).
  

- [Sydr](https://sydr-fuzz.github.io/) :copyright: — Continuous Hybrid Fuzzing and Dynamic Analysis for Security Development Lifecycle.
  

## Other



<h2 id="api">API</h2>



- [Smartbear](https://smartbear.com/) :copyright: — Test automation and performance testing platform
  

<h2 id="binary">Binaries</h2>



- [angr](https://github.com/angr/angr) — Platform agnostic binary analysis framework from UCSB.
  

- [BOLT](https://github.com/facebookincubator/BOLT) — Binary Optimization and Layout Tool - A linux command-line utility used for optimizing performance of binaries  with profile guided permutation of linking to improve cache efficiency
  

- [Dr. Memory](https://drmemory.org/) — Dr. Memory is a memory monitoring tool capable of identifying memory-related programming errors ([Github](https://github.com/DynamoRIO/drmemory)).
  

- [DynamoRIO](http://www.dynamorio.org/) — Is a runtime code manipulation system that supports code transformations on any part of a program, while it executes.
  

- [llvm-propeller](https://github.com/google/llvm-propeller) — Profile guided hot/cold function splitting to improve cache efficiency. An alternative to BOLT by Facebook
  

- [Pin Tools](https://software.intel.com/en-us/articles/pin-a-dynamic-binary-instrumentation-tool) — A dynamic binary instrumentation tool and a platform for creating analysis tools.
  

- [TRITON](https://triton.quarkslab.com/) — Dynamic Binary Analysis for x86 binaries.
  

<h2 id="bytecode">Bytecode/IR</h2>



- [souper](https://github.com/google/souper) — optimize LLVM IR with SMT solvers
  


## References
- [dynamic-analysis](https://github.com/analysis-tools-dev/dynamic-analysis)