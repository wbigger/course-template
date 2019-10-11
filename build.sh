CLASS=$1
echo "Building book-$CLASS...";
export MDBOOK_BUILD__BUILD_DIR="book-$CLASS"
mdbook build || exit -1;
echo "Generating zip file...";
zip -r -X book.zip book-$CLASS > /dev/null || exit -1;
echo "Copying book to docs...";
rm -rf ./docs
cp -r book-$CLASS docs
