# nais/deploy action

## Usage

See the [NAIS documentation](https://doc.nais.io/build/how-to/build-and-deploy).

## Configuration options

The available configuration options for the NAIS deploy GitHub action.

| Environment variable | Default                  | Description                                                                                                                                                                                                                 |
|:---------------------|:-------------------------|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| CLUSTER              | \(required\)             | Which NAIS cluster to deploy into.                                                                                                                                                                                          |
| DRY\_RUN             | `false`                  | If `true`, run templating and validate input, but do not actually make any requests.                                                                                                                                        |
| ENVIRONMENT          | \(auto-detect\)          | The environment to be shown in GitHub Deployments. Defaults to `CLUSTER:NAMESPACE` for the resource to be deployed if not specified, otherwise falls back to `CLUSTER` if multiple namespaces exist in the given resources. |
| OWNER                | \(auto-detect\)          | Owner of the repository making the request.                                                                                                                                                                                 |
| PRINT\_PAYLOAD       | `false`                  | If `true`, print templated resources to standard output.                                                                                                                                                                    |
| QUIET                | `false`                  | If `true`, suppress all informational messages.                                                                                                                                                                             |
| NAIS_DEPLOY_SUMMARY  | `true`                   | If `false`, skips outputting the job summary to $GITHUB_STEP_SUMMARY                                                                                                                                                        |
| REPOSITORY           | \(auto-detect\)          | Name of the repository making the request.                                                                                                                                                                                  |
| RESOURCE             | \(required\)             | Comma-separated list of files containing Kubernetes resources. Must be JSON or YAML format.                                                                                                                                 |
| RETRY                | `true`                   | Automatically retry deploying if deploy service is unavailable.                                                                                                                                                             |
| TEAM                 | \(auto-detect\)          | Team making the deployment.                                                                                                                                                                                                 |
| TELEMETRY            |                          | Lets nais/docker-build-push send telemetry that is used to calculate more precise lead time for deploy.                                                                                                                     |
| TIMEOUT              | `10m`                    | Time to wait for deployment completion, especially when using `WAIT`.                                                                                                                                                       |
| VAR                  |                          | Comma-separated list of template variables in the form `key=value`. Will overwrite any identical template variable in the `VARS` file.                                                                                      |
| VARS                 | `/dev/null`              | File containing template variables. Will be interpolated with the `$RESOURCE` file. Must be JSON or YAML format.                                                                                                            |
| WAIT                 | `true`                   | Block until deployment has completed with either `success`, `failure` or `error` state.                                                                                                                                     |
| WORKLOAD_IMAGE       |                          | Use this image in a companion Image resource.                                                                                                                                                                               | 
| WORKLOAD_NAME        | \(auto-detect\)          | Name of workload.                                                                                                                                                                                                           | 


Note that `OWNER` and `REPOSITORY` corresponds to the two parts of a full repository identifier.
If that name is `navikt/myapplication`, those two variables should be set to `navikt` and `myapplication`, respectively.
