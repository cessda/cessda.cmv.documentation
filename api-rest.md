---
title: RESTful HTTP
parent: API
grand_parent: Home
has_children: false
is_hidden: false
nav_order: 061
---

# {{ page.title }}

## Trigger validation with [curl](https://curl.se/)

### Use resolvable URLs for [document](glossary.html#document) and/or [profile](glossary.html#profile)

```bash
HOSTNAME=https://cmv[-dev].cessda.eu
DOCUMENT_URL=https://bitbucket.org/cessda/cessda.cmv.core/raw/ad7e3ffd847ecb9c35faea329fbc7cfe14bfb7a6/src/main/resources/demo-documents/ddi-v25/ukds-2000.xml
PROFILE_URL=https://bitbucket.org/cessda/cessda.cmv.core/raw/ad7e3ffd847ecb9c35faea329fbc7cfe14bfb7a6/src/main/resources/demo-documents/ddi-v25/cdc25_profile.xml

# If endpoint is secured with HTTP Basic Auth, add option --user $USERNAME:$PASSWORD
curl -s $HOSTNAME/api/V0/Validation \
  --request 'POST' \
  --header 'accept: application/json' \
  --header 'Content-Type: application/json' \
  --data '{
  "document": {
    "uri": "'"$DOCUMENT_URL"'"
  },
  "profile": {
    "uri": "'"$PROFILE_URL"'"
  },
  "validationGateName": "BASIC"
}'
```

### Use JSON-escaped XML-content of document and/or profile

```bash
DOCUMENT_CONTENT=`curl -s $DOCUMENT_URL | jq -Rs .` # Escaping XML to JSON is still not correct!

curl -s $HOSTNAME/api/V0/Validation \
  --request 'POST' \
  --header 'accept: application/json' \
  --header 'Content-Type: application/json' \
  --data '{
  "document": {
    "content": "'"$DOCUMENT_CONTENT"'"
  },
  "profile": {
    "uri": "'"$PROFILE_URL"'"
  },
  "validationGateName": "BASIC"
}'
```

## Trigger validation with Swagger / [OpenAPI 3.0](https://swagger.io/specification)
* See [Swagger](../api/swagger)
* Please have a reported integration problem with Swagger and Spring-Boot in mind: [Swagger does not reuse configured Jackson objectMapper Spring bean](https://bitbucket.org/cessda/cessda.cmv.server/issues/43)
