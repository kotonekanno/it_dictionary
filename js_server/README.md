## MySQLテーブル作成

```sql
CREATE DATABASE flutter_auth;
USE flutter_auth;

CREATE TABLE users (
  id VARCHAR(50) PRIMARY KEY,
  password VARCHAR(255) NOT NULL
);
```