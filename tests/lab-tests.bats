setup() {
  DIR="$(cd "$(dirname "$BATS_TEST_FILENAME")" >/dev/null 2>&1 && pwd)"
  PATH="$DIR/../scripts:$PATH"

  load "$DIR/test_helper/bats-support/load"
  load "$DIR/test_helper/bats-assert/load"
}

@test "addition" {
  run addition.sh 5 5
  assert_output 10
}

@test "missing arf" {
  run addition.sh 5
  assert_output "missing arg throw an error"
}

@test "failure" {
  run addition.sh 3
  assert_failure 3
}