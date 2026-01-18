# CONFIG_DIR="${0:A:h}"
# CURRENT_FILE="${(%):-%N}"
# CURRENT_FILE="$(basename $CURRENT_FILE)"
#
# for file in $CONFIG_DIR/*.zsh ; do
#     if [[ "$(basename $file)" != "$CURRENT_FILE" ]] ; then
#         source $file
#     fi
# done

CONFIG_DIR="$HOME/.config/zsh"

FILES_TO_SOURCE=("aliases.zsh" "exports.zsh" "functions.zsh")

for file in $FILES_TO_SOURCE; do
  source "$CONFIG_DIR/$file"
done
