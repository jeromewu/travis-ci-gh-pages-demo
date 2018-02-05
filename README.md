Travis CI GitHub Pages Demo
=========================
[![Build Status](https://travis-ci.org/jeromewu/travis-ci-gh-pages-demo.svg?branch=master)](https://travis-ci.org/jeromewu/travis-ci-gh-pages-demo)

![](https://raw.githubusercontent.com/jeromewu/travis-ci-gh-pages-demo/master/assets/logo.png)


Demo repo to compile &amp; deploy gh-pages with travis-ci

GitHub Page available at https://jeromewu.github.io/travis-ci-gh-pages-demo/

### Why Travis CI + GitHub Pages?

[Github Pages](https://pages.github.com/) makes it possible to host your website directly from the GitHub repository, but it is troublesome to build and deploy your website manually and it is possible to make mistakes. So the idea of CI/CD comes in, [Travis CI](https://travis-ci.org/) is a great solution to seamlessly integrate with GitHub and provide powerful features to do the job for you. There are lots of way to integrate them together, and this repo provides almost the easiest way to achieve the goal, after setting up the personal access token, you can even just copy .travis.yml file to your repo and everything is done! Hopefully this will help people who would like to make their life easier :)

### 6 Steps to make it work

1. Use create-react-app to creat the project
1. Create account in Travis CI with your GitHub Account
1. Enable CI for your repository
1. Get [Personal Access Token](https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line/) from GitHub
1. [Define Variable in Repository](https://docs.travis-ci.com/user/environment-variables#Defining-Variables-in-Repository-Settings), the name should be **GITHUB_TOKEN** and value should be token from last step
1. Copy .travis.yml to your repo

### What is included?

- A react app created by create-react-app
- A reference [.travis.yml](https://github.com/jeromewu/travis-ci-gh-pages-demo/blob/master/.travis.yml) with comments

### Reference

- [Travis CI: GitHub Pages Deployment](https://docs.travis-ci.com/user/deployment/pages)
- [Travis CI: Deployment](https://docs.travis-ci.com/user/deployment)
- [Create React App](https://github.com/facebook/create-react-app)
