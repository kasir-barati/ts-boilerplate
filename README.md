# node-typescript-boilerplate

[![Sponsor][sponsor-badge]][sponsor]
[![TypeScript version][ts-badge]][typescript-4-5]
[![Node.js version][nodejs-badge]][nodejs]
[![APLv2][license-badge]][license]
[![Build Status - GitHub Actions][gha-badge]][gha-ci]

👩🏻‍💻 Developer Ready: A comprehensive template. Works out of the box for most [Node.js][nodejs] projects.

🏃🏽 Instant Value: All basic tools included and configured:

-   [TypeScript][typescript] [4.5][typescript-4-5]
-   [ESLint][eslint] with some initial rules recommendation
-   [Jest][jest] for fast unit testing and code coverage
-   Type definitions for Node.js and Jest
-   [Prettier][prettier] to enforce consistent code style
-   NPM [scripts](#available-scripts) for common operations
-   Simple example of TypeScript code and unit test
-   .editorconfig for consistent file format
-   Example configuration for [GitHub Actions][gh-actions]
-   `pre-commit` and `pre-push` [husky][husky] hooks


## Getting Started

This project is intended to be used with the latest Active LTS release of [Node.js][nodejs].

1. **First step** is to clone/use this repo as your project template/download it as zip file

    ### Use as a repository template

    To start, just click the **[Use template][repo-template-action]** link (or the green button). Start adding your code in the `src` and unit tests in the `__tests__` directories.

    ### Clone repository

    To clone the repository, use the following commands:

    ```sh
    git clone https://github.com/kasir-barati/node-typescript-boilerplate
    cd node-typescript-boilerplate
    npm install
    ```

    ### Download latest release

    Download and unzip the current **main** branch or one of the tags:

    ```sh
    wget https://github.com/kasir-barati/node-typescript-boilerplate/archive/main.zip -O node-typescript-boilerplate.zip
    unzip node-typescript-boilerplate.zip && rm node-typescript-boilerplate.zip
    ```

2. Insert/Update the .env. Obviously you have to have `.env` file first. So please do this: `cp .env.example .env`
3. Now Everything is as simple as running one command: `npm run docker-up:build` to build and create docker containers. All the dependencies and devDependencies will be installed in the created image. <span style="color: red">Note</span>: use this command if you had a change in you `package.json`, Things like adding new 3rd party package or removing a package

## Available Scripts

-   `clean` - remove coverage data, Jest cache and transpiled files (dist directory),
-   `prebuild` - lint source files and tests before building,
-   `build` - transpile TypeScript to ES6,
-   `build:watch` - interactive watch mode to automatically transpile source files,
-   `lint` - lint source files and tests,
-   `test:cov` - Run coverage tests,
-   `test:e2e` - Run E2E tests.
-   `test:watch` - interactive watch mode to automatically re-run tests
-   `format` - prettier your codes
-   `prepare` - activate the husky
-   `start` - Start application in production mode
-   `start:dev` - Start application in development mode
-   `watch` - Run tsc to compile project in development mode
-   `docker-up` - Run the application in development mode in Docker without re-building image.
-   `docker-up:build` - Run the Application in development but rebuild the image.
-   `docker-down` - Stop containers and remove the orphans too.

## Additional Information

### Why I do not use [Volta][volta] or any other similar tool in this project boilerplate

Thanks to Docker we do not need to take care about anything. So actually we have to run our project in docker containers and now I cure our patient from the root. :star_struck:
Instructions to run the application with `docker` commands although my suggestion is using `npm run docker-up:build`:

-   `docker-compose up --build` build and create containers for the production environment
-   `docker-compose -f dev.docker-compose.yml up --build` build image and create the containers. Per change in `Dockerfile` please rerun this command
-   `docker-compose -f dev.docker-compose.yml down --remove-orphans` stop and remove the containers.

### Writing tests in JavaScript

Writing unit tests in TypeScript can sometimes be troublesome and confusing. Especially when mocking dependencies and using spies.

This is **optional**, but if you want to learn how to write JavaScript tests for TypeScript modules, read the [corresponding wiki page][jest-wiki].

## Backers & Sponsors

Support this project by becoming a [sponsor][sponsor].

## License

Licensed under the APLv2. See the [LICENSE](https://github.com/kasir-barati/node-typescript-boilerplate/blob/main/LICENSE) file for details.

[ts-badge]: https://img.shields.io/badge/TypeScript-4.5-blue.svg
[nodejs-badge]: https://img.shields.io/badge/Node.js->=%2016.13-blue.svg
[nodejs]: https://nodejs.org/dist/latest-v14.x/docs/api/
[gha-badge]: https://github.com/kasir-barati/node-typescript-boilerplate/actions/workflows/nodejs.yml/badge.svg
[gha-ci]: https://github.com/kasir-barati/node-typescript-boilerplate/actions/workflows/nodejs.yml
[typescript]: https://www.typescriptlang.org/
[typescript-4-5]: https://www.typescriptlang.org/docs/handbook/release-notes/typescript-4-5.html
[license-badge]: https://img.shields.io/badge/license-APLv2-blue.svg
[license]: https://github.com/kasir-barati/node-typescript-boilerplate/blob/main/LICENSE
[sponsor-badge]: https://img.shields.io/badge/♥-Sponsor-fc0fb5.svg
[sponsor]: https://github.com/sponsors/kasir-barati
[jest]: https://facebook.github.io/jest/
[eslint]: https://github.com/eslint/eslint
[jest-wiki]: https://jestjs.io/docs/getting-started
[prettier]: https://prettier.io
[gh-actions]: https://github.com/features/actions
[repo-template-action]: https://github.com/kasir-barati/node-typescript-boilerplate/generate
[husky]: https://www.npmjs.com/package/husky
