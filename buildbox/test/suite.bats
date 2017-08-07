#!/usr/bin/env bats

@test "dist tarball exists" {
  run bash -c "[[ -f "$dist" ]]"
  [ "$status" -eq 0 ]
}

@test "dist tarball is a valid tarball" {
  run tar -C build -xzvf "$dist"
  echo "$output"
  [ "$status" -eq 0 ]
}

@test "sources tarball exists" {
  run bash -c "[[ -f "$sources" ]]"
  [ "$status" -eq 0 ]
}

@test "sources tarball is a valid tarball" {
  run tar -C build -xzvf "$sources"
  echo "$output"
  [ "$status" -eq 0 ]
}
