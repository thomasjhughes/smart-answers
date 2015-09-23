# Smart Answers

## Introduction

> Smart answers are a great tool for content designers to present complex information in a quick and simple way. Defining what they are – decision trees? calculators? tools? is immaterial – what they do is provide a reusable technical framework to build a quick and simple answer to a complex question.

Read more in [a blog post](https://gds.blog.gov.uk/2012/02/16/smart-answers-are-smart/).

Have a look at
[`test/unit/flow_test.rb`](test/unit/flow_test.rb) for example usage.

This application supports two styles of writing and executing smart answers:

### Ruby smart answer flows

For more information, please go to the [Ruby SmartAnswer README](doc/smart-answer-flows.md)

### DEPRECATED: Smartdown-based smart answer flows

For more information, please go to the [Smartdown SmartAnswer README](doc/smartdown-flows.md)

## Developing

### Installing and running

NB: this assumes you are running on the GOV.UK virtual machine, not your host.

```bash
  ./install # git fetch from each dependency dir and bundle install
```

Run using bowler on VM from cd /var/govuk/development:
```
bowl smartanswers
```

### Viewing a Smart Answer

To view a smart answer locally if running using bowler http://smartanswers.dev.gov.uk/register-a-birth

### Debugging current state

If you have a URL of a Smart answer and want to debug the state of it i.e. to see PhraseList keys, saved inputs, the outcome name, append `debug=1` query parameter to the URL in development mode. This will render debug information on the Smart answer page.

## Testing

Run all tests by executing the following:

    bundle exec rake

## Table of Contents

* Process
  * [Archiving a Smart Answer](doc/archiving.md)
  * [Deploying changes for Factcheck](doc/factcheck.md)
  * [Merging pull requests from the content team](doc/merging-content-prs.md)
* Development
  * Adding [content-ids](doc/content-ids.md) to Smart Answers.
  * [Issues and Todo](https://github.com/alphagov/smart-answers/issues)
  * [Rubocop](doc/rubocop.md)
  * [Updating worldwide fixture data](doc/updating-worldwide-fixture-data.md)
* Debugging
  * [Viewing landing pages and outcomes as Govspeak](doc/viewing-templates-as-govspeak.md)
  * [Visualising flows](doc/visualising-flows.md)
