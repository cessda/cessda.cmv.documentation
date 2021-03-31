---
title: Glossary
parent: Home
has_children: false
is_hidden: false
nav_order: 050
---

# {{ page.title }}

## Document

* A document is a file containing social science metadata expressed
  in [DDI Lifecycle](https://ddialliance.org/explore-documentation)
  or [DDI Codebook](https://ddialliance.org/explore-documentation).
* A document is the subject of validation.

## Profile

* A profile holds a set of [constraints](glossary.html#constraint).
* A profile is itself a document.

## Constraint

* A constraint is a requirement a [document](glossary.html#document) satisfies or violates.
* A constraint is expressed as XPath location path together with needed properties.
* Within the context of a [document](glossary.html#document), a [constraint](glossary.html#constraint) builds [validators](glossary.html#validator).

## Validation Gate

* A validation gate holds a set of constraint types and serves as validation executor.
* A [constraint](glossary.html#constraint) is ignored if its constraint type is not part of the validation gate.
* CMV defines four, hierarchically structured validation gates: Basic, Standard, Extended and Strict.

## Validator

* A validator is called by a validation gate to answer the question if the underlying constraint is satisfied or violated.

