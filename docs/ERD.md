# Entity relationship diagram — Rubric 1.2

```mermaid
erDiagram
    CATEGORY ||--o{ PRODUCT : contains
    BRAND ||--o{ PRODUCT : makes
    CATEGORY {
      integer id PK
      string name
      text description
    }
    BRAND {
      integer id PK
      string name
      string country
    }
    PRODUCT {
      integer id PK
      integer category_id FK
      integer brand_id FK
      string source_code
      string name
      text description
      decimal price
      decimal rating
      string skin_type
    }
```

Each product belongs to exactly one category and one brand. Both parents can have many products. These associations are used in search, product pages, category pages and brand pages.
