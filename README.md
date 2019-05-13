# linter-conf

## Objective

Share linter configurations accross projects

## ESlint

Add as npm depency to your project:

```json
{ "linter-conf": "git+ssh://git@bitbucket.org/dispojob/linter-conf.git#master" }
```

Then add a `.eslintrc` with extension to one or more configurations:

```json
{
    "extends": [
        "./node_modules/linter-conf/.eslintrc",
        "./node_modules/linter-conf/.eslintrc-es6-features"
    ],
    "env": {
      "browser": true
    },
    "globals": {
    },
    "rules": {
    }
}
```

## Lint-branch

You can use the lint-branch script to check if your branch dev is correctly linted: `node_modules/linter-conf/bin/lint-branch.sh`

To install a pre-push hook to automatically reject your push if it does not meet the standards:

```bash
# from the project directory
ln -s $PWD/node_modules/linter-conf/bin/lint-branch.sh .git/hooks/pre-push
```
