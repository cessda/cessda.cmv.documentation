---
title: Home
layout: home
has_children: true
nav_order: 000
---

# {{ page.title }}

This is the user guide for the [CESSDA Metadata Validator](https://cmv.cessda.eu/).

It presents an overview of how to use the Metadata Validator.

## Migration Notes for Version 4.0.0

Due to changes in XML namespace support previous DDI profiles will validate differently. For correct validation, use the following profiles:

- CDC DDI 2.5 profiles - use version 3.0.0 or newer
- CDC DDI 2.6 profiles - use version 2.0.0 or newer
- CDC DDI 3.2 profile - use version 2.0.0 or newer
- CDC DDI 3.3 profile - use version 2.0.0 or newer
- EQB DDI 2.5 profile - use version 1.0.0 or newer

The built-in profiles shipped with `cmv-core` plus those available at <https://cmv.cessdsa.eu/> have been updated accordingly.

![CC-BY-4.0](images/cc-by.svg "CC-BY-4.0")
This work is licensed under [Creative Commons Attribution 4.0 International](https://creativecommons.org/licenses/by/4.0/).
