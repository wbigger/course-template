#!/bin/bash

if [ $# -eq 1 ] && [ $1 == "test" ]; then
  echo "Running tests..."
  $0 && echo "### Test failed\n" && exit -1
  echo "### Test passed\n"
  $0 ciao && echo "### Test failed\n" && exit -1
  echo "### Test passed\n"
  $0 5Ainf || echo "### Test failed\n" && exit -1
  echo "### Test passed\n"
  $0 5Binf || echo "### Test failed\n" && exit -1
  echo "### Test passed\n"

  echo "##### All tests passed #####"

  exit 0;
fi

CLASS="null"
CLASSES="4Binf"

if [ $# -eq 1 ] && [ $1 == "-l" ]; then
  echo "Available classes: $CLASSES";
  exit 0;
fi

if [ $# -ne 1 ]; then
  echo "Usage:"
  echo " $0 <class-name>|list|test"
  exit -1;
fi

for c in $CLASSES ; do
  if [ $1 == $c ]; then
    CLASS=$1;
  fi
done

# Preliminary checks
if [ $CLASS == "null" ]; then
  echo "Error: class $1 not found. Available classes: $CLASSES"
  exit -1;
fi

if [ -f "src/SUMMARY-$CLASS.md" ]; then
  :
else
  echo "Error: src/SUMMARY-$CLASS.md doesn't exist. Please create it first."
  exit -1;
fi

if [ -f "book-$CLASS.toml" ]; then
  :
else
  echo "Error: book-$CLASS.toml doesn't exist. Please create it first."
  exit -1;
fi

# Creating book
echo "Creating book for class $CLASS";


echo "# linking SUMMARY..."
cd src;
rm -f SUMMARY.md;
ln -s SUMMARY-$CLASS.md SUMMARY.md;
cd ../;

if [ -L "src/SUMMARY.md" ]; then
  echo "src/SUMMARY.md linked!";
else
  echo "Error: src/SUMMARY.md should be a link"
  exit -1;
fi

echo "# linking book.toml..."
rm -f book.toml;
ln -s book-$CLASS.toml book.toml;

if [ -L "book.toml" ]; then
  echo "book.toml linked!";
else
  echo "Error: book.toml should be a link"
  exit -1;
fi

#echo "changing book.toml"
#sed -i.bak s/build-dir\ =\ \"book.*\"/build-dir\ =\ \"book-$CLASS\"/ book.toml

## AUTO BUILD
autobuild=true;
if [ $autobuild = true ]; then
  echo "Building book..."
  export MDBOOK_BUILD__BUILD_DIR="book-$CLASS"
  mdbook build || exit -1;
  echo "Generating zip file..."
  zip -r -X book.zip book-$CLASS > /dev/null || exit -1;
  echo "Copying book to docs..."
  rm -rf ./docs
  cp -r book-$CLASS docs
else
  echo "Now you can build the book with the following command:";
  echo "export MDBOOK_BUILD__BUILD_DIR="book-$CLASS"; mdbook build"
fi
