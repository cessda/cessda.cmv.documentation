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
  as [DDI Lifecycle](https://ddialliance.org/ddi-lifecycle)
  or [DDI Codebook](https://ddialliance.org/ddi-codebook)
  with or without [OAI-PMH 2.0 GetRecord envelope](https://www.openarchives.org/OAI/2.0/openarchivesprotocol.htm#GetRecord).
* A document is the subject of validation.

## Profile

* A profile holds a set of [constraints](#constraint).
* A profile is itself a document.

## Constraint

* A constraint is a requirement a [document](#document) satisfies or violates.
* A constraint is expressed as XPath location path together with needed properties.
* Within the context of a [document](#document), a [constraint](#constraint) builds [validators](#validator).

## Validation Gate

* A validation gate holds a set of constraint types and serves as validation executor.
* A [constraint](#constraint) is ignored if its constraint type is not part of the validation gate.
* CMV defines four, hierarchically structured validation gates: Basic, Standard, Extended and Strict.

## Validator

* A validator is called by a validation gate to answer the question if the underlying constraint is satisfied or violated.
