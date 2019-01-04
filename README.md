# DemoApp

This is a very simple Rails webserver app that has environment-controlled
configurations for various integrations like New Relic, Datadog, etc (see
below)  It can be used for testing deployments, build processes, etc.

Fork this repo to your own organization so you can test/demo webhooks and
change detection software.  If you have Jenkins enabled, you'll want to edit
the `Jenkinsfile` so that it points to your Docker registry (rather than
Armory's)

### Notes:

This is a Ruby app because NewRelic is most compatible with Ruby, and it's
Rails because that's the easiest to get going as a service.  I recommend
installing [http://rvm.io](rvm) to easily install and manage ruby versions;
the `.ruby_version` file will indicate which version will be needed and rvm
will automagically pick this version when you change into the directory.

## Configuring For "Bad Behavior":

Out of the box, the app should run a fairly well-behaved web service.
If you configure the environment variable `BAD_BEHAVIOR` to "yes", the
system will start to introduce, well, "bad behaviors":

  * All requests will be slowed down by 250-750ms (random delay)
  * Random requests (approx 10%) will generate unhandled exceptions (500 Server Error response)

## Configuring With New Relic:

This app includes the NewRelic client (APM) and is set up to include a custom
attribute "version" pulled from the environment variable "version"; the intent
is for this to be populated by Spinnaker during the canary deploy and found
via downward API.

To Enable New Relic, set the environment variable `NR_LICENSE` to your New
Relic Insights license key.  You can also set `NR_APP_NAME` to a reasonable
name for your application (it will default to "My Application", and in
development mode, will append " (Development)" to the name.

These environment variables will be passed back to NewRelic, and can be used for canary and other analysis.
* `version`: for example `v37` or `1.2.0`
* `run_number`: for example, `manual` or `build38` or `1546611869826` or `01D0CM0J422S80BD2BDEYAYH61`
* `instance_type`: for example, `canary` or `baseline`

## Configuring With Datadog:

TBD



