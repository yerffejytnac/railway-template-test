FROM hasura/graphql-engine:v2.15.0

# Admin secret key, required to access this instance. This is mandatory when you use webhook or JWT.
# ENV HASURA_GRAPHQL_ADMIN_SECRET=

# Enable the Hasura Console (served by the server on / and /console). (default: false)
ENV HASURA_GRAPHQL_ENABLE_CONSOLE=true

# Set dev mode for GraphQL requests; include the internal key in the errors extensions of the response (if required).
ENV HASURA_GRAPHQL_DEV_MODE=true

#  Enable anonymous telemetry. (default: true)
ENV HASURA_GRAPHQL_ENABLE_TELEMETRY=false

# List of experimental features to be enabled. A comma separated value is expected. Options: inherited_roles, naming_convention, streaming_subscriptions, hide_update_many_fields.
ENV HASURA_GRAPHQL_EXPERIMENTAL_FEATURES=inherited_roles,naming_convention,streaming_subscriptions,hide_update_many_fields

# A JSON string containing type and the JWK used for verifying (and other optional details). Example: {"type": "HS256", "key": "3bd561c37d214b4496d09049fadc542c"}. See the JWT docs for more details.
# ENV HASURA_GRAPHQL_JWT_SECRET=

# Set the logging level. Default: info. Options: debug, info, warn, error.
ENV HASURA_GRAPHQL_LOG_LEVEL=info

# Change $DATABASE_URL to your heroku postgres URL if you're not using
# the primary postgres instance in your app
CMD graphql-engine \
    --database-url $DATABASE_URL \
    serve \
    --server-port $PORT

## Comment the command above and use the command below to
## enable an access-key and an auth-hook
## Recommended that you set the access-key as a environment variable in heroku
#CMD graphql-engine \
#    --database-url $DATABASE_URL \
#    serve \
#    --server-port $PORT \
#    --access-key XXXXX \
#    --auth-hook https://myapp.com/hasura-webhook 
#
