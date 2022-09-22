setup() {
  DIR="$(cd "$(dirname "$BATS_TEST_FILENAME")" >/dev/null 2>&1 && pwd)"
  PATH="$DIR/../scripts:$PATH"

  load "$DIR/test_helper/bats-support/load"
  load "$DIR/test_helper/bats-assert/load"
}

@test "this is a test" {
  run addition.sh 5 5
  assert_output 10
}

@test "this is a test" {
  run addition.sh
  assert_output "missing arg throw an error"
}

@test "this is a test" {
  run addition.sh 3
  assert_output 3
}