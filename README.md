# MARC validator examples

This project contains example MARC XML records with errors that can be
detected by a MARC record validator. The records are organized into
directories according to the field, subfield, or type of validation error.

The examples come from the Czech National Bibliography (ČNB), a dataset
provided by the National Library of the Czech Republic.

The `examples/` directory currently contains 50 XML files. Each file
represents one example, except for the file in `035a-not_unique`, which
contains two records with a non-unique `035a` value.

## Examples overview

### Field 008

- `008-continiuing_resource_issues/` – errors in continuing-resource codes:
  - bad date 2 for a currently published resource
    (`bad_date2_in_currently_published`),
  - conference publication (`conference_publication`),
  - entry convention (`entry_convention`),
  - form of item (`form_of_item`),
  - form of original item (`form_of_original_item`),
  - frequency (`frequency`),
  - government publication (`government_publication`),
  - nature of contents (`nature_of_content`),
  - nature of the entire work (`nature_of_entire_work`),
  - original alphabet or script of the title
    (`original_alphabet_or_script_of_title`),
  - regularity (`regularity`),
  - type of continuing resource (`type_of_continuing_resource`).
- `008-map_issues/` – errors in map codes:
  - form of item (`form_of_item`),
  - projection (`projection`),
  - relief (`relief`),
  - type of cartographic material (`type_of_cartographic_material`).
- `008-with_spaces/` – examples with spaces in `date1` and `date2`,
  combined with different date types (`c`, `d`, `m`, `q`, `s`).

### Individual fields and subfields

- `020a-bad_checksum/` – invalid ISBN check digit.
- `020a-bad_formatting/` – incorrectly formatted ISBN.
- `020a-with_extra_characters/` – extra characters in the ISBN.
- `024-bad_indicator/` – invalid indicator in field `024`.
- `035a-multiple/` – multiple values in subfield `035a`.
- `035a-not_unique/` – a non-unique value in subfield `035a`.
- `040e-rda_with_leader_018_e/` – use of the RDA code in `040e` with code
  `e` in position 18 of the record leader.
- `080a-alphabetical/` – incorrect alphabetical order in `080a`.
- `080a-apostrophe/` – invalid apostrophe in `080a`.
- `080a-dot/` – invalid dot in `080a`.
- `080a-extra_closing_parenthesis/` - extra closing parenthese in `080a`.
- `080a-extra_dash/` - extra dash character in `080a`.
- `080a-extra_opening_parenthesis/` - extra opening parenthese in `080a`.
- `080a-missing_closing_quotation_mark/` – missing closing quotation mark
  in `080a`.
- `245-bad_indicator/` – invalid indicator in field `245`.
- `260c-parenthesis/` – incorrect use of parentheses in `260c`.
- `260c-round_bracket/` – incorrect use of round brackets in `260c`.
- `264c-parenthesis/` – incorrect use of parentheses in `264c`.
- `300b-missing_008_illustrations_coded/` – illustrations are present in
  `300b` but are not coded in field `008`.
- `300b-missing_008_illustrations_not_coded/` – illustrations are coded in
  field `008` but are missing from `300b`.
- `504a-bad_book_material_index/` – incorrect index information in `504a`
  for book material.
- `655a-comics_not_in_field_008/` – a comic is not appropriately represented
  in the codes of field `008`.

## Other files

- `marc-merge.pl` reads the XML files from `examples/`, removes duplicate
  records based on field `001`, and merges them into a single MARC XML file.
