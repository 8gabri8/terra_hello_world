version 1.0

workflow hello_world {
  input {
    String name
  }
  call say_hello { input: name = name }
  output {
    String message = say_hello.message
  }
}

task say_hello {
  input {
    String name
  }
  command {
    echo "Hello, ${name}!"
  }
  output {
    String message = read_string(stdout())
  }
  runtime {
    container: "alpine:latest"
  }
}
