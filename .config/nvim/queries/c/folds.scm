;; Functions
(function_definition
  body: (compound_statement) @fold)

;; Structs
(struct_specifier
  body: (field_declaration_list) @fold)

;; Unions
(union_specifier
  body: (field_declaration_list) @fold)

;; Enums
(enum_specifier
  body: (enumerator_list) @fold)

