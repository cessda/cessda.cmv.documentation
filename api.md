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

* [Javadoc](api/javadoc/index.html)
