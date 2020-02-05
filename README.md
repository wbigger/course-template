# Book Template 

Hi all! 

This is my course template to create learning material in a uniform way. 

This template uses [mdBook](https://github.com/rust-lang/mdBook), that is a wonderful tool built by the Rust community, free to use a with a lot of great features.

Please feel free to use or modify this template! Happy teaching!

## How to use
### Prerequisite
You have to have installed the following tools on your computer:
- [mdBook](https://github.com/rust-lang/mdBook)
- [node](https://nodejs.org/it/download/)

### Getting started
- Fork this repository or select "Use as template" if you prefer.
- Clone your new repository
- In the "Settings" tab of GitHub, under the "GitHub Pages" section, select as source `master branch /docs folder`
- You can verifiy that the template is online waiting some seconds and clicking on the link that shortly appears on GitHub
- Edit your book according to the official [User Guide](https://rust-lang.github.io/mdBook/)

### Publish course changes
When you want to publish your changes, open a terminal on the root of the repository and write:
```sh
./book.js
git add .
git commit -m"your commit message"
git push
```

OK, now wait some seconds and your course will be updated on GitHub Pages!



