---
title: Constraints
parent: Home
has_children: false
is_hidden: false
nav_order: 040
---

# {{ page.title }}

* Each constraint is described by its semantic definition, xml representation and example usage.
* Constraints are assigned to pre-defined [validation gates](glossary.html#validation-gate) `Basic`, `Basic Plus`, `Standard`, `Extended` and `Strict` to support different levels of validation strictness.

|                                                                                           | Basic     | Basic Plus   | Standard   | Extended   | Strict    |
|-------------------------------------------------------------------------------------------|:---------:|:------------:|:----------:|:----------:|:---------:|
| [Mandatory Node](constraints.html#mandatory-node)                                                        | ![X](images/table-x.png)     | ![X](images/table-x.png)        | ![X](images/table-x.png)      | ![X](images/table-x.png)      | ![X](images/table-x.png)     |
| [Mandatory Node if Parent Present](constraints.html#mandatory-node-if-parent-present)                    | ![X](images/table-x.png)     | ![X](images/table-x.png)        | ![X](images/table-x.png)      | ![X](images/table-x.png)      | ![X](images/table-x.png)     |
| [Code Value of Controlled Vocabulary](constraints.html#code-value-of-controlled-vocabulary)              |         | ![X](images/table-x.png)        | ![X](images/table-x.png)      | ![X](images/table-x.png)      | ![X](images/table-x.png)     |
| [Descriptive Term of Controlled Vocabulary](constraints.html#descriptive-term-of-controlled-vocabulary ) |         | ![X](images/table-x.png)        | ![X](images/table-x.png)      | ![X](images/table-x.png)      | ![X](images/table-x.png)     |
| [Recommended Node](constraints.html#recommended-node)                                                    |         |            | ![X](images/table-x.png)      | ![X](images/table-x.png)      | ![X](images/table-x.png)     |
| [Fixed Value Node](constraints.html#fixed-value-node)                                                   |         |            |          | ![X](images/table-x.png)      | ![X](images/table-x.png)     |
| [Optional Node](constraints.html#optional-node)                                                          |         |            |          | ![X](images/table-x.png)      | ![X](images/table-x.png)     |
| [Maximum Node Occurrence](constraints.html#maximum-node-occurrence)                                     |         |            |          |          | ![X](images/table-x.png)     |
| [Node in Profile](constraints.html#node-in-profile)                                                     |         |            |          |          | ![X](images/table-x.png)     |
| [Compilable XPath](constraints.html#compilable-xpath)                                                    |         |            |          |          |         |
| [Predicate-less XPath](constraints.html#predicate-less-xpath)                                            |         |            |          |          |         |

## Mandatory Node

### Definition

* An XML node (element or attribute) described by a predicate-less XPath expression is mandatory to be used within the metadata document.
* This constraint includes [Not Blank Node](\#Not_Blank_Node) constraint.
* The metadata document is valid, only if the element is present at least once and the node is not blank, otherwise invalid.

### Representation

* DDI Profile

  ```xml
  <pr:Used xpath="/codeBook/docDscr/citation/titlStmt/titl" isRequired="true"/>
  ```

### Example

* Valid, because *titl* element is present and not blank

  ```xml
  <docDscr>
    <citation>
      <titlStmt>
        <titl>DDI2.5 XML CODEBOOK RECORD FOR STUDY NUMBER 2000</titl>
      </titlStmt>
    </citation>
  </docDscr>
  ```

* Invalid, because *titl* element is not present

  ```xml
  <docDscr>
    <citation>
    <titlStmt>
    </titlStmt>
    </citation>
  </docDscr>
  ```

* Invalid, because *titl* element is blank

  ```xml
  <docDscr>
    <citation>
    <titlStmt>
      <titl></titl>
      <!--or <titl>  </titl> -->
    </titlStmt>
    </citation>
  </docDscr>
  ```

## Recommended Node

### Definition

* An XML node (element or attribute) described by a predicate-less XPath expression is recommended to be used within the metadata document.
* This constraint includes [Not Blank Node](\#Not_Blank_Node) constraint.
* The metadata document is valid, only if the element is present at least once and the node is not blank, otherwise invalid.

### Representation

* DDI Profile

  ```xml
  <pr:Used xpath="/codeBook/stdyDscr/citation/rspStmt/AuthEnty" isRequired="false">
    <pr:Instructions>
    <r:Content>
      <![CDATA[<Constraints><RecommendedNodeConstraint/></Constraints>]]>
    </r:Content>
    </pr:Instructions>
  </pr:Used>
  ```

### Example

* Valid, because *AuthEnty* element is present and not blank

  ```xml
  <stdyDscr>
    <citation>
    <rspStmt>
      <AuthEnty>Lummis, T., University of Essex. Department of Sociology</AuthEnty>
    </rspStmt>
    </citation>
  </stdyDscr>
  ```

* Invalid, because *AuthEnty* element is not present

  ```xml
  <stdyDscr>
    <citation>
    <rspStmt/>
    </citation>
  </stdyDscr>
  ```

* Invalid, because *AuthEnty* element is blank

  ```xml
  <stdyDscr>
    <citation>
    <rspStmt>
      <AuthEnty></AuthEnty>
      <!--or <AuthEnty>   </AuthEnty> -->
    </rspStmt>
    </citation>
  </stdyDscr>
  ```

## Fixed Value Node

### Definition

* The metadata document is valid, only if the node value equals to the fixed value defined in the profile, otherwise invalid.

### Representation

* DDI Profile

  ```xml
  <pr:Used xpath="/codeBook/stdyDscr/stdyInfo/sumDscr/anlyUnit/concept/@vocab"
       defaultValue="DDI Analysis Unit"
       fixedValue="true">
  </pr:Used>
  ```

### Example

* Valid, because *vocab* attribute value equals to "DDI Analysis Unit"

  ```xml
  <sumDscr>
    <anlyUnit>
    <concept vocab="DDI Analysis Unit" />
    </anlyUnit>
  </sumDscr>
  ```

* Invalid, because *vocab* attribute value does not equal to "DDI Analysis Unit"

  ```xml
  <sumDscr>
    <anlyUnit>
    <concept vocab="DDI Analyseeinheit" />
    </anlyUnit>
  </sumDscr>
  ```

## Optional Node

### Definition

* An XML node (element or attribute) described by a predicate-less XPath expression is optional to be used within the metadata document.
* This constraint includes [Not Blank Node](\#Not_Blank_Node) constraint.
* The metadata document is valid, only if the element is present at least once and the node is not blank, otherwise invalid.

### Representation

* DDI Profile

  ```xml
  <pr:Used xpath="/codeBook/stdyDscr/citation/rspStmt/AuthEnty" isRequired="false"/>
  ```

### Example

* Valid, because *AuthEnty* element is present and not blank

  ```xml
  <stdyDscr>
    <citation>
    <rspStmt>
      <AuthEnty>Lummis, T., University of Essex. Department of Sociology</AuthEnty>
    </rspStmt>
    </citation>
  </stdyDscr>
  ```

* Invalid, because *AuthEnty* element is not present

  ```xml
  <stdyDscr>
    <citation>
    <rspStmt/>
    </citation>
  </stdyDscr>
  ```

* Invalid, because *AuthEnty* element is blank

  ```xml
  <stdyDscr>
    <citation>
    <rspStmt>
      <AuthEnty></AuthEnty>
      <!--or <AuthEnty>   </AuthEnty> -->
    </rspStmt>
    </citation>
  </stdyDscr>
  ```

## Mandatory Node if Parent Present

### Definition

* A node may only be mandatory if the parent node is present.
* The metadata document is valid, only if - provided the parent node is
  present - the node itself is present at least once and is not blank,
  otherwise invalid.
* This constraint includes [Not Blank Node](\#Not_Blank_Node) constraint.

### Representation

* DDI Profile

  ```xml
  <pr:Used xpath="/codeBook/stdyDscr/citation/titlStmt/IDNo" isRequired="false"/>
  <pr:Used xpath="/codeBook/stdyDscr/citation/titlStmt/IDNo/@agency" isRequired="false">
    <pr:Instructions>
    <r:Content>
      <![CDATA[
      <Constraints>
        <MandatoryNodeIfParentPresentConstraint/>
      </Constraints>
      ]]>
    </r:Content>
    </pr:Instructions>
  </pr:Used>
  ```

### Example

* Valid, because *agency* element is present and not blank

  ```xml
  <stdyDscr>
    <citation>
    <titlStmt>
      <IDNo agency="GESIS">ZA2800</IDNo>
    </titlStmt>
    </citation>
  </stdyDscr>
  ```

* Valid, because *IDNo* parent element is not present

  ```xml
  <stdyDscr>
    <citation>
    <titlStmt/>
    </citation>
  </stdyDscr>
  ```

* Invalid, because *agency* element is not present

  ```xml
  <stdyDscr>
    <citation>
    <titlStmt>
       <IDNo>ZA2800</IDNo>
    </titlStmt>
    </citation>
  </stdyDscr>
  ```

* Invalid, because *agency* element is blank

  ```xml
  <stdyDscr>
    <citation>
    <titlStmt>
      <IDNo agency="">ZA2800</IDNo>
    </titlStmt>
    </citation>
  </stdyDscr>
  ```

## Code Value of Controlled Vocabulary

### Definition

* A field element in a metadata document uses a controlled vocabulary (CV).
* The metadata document is valid, only if the field element is a codeValue of the given CV, otherwise invalid.

### Representation

* DDI Profile

  ```xml
  <pr:Used xpath="/codeBook/stdyDscr/stdyInfo/sumDscr/anlyUnit/concept">
    <pr:Instructions>
    <r:Content>
      <![CDATA[
      <Constraints>
        <CodeValueOfControlledVocabularyConstraint/>
      </Constraints>
      ]]>
    </r:Content>
    </pr:Instructions>
  </pr:Used>
  <pr:Used xpath="/codeBook/stdyDscr/stdyInfo/sumDscr/anlyUnit/concept/@vocabURI">
    <pr:Instructions>
    <r:Content>
      <![CDATA[
      <Constraints>
        <ControlledVocabularyRepositoryConstraint>
        <RepositoryUri>https://vocabularies.cessda.eu/v1/vocabulary-details/AnalysisUnit/en/2.0</RepositoryUri>
        <RepositoryType>eu.cessda.cmv.core.controlledvocabulary.CessdaControlledVocabularyRepository</RepositoryType>
        </ControlledVocabularyRepositoryConstraint>
        <ControlledVocabularyRepositoryConstraint>
        <RepositoryUri>https://vocabularies.cessda.eu/v1/vocabulary-details/AnalysisUnit/en/1.0</RepositoryUri>
        <RepositoryType>eu.cessda.cmv.core.controlledvocabulary.CessdaControlledVocabularyRepository</RepositoryType>
        </ControlledVocabularyRepositoryConstraint>
      </Constraints>
      ]]>
    </r:Content>
    </pr:Instructions>
  </pr:Used>
  ```

### Example

* Valid, because *Individual* is a codeValue of
 [AnalysisUnit:2.0](https://vocabularies.cessda.eu/urn/urn:ddi:int.ddi.cv:AnalysisUnit:2.0)
 and *TextUnit* is a codeValue of
 [AnalysisUnit:1.0](https://vocabularies.cessda.eu/urn/urn:ddi:int.ddi.cv:AnalysisUnit:1.0)

  ```xml
  <stdyInfo>
   <sumDscr>
     <anlyUnit>
     <concept vocabURI="https://vocabularies.cessda.eu/v1/vocabulary-details/AnalysisUnit/en/2.0">Individual</concept>
     <concept vocabURI="https://vocabularies.cessda.eu/v1/vocabulary-details/AnalysisUnit/en/1.0">TextUnit</concept>
     </anlyUnit>
   </sumDscr>
  </stdyInfo>
  ```

* Invalid, because *Person* is **not** a codeValue of [AnalysisUnit:2.0](https://vocabularies.cessda.eu/urn/urn:ddi:int.ddi.cv:AnalysisUnit:2.0)

  ```xml
  <stdyInfo>
   <sumDscr>
     <anlyUnit>
     <concept vocabURI="https://vocabularies.cessda.eu/v1/vocabulary-details/AnalysisUnit/en/2.0">Person</concept>
     </anlyUnit>
   </sumDscr>
  </stdyInfo>
  ```

## Descriptive Term of Controlled Vocabulary

### Definition

* A field element in a metadata document uses a controlled vocabulary (CV).
* The metadata document is valid, only if the field element is a
  descriptive term of the given CV, otherwise invalid.

### Representation

* DDI Profile

  ```xml
  <pr:Used xpath="/codeBook/stdyDscr/stdyInfo/sumDscr/anlyUnit">
    <pr:Instructions>
    <r:Content>
      <![CDATA[
      <Constraints>
        <DescriptiveTermOfControlledVocabularyConstraint/>
      </Constraints>
      ]]>
    </r:Content>
    </pr:Instructions>
  </pr:Used>
  <pr:Used xpath="/codeBook/stdyDscr/stdyInfo/sumDscr/anlyUnit/concept/@vocabURI">
    <pr:Instructions>
    <r:Content>
      <![CDATA[
      <Constraints>
        <ControlledVocabularyRepositoryConstraint>
        <RepositoryUri>https://vocabularies.cessda.eu/v1/vocabulary-details/AnalysisUnit/en/2.0</RepositoryUri>
        <RepositoryType>eu.cessda.cmv.core.controlledvocabulary.CessdaControlledVocabularyRepository</RepositoryType>
        </ControlledVocabularyRepositoryConstraint>
      </Constraints>
      ]]>
    </r:Content>
    </pr:Instructions>
  </pr:Used>
  ```

### Example

* Valid, because *Media unit: Sound* is a descriptive term of [AnalysisUnit:2.0](https://vocabularies.cessda.eu/urn/urn:ddi:int.ddi.cv:AnalysisUnit:2.0)

  ```xml
  <stdyInfo>
   <sumDscr>
    <anlyUnit xml:lang="en">Media unit: Sound
     <concept vocabURI="https://vocabularies.cessda.eu/v1/vocabulary-details/AnalysisUnit/en/2.0">MediaUnit.Sound</concept>
    </anlyUnit>
   </sumDscr>
  </stdyInfo>
  ```

* Invalid, because *Sound media unit* is **not** a descriptive term of [AnalysisUnit:2.0](https://vocabularies.cessda.eu/urn/urn:ddi:int.ddi.cv:AnalysisUnit:2.0)

  ```xml
  <stdyInfo>
   <sumDscr>
    <anlyUnit xml:lang="en">Sound media unit
     <concept vocabURI="https://vocabularies.cessda.eu/v1/vocabulary-details/AnalysisUnit/en/2.0">MediaUnit.Sound</concept>
    </anlyUnit>
   </sumDscr>
  </stdyInfo>
  ```

## Compilable XPath

An XPath expression must be compilable. This constraint is used only for profile document validation.

```xml
# valid
/some/compilable/xpath
```

```xml
# invalid
/some/not compilable/xpath/because-of-blank
```

## Predicate-less XPath

An XPath expression must not contain predicates. This constraint is used only for profile document validation.

```xml
# valid
/some/xpath/without/precicate
```

```xml
# invalid
/some/xpath/with/precicate[@version='1.0']
```

