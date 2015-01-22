DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# remove things from the github repo for clean slate and reduce package size for Roku 1 compatibility
rm -rf "$DIR/screenshots"
rm "$DIR/README.md"
find "$DIR" -name "*.DS_Store" -type f -delete
rm "$DIR/dist/zype-roku.zip"
rm "$DIR/dist/zype.zip"
rm -rf "$DIR/.git"
rm "$DIR/.gitignore"

# Remove clean_up
rm "$DIR/clean_up.sh"
