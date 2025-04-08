# Setup a simple trash system
trash_root="$HOME/.trash"
mkdir -p "$trash_root"

move_to_trash () {
  mv "$@" "$trash_root"
}
