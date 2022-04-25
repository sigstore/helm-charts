<!--
Thank you for your contribution! Complete the following fields to provide insight into the changes being requested as well as steps that you can take to ensure it meets all of the requirements

Please remember to:
- mention any issue(s) that this PR closes using a closing keyword as well as the issue number, such as "Closes #XYZ" or "Resolves sigstore/repo-name#XYZ", cf.
  [documentation](https://docs.github.com/en/github/managing-your-work-on-github/linking-a-pull-request-to-an-issue#linking-a-pull-request-to-an-issue-using-a-keyword)
- ensure your commits are signed-off, as sigstore uses the [DCO](https://en.wikipedia.org/wiki/Developer_Certificate_of_Origin) using `git commit -s`, or `git commit -s --amend` if you want to amend already existing commits
- lastly, ensure there are no merge commits!

 -->

 **Description of the change**

<!-- Describe the change being requested. -->

 **Existing or Associated Issue(s)**

<!-- List any related issues. -->

 **Additional Information**

 <!-- Provide as much information that you feel would be helpful for those reviewing the proposed changes. -->

**Checklist**

- [ ] Chart version bumped in `Chart.yaml` according to [semver](http://semver.org/). Where applicable, update and bump the versions in any associated umbrella chart
- [ ] Variables are documented in the `values.yaml` and added to the README.md. THe [helm-docs](https://github.com/norwoodj/helm-docs) utility can be used to generate the necessary content. Use `helm-doc --dry-run` to preview the content
- [ ] JSON Schema generated
- [ ] List tests pass for Chart using the [Chart Testing](https://github.com/helm/chart-testing) tool and the `ct lint` command
