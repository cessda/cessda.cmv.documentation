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

This example uses an example [document](glossary.html#document) and [profile](glossary.html#profile) hosted on the CMV GitHub repository.

```sh
HOSTNAME=https://cmv.cessda.eu
DOCUMENT_URL=https://raw.githubusercontent.com/cessda/cessda.cmv.core/refs/tags/4.0.0/src/main/resources/demo-documents/ddi-v25/ukds-2000.xml
PROFILE_URL=https://raw.githubusercontent.com/cessda/cessda.cmv.core/refs/tags/4.0.0/src/main/resources/demo-documents/ddi-v25/cdc25_profile.xml

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

The API can also accept XML that has been embedded in the JSON request.
The XML must be properly escaped by a tool like `jq` in order for the content to be preserved.

```sh
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

The API can also take a list of constraints to validate against, rather than a pre-set validation gate.

```sh
HOSTNAME=https://cmv.cessda.eu
DOCUMENT_URL=https://raw.githubusercontent.com/cessda/cessda.cmv.core/refs/tags/4.0.0/src/main/resources/demo-documents/ddi-v25/ukds-2000.xml
PROFILE_URL=https://raw.githubusercontent.com/cessda/cessda.cmv.core/refs/tags/4.0.0/src/main/resources/demo-documents/ddi-v25/cdc25_profile.xml

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
  "constraints": ["MandatoryNodeConstraint", "ControlledVocabularyRepositoryConstraint", "CompilableXPathConstraint"]
}'
```

## Trigger validation with Swagger / [OpenAPI 3.0](https://swagger.io/specification)

Please note: There is an integration problem with Swagger and Spring-Boot reported:
 [Swagger does not reuse configured Jackson objectMapper Spring bean](https://github.com/cessda/cessda.cmv.server/issues/43)

### Step 1

* Browse to the <a href="https://api.tech.cessda.eu/" target="_blank">Swagger API documentation user interface</a>

![Step 1](images/user-documentation/swagger-tutorial-01.png)

### Step 2

* Click on endpoint `POST /api/V0/Validation` (green box)
* Click on the button `Try it out`

![Step 2](images/user-documentation/swagger-tutorial-02.png)

### Step 3

* Enter an URL for the document, e.g. [DDI Codebook UKDS 2000](https://raw.githubusercontent.com/cessda/cessda.cmv.core/refs/tags/4.0.0/src/main/resources/demo-documents/ddi-v25/ukds-2000.xml)
* Enter an URL for the profile, e.g. [CDC Profile v0.31](https://raw.githubusercontent.com/cessda/cessda.cmv.core/refs/tags/4.0.0/src/main/resources/demo-documents/ddi-v25/cdc25_profile.xml)
* Select a validation gate
* Click on button `Execute`

![Step 3](images/user-documentation/swagger-tutorial-03.png)

### Step 4

* Scroll down and see constraint violation messages in the response body
* If this list is empty, the document is valid

![Step 4](images/user-documentation/swagger-tutorial-04.png)
