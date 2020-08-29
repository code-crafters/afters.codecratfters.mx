#!/usr/bin/env sh

npm run build
cd dist
printf 'afters.codecrafters.mx' > CNAME | tr -d '\n\r'
git init
git add -A
git commit -m 'deploy'
git push -f git@github.com/code-crafters.git master:gh-pages
cd -