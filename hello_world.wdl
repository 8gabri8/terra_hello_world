version 1.0

workflow hello_world {
  input {
    String name
  }
  call say_hello { input: name = name }

  output {
    String message = say_hello.message
    File hello_txt = say_hello.hello_txt
  }
}

task say_hello {
  input {
    String name
  }
  command {
    # Write the greeting to a file
    echo "Hello, ${name}!" > hello.txt  
    # Also print to stdout (optional)
    echo "Hello, ${name}!"
  }
  output {
    String message = read_string(stdout())
    File hello_txt = "hello.txt"
  }
  runtime {
    container: "alpine:latest"
  }
}
