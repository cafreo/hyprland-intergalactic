#!/usr/bin/env bats

load bats-support/load
load bats-assert/load
load bats-mock/load


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

function default_config() {
   cat > /tmp/config.sh <<EOT
MENU=(home)
d_home=("$BATS_TMPDIR/$BATS_TEST_NAME")
EOT
}

@test 'check rofi status given as second args to chooseexe  ' {
# Catch issue #4

   default_config
   
   rofi="$(mock_create)"
   mock_set_status "${rofi}" 10
   mock_set_output "$rofi" "FILE1"

   chooseexe="$(mock_create)"

   touch a
   _CHOOSEEXE="$chooseexe" _ROFI="$rofi" CONFIG_DIR=/tmp \
      run "$SRC/rofi-file-selector.sh"
   assert_equal "$(mock_get_call_num "$rofi")"  "1"
   assert_equal "$(mock_get_call_num "$chooseexe")"  "1"
   assert_equal "$(mock_get_call_args "$chooseexe")"  "FILE1  10"
}


@test 'mimeapps is given whole path' {

   rofi="$(mock_create)"

   _ROFI="$rofi" run "$SRC/chooseexe.sh" DIR/NAME 10
   echo "$(mock_get_call_args "$rofi")"
   assert_line --partial "DIR/NAME"
}

@test 'mimeapps is given parent dir   ' {
# Catch issue #4
   rofi="$(mock_create)"
   mock_set_output "$rofi" ""

   _ROFI="$rofi" run "$SRC/chooseexe.sh" DIR/NAME 10
   run echo "$(mock_get_call_args "$rofi")"
   assert_line --partial "DIR"
   refute_line --partial "NAME" # No filename
}

