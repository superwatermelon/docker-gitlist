#!/usr/bin/env bats

@test "example" {
  run exit 0
  [ "$status" -eq 0 ]
}
