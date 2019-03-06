#!/usr/bin/env bash

function is_empty() {
  local -r var="$1"
  [ -z "$var" ]
}

function is_not_empty() {
  local -r var="$1"
  [ -n "$var" ]
}

function is_file() {
  local -r file="$1"
  [ -f "$file" ]
}

function is_not_file() {
  local -r file="$1"
  [ ! -f "$file" ]
}

function is_dir() {
  local -r dir="$1"
  [ -d "$dir" ]
}

function is_not_dir() {
  local -r dir="$1"
  [ ! -d "$dir" ]
}

function is_number() {
  local -r value="$1"
  [[ "$value" =~ ^[0-9]+$ ]]
}

function is_not_number() {
  local -r value="$1"
  [[ ! "$value" =~ ^[0-9]+$ ]]
}

function contains() {
  local -r list="$1"
  local -r item="$2"
  [[ $list =~ (^|[[:space:]])"$item"($|[[:space:]]) ]]
}
