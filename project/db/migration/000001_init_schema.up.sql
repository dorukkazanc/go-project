CREATE TABLE "company" (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    address VARCHAR(255)
);

-- Örnek veriler
INSERT INTO "company" (id, name, address) VALUES
(1, 'ABC Teknoloji', 'İstanbul, Türkiye'),
(2, 'XYZ Yazılım', 'Ankara, Türkiye');


CREATE TABLE "user" (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    company_id INTEGER,
    FOREIGN KEY (company_id) REFERENCES company(id) ON DELETE SET NULL
);
-- Örnek veriler
INSERT INTO "user" (id, name, email, company_id) VALUES
(1, 'Ali Yılmaz', 'ali@example.com', 1),
(2, 'Ayşe Demir', 'ayse@example.com', 2),
(3, 'Mehmet Can', 'mehmet@example.com', 1);
