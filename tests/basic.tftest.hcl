variables {
  input = "test"
}

run "input_and_output_match" {

  assert {
    condition     = output.output == "test"
    error_message = "The output does not match the input."
  }
}
