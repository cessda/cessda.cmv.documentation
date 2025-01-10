---
title: API
parent: Home
has_children: true
is_hidden: false
nav_order: 060
---

# {{ page.title }}

The CMV API is available in two forms, a HTTP REST API and a Java API.

Documentation for the REST API is available at <https://api.tech.cessda.eu/>.
In the top right-hand corner select CESSDA Metadata Validator from the list of API definitions.

To use the Java API, include the dependency and repository definition in your Maven project.

```xml
<dependency>
  <groupId>eu.cessda.cmv</groupId>
  <artifactId>cmv-core</artifactId>
  <version>4.0.0</version>
</dependency>
```

```xml
<repositories>
  <repository>
    <id>cessda-nexus</id>
    <name>CESSDA Nexus Repository</name>
    <url>https://nexus.cessda.eu/repository/maven-releases</url>
  </repository>
</repositories>
```

An example usage of the API is shown below.

```java
boolean validateFiles() throws IOException, NotDocumentException
{
  // Create the validator factory and the validation service
  CessdaMetadataValidatorFactory factory = new CessdaMetadataValidatorFactory();

  // Load the validation profile; this can be a file, URI or a InputStream
  Profile profile = factory.newProfile(new File("path/to/cmv-profile.xml"));

  // Load the document to validate
  Document documentToValidate = factory.newDocument(new File("path/to/ddi-document-to-validate.xml"));

  // Run the validation.
  ValidationReport validationReport = factory.validate(documentToValidate, profile, ValidationGateName.BASIC);

  // The validation report can now be inspected. A document is valid if no constraint violations are present.
  List<ConstraintViolation> constraintViolations = validationReport.getConstraintViolations();
  boolean isValid = constraintViolations.isEmpty();

  // Constraint violations can be detailed if present.
  for (ConstraintViolation violation : constraintViolations) {
    System.out.println(violation.toString());
  }

  // Return the validation status
  return isValid;
}
```

Consult the [JavaDoc](api/javadoc/index.html) for more details.
