#!/bin/bash -e
package="$1"
package_dir="packages/$package"
package_json_path="bucket/$package.json"
package_json="{}"

# if [ -f "$package_json_path" ]
# then
#   package_json="$(cat "$package_json_path")"
# fi

mkdir -p bucket

json_value() {
  if [ "$1" = '[' ]
  then
    shift 1
    echo -n '['
    delimiter=""
    while [ "$1" != ']' ]
    do
      echo -n "$delimiter"
      delimiter=","
      json_value "$@"
      shift 1
    done
    echo -n ']'
  else
    echo "$(jq --raw-input . <<< "$1")"
    shift 1
  fi
}

extend() {
  package_json="$(
    package="$1"
    package_dir="packages/$package"
    package_json_path="/dev/null"
    # shellcheck source=/dev/null
    source "$package_dir/package.sh"
    echo -n "$package_json"
  )"
}

remove_field() {
  name="$1"
  package_json="$(jq "del(.${name})" <<< "$package_json")"
}

field() {
  field_name="$1"
  shift 1
  field_value="$(json_value "$@")"

  package_json=$(jq ".${field_name}=${field_value}" <<< "$package_json")
}

field_array() {
  lines=()
  while read line
  do
    lines+=("$line")
  done
  field "$1" [ "${lines[@]}" ]
}

alias script=field_array

pre_install() {
  field_array pre_install
}

post_install() {
  field_array post_install
}

# Embeds the given extra file (path relative to package source directory) as
# a base64-encoded string in the resulting manifest.
extra_file() {
  name="$1"
  file="${2:-$1}"
  field "_extra.\"$name\"" "$(base64 -w 0 "${package_dir}/${file}")"
}

# Generates a PowerShell snippet to copy write extra manifest contents to a file.
ps_install_extra_file() {
  src="$1"
  dest="${2:-\$dir\\$src}"
  cat <<EOF
[IO.File]::WriteAllBytes("${dest}", [Convert]::FromBase64String(\$manifest._extra."${src}"))
EOF
}

find_sha256sum() {
  wanted_filename="$1"
  while read hash filename
  do
    if [ "$wanted_filename" = "" ] ||\
      [ "$wanted_filename" = "$filename" ]
    then
      echo -n "$hash"
      break
    fi
  done
}

autofill_download() {
  echo "ERROR: autofill_download is not implemented yet." >&2
  false
}

# shellcheck source=/dev/null
. "$package_dir/package.sh"

cat >"$package_json_path" <<<"$package_json"
