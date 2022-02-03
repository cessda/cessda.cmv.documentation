---
title: API
parent: Home
has_children: true
is_hidden: false
nav_order: 060
---

# {{ page.title }}

The CMV API is available in two forms, a HTTP REST API and a JAR API.

* [Swagger](../api/swagger)

To use the Java API, include the dependency and repository definition in your Maven project.

```xml
<dependency>
  <groupId>eu.cessda.cmv</groupId>
  <artifactId>cmv</artifactId>
  <version>0.4.2</version>
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
void validateFiles()
{
  // Create the validator factory and the validation service
  CessdaMetadataValidatorFactory factory = new CessdaMetadataValidatorFactory();
  ValidationService.V10 validationService = factory.newValidationService();

  // Load the validation profile; this can be a file, URI or a InputStream
  Resource profile = Resource.newResource(new File("path/to/cmv-profile.xml"));

  // Load the document to validate
  Resource documentToValidate = Resource.newResource(new File("path/to/ddi-document-to-validate.xml"));

  // Run the validation.
  ValidationReportV0 validationReport = validationService.validate(documentToValidate, profile, ValidationGateName.BASIC);

  // The validation report can now be inspected. A document is valid if no constraint violations are present.
  List<ConstraintViolationV0> constraintViolations = validationReport.getConstraintViolations();
  boolean isValid = constraintViolations.isEmpty();

  // Constraint violations can be detailed if present.
  for (ConstraintViolationV0 violation : constraintViolations) {
    System.out.println(violation.getMessage());
  }
}
```

Consult the [JavaDoc](api/javadoc/index.html) for more details.
