example name compile="false" debug="false":
    just example{{ if compile != "false" { "-compile" } else { "-run" } }}{{ if debug != "false" { "-debug" } else { "" } }} {{name}}

example-run name:
    cargo run --release -- --file examples/{{name}}.stack

example-compile name:
    cargo run --release -- --file examples/{{name}}.stack --compile > output/{{name}}.c
    clang output/{{name}}.c -o output/{{name}}
    output/{{name}}

example-run-debug name:
    cargo run -- --debug --file examples/{{name}}.stack

example-compile-debug name:
    cargo run -- --debug --file examples/{{name}}.stack --compile > output/{{name}}.c
    clang output/{{name}}.c -o output/{{name}}
    output/{{name}}