#!/usr/bin/env node
const fs = require('fs')

const { exec } = require('child_process');

var currentClass = null;
var classList = ["1Ainf"];

if (process.argv.length === 2) {
  if (classList.length === 1) {
    candidateClass = classList[0];
  } else {
    console.log(`Class list: ${classList}`);
    process.exit(1);
  }
}
if (process.argv.length === 3) {
  candidateClass = process.argv[2];
}

if (process.argv.length >= 4) {
  console.log(`Usage: ./book.sh <class-name>`);
  process.exit(1);
}

if (classList.includes(candidateClass)) {
  currentClass = candidateClass;
  console.log(`Using class: ${currentClass}`);
} else {
  console.log(`Class ${candidateClass} doesn't exist`);
  console.log(`Class list: ${classList}`);
  process.exit(1);
}

// Preliminary checks
if (currentClass === null) {
  console.error(`Class not assigned!`);
  process.exit(1);
}

const summaryPath = "SUMMARY.md";
const summarySource = `SUMMARY-${currentClass}.md`;
console.log(summarySource);
if (fs.existsSync(`src/${summarySource}`)) {
  //file exists, nothing to do now
} else {
  console.error(`Fatal error: file src/${summarySource} doesn't exist. Create one.`);
  process.exit(1);
}

const tomlPath = "book.toml";
const tomlSource = `book-${currentClass}.toml`;
if (fs.existsSync(tomlSource)) {
  //file exists, nothing to do now
} else {
  console.error(`Fatal error: file ${tomlSource} doesn't exist. Create one.`)
  process.exit(1);
}

console.log(`# Creating book for class ${currentClass}`);

console.log("# linking SUMMARY.md...");
//console.log('Starting directory: ' + process.cwd());
try {
  process.chdir('src');
  try {
    fs.unlinkSync(summaryPath);
  } catch (err) {
  }
  fs.symlinkSync(summarySource, summaryPath);
  process.chdir('../');
}
catch (err) {
  console.log(err);
  process.exit(1);
}

console.log("# linking book.toml...");
//console.log('Starting directory: ' + process.cwd());
try {
  try {
    fs.unlinkSync(tomlPath);
  } catch (err) {
  }
  fs.symlinkSync(tomlSource, tomlPath);
}
catch (err) {
  console.log(err);
  process.exit(1);
}

// AUTO BUILD
const autobuild = true;
if (autobuild) {
  console.log("# Building book...");
  exec(`./build.sh ${currentClass}`, (err, stdout, stderr) => {
    if (err) {
      console.log(err);
      console.log(stderr);
      // node couldn't execute the command
      return;
    } else {
      console.log(stdout);
    }
  });
} else {
  console.log("Now you can build the book with the following command:");
  console.log(`export MDBOOK_BUILD__BUILD_DIR="book-${currentClass}"; mdbook build`);
}
