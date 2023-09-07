#!/usr/bin/env bats

load bats-support/load
load bats-assert/load


function setup() {
   mkdir -p "${BATS_TMPDIR:?/tmp}/$BATS_TEST_NAME"
   cd "$BATS_TMPDIR/$BATS_TEST_NAME" || \
      fail "unable to cd in $BATS_TMPDIR/BTNBATS_TEST_NAME"
   export CACHEDIR="/tmp/$BATS_TEST_NAME.cache"
}
function teardown() {
   [[ -d $CACHEDIR ]] && rm -rf "$CACHEDIR"
   [[ -d "${BATS_TMPDIR:?/tmp}/$BATS_TEST_NAME" ]] && \
      rm -rf "${BATS_TMPDIR:?/tmp}/$BATS_TEST_NAME"
}


SRC="$BATS_TEST_DIRNAME/.."

@test 'fd_cache first run is ok' {
  touch a ;touch  b ; touch c
  run "$SRC/fd_cache.sh" '.'  .
  #run ls .
  assert_success
  assert_output - <<-EOT
c
b
a
EOT
}

@test 'fd_cache order is updated' {
  touch a ;touch  b ; touch c
  run "$SRC/fd_cache.sh" '.'  .  
  sleep 1
  touch a
  run "$SRC/fd_cache.sh" '.'  . 
  assert_success
  assert_output - <<-EOT
c
b
a
a
c
b
EOT
}

@test 'fd_cache new file taken into account' {
  touch a ;touch  b ; touch c
  run "$SRC/fd_cache.sh" '.'  .  
  sleep 1
  touch x
  run "$SRC/fd_cache.sh" '.'  . 
  assert_success
  assert_output - <<-EOT
c
b
a
x
c
b
a
EOT
}
