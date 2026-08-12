-- =============================================
-- SUPERSTORE - EXPLORATORY DATA ANALYSIS
-- =============================================

-- 1. Total de pedidos e total de registros
SELECT
    COUNT(DISTINCT "Order ID") AS total_pedidos,
    COUNT(*) AS total_linhas
FROM Superstore;


-- 2. Faturamento total
SELECT
    ROUND(SUM(Sales), 2) AS faturamento_total
FROM Superstore;


-- 3. Lucro total e margem de lucro
SELECT
    ROUND(SUM(Profit), 2) AS lucro_total,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS margem_lucro_percentual
FROM Superstore;


-- 4. Faturamento por categoria
SELECT
    Category AS categoria,
    ROUND(SUM(Sales), 2) AS faturamento
FROM Superstore
GROUP BY Category
ORDER BY faturamento DESC;


-- 5. Faturamento e lucro por categoria
SELECT
    Category AS categoria,
    ROUND(SUM(Sales), 2) AS faturamento,
    ROUND(SUM(Profit), 2) AS lucro
FROM Superstore
GROUP BY Category
ORDER BY lucro DESC;


-- 6. Análise das subcategorias de Furniture
SELECT
    "Sub-Category" AS subcategoria,
    ROUND(SUM(Sales), 2) AS faturamento,
    ROUND(SUM(Profit), 2) AS lucro
FROM Superstore
WHERE Category = 'Furniture'
GROUP BY "Sub-Category"
ORDER BY lucro ASC;


-- 7. Desconto médio de Tables e Bookcases
SELECT
    "Sub-Category" AS subcategoria,
    ROUND(AVG(Discount), 2) AS desconto_medio,
    ROUND(SUM(Profit), 2) AS lucro_total
FROM Superstore
WHERE "Sub-Category" IN ('Tables', 'Bookcases')
GROUP BY "Sub-Category"
ORDER BY lucro_total ASC;


-- 8. Impacto do desconto no lucro de Tables
SELECT
    Discount AS desconto,
    ROUND(SUM(Sales), 2) AS faturamento,
    ROUND(SUM(Profit), 2) AS lucro
FROM Superstore
WHERE "Sub-Category" = 'Tables'
GROUP BY Discount
ORDER BY Discount ASC;

-- 9. Faixas de desconto com prejuízo por subcategoria de Furniture
SELECT
    "Sub-Category" AS subcategoria,
    ROUND(Discount * 100, 2) AS desconto_percentual,
    ROUND(SUM(Sales), 2) AS faturamento,
    ROUND(SUM(Profit), 2) AS lucro
FROM Superstore
WHERE Category = 'Furniture'
GROUP BY
    "Sub-Category",
    Discount
HAVING SUM(Profit) < 0
ORDER BY
    "Sub-Category",
    Discount ASC;


-- 10. Faturamento e lucro por região
SELECT
    Region AS regiao,
    ROUND(SUM(Sales), 2) AS faturamento,
    ROUND(SUM(Profit), 2) AS lucro
FROM Superstore
GROUP BY Region
ORDER BY faturamento DESC;


-- 11. Margem de lucro por região
SELECT
    Region AS regiao,
    ROUND(SUM(Sales), 2) AS faturamento,
    ROUND(SUM(Profit), 2) AS lucro,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS margem_lucro
FROM Superstore
GROUP BY Region
ORDER BY margem_lucro DESC;


-- 12. Desempenho das categorias na região Central
SELECT
    Category AS categoria,
    ROUND(SUM(Sales), 2) AS faturamento,
    ROUND(SUM(Profit), 2) AS lucro,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS margem_lucro
FROM Superstore
WHERE Region = 'Central'
GROUP BY Category
ORDER BY margem_lucro ASC;


-- 13. Desempenho das subcategorias de Furniture na região Central
SELECT
    "Sub-Category" AS subcategoria,
    ROUND(SUM(Sales), 2) AS faturamento,
    ROUND(SUM(Profit), 2) AS lucro,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS margem_lucro
FROM Superstore
WHERE
    Region = 'Central'
    AND Category = 'Furniture'
GROUP BY "Sub-Category"
ORDER BY lucro ASC;


-- 14. Desconto médio por subcategoria de Furniture na região Central
SELECT
    "Sub-Category" AS subcategoria,
    ROUND(AVG(Discount) * 100, 2) AS desconto_medio,
    ROUND(SUM(Sales), 2) AS faturamento,
    ROUND(SUM(Profit), 2) AS lucro,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS margem_lucro
FROM Superstore
WHERE
    Region = 'Central'
    AND Category = 'Furniture'
GROUP BY "Sub-Category"
ORDER BY desconto_medio DESC;


-- 15. Evolução anual do faturamento, lucro e margem
SELECT
    SUBSTR("Order Date", -4) AS ano,
    ROUND(SUM(Sales), 2) AS faturamento,
    ROUND(SUM(Profit), 2) AS lucro,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS margem_lucro
FROM Superstore
GROUP BY ano
ORDER BY ano ASC;


-- 16. Desempenho por segmento de clientes
SELECT
    Segment AS segmento,
    ROUND(SUM(Sales), 2) AS faturamento,
    ROUND(SUM(Profit), 2) AS lucro,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS margem_lucro
FROM Superstore
GROUP BY Segment
ORDER BY faturamento DESC;


-- 17. Estados que apresentam prejuízo
SELECT
    State AS estado,
    ROUND(SUM(Sales), 2) AS faturamento,
    ROUND(SUM(Profit), 2) AS lucro,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS margem_lucro
FROM Superstore
GROUP BY State
HAVING SUM(Profit) < 0
ORDER BY lucro ASC;


-- 18. Rentabilidade por modo de envio
SELECT
    "Ship Mode" AS tipo_envio,
    ROUND(SUM(Sales), 2) AS faturamento,
    ROUND(SUM(Profit), 2) AS lucro,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS margem_lucro
FROM Superstore
GROUP BY "Ship Mode"
ORDER BY margem_lucro DESC;


-- 19. Produtos com os maiores lucros e prejuízos
WITH TopLucros AS (
    SELECT
        "Product Name" AS nome_produto,
        ROUND(SUM(Sales), 2) AS faturamento,
        ROUND(SUM(Profit), 2) AS lucro,
        ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS margem_lucro
    FROM Superstore
    GROUP BY "Product Name"
    HAVING SUM(Profit) > 0
    ORDER BY lucro DESC
    LIMIT 3
),
TopPrejuizos AS (
    SELECT
        "Product Name" AS nome_produto,
        ROUND(SUM(Sales), 2) AS faturamento,
        ROUND(SUM(Profit), 2) AS lucro,
        ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS margem_lucro
    FROM Superstore
    GROUP BY "Product Name"
    HAVING SUM(Profit) < 0
    ORDER BY lucro ASC
    LIMIT 3
)
SELECT * FROM TopLucros
UNION ALL
SELECT * FROM TopPrejuizos;


-- 20. Meses com os maiores e menores lucros
WITH MaioresLucros AS (
    SELECT
        CAST(
            SUBSTR("Order Date", 1, INSTR("Order Date", '/') - 1)
            AS INTEGER
        ) AS mes,
        ROUND(SUM(Sales), 2) AS faturamento,
        ROUND(SUM(Profit), 2) AS lucro,
        ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS margem_lucro
    FROM Superstore
    GROUP BY mes
    ORDER BY lucro DESC
    LIMIT 3
),
MenoresLucros AS (
    SELECT
        CAST(
            SUBSTR("Order Date", 1, INSTR("Order Date", '/') - 1)
            AS INTEGER
        ) AS mes,
        ROUND(SUM(Sales), 2) AS faturamento,
        ROUND(SUM(Profit), 2) AS lucro,
        ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS margem_lucro
    FROM Superstore
    GROUP BY mes
    ORDER BY lucro ASC
    LIMIT 3
)
SELECT * FROM MaioresLucros
UNION ALL
SELECT * FROM MenoresLucros;


-- 21. Meses com os maiores e menores faturamentos
WITH MaioresFaturamentos AS (
    SELECT
        CAST(
            SUBSTR("Order Date", 1, INSTR("Order Date", '/') - 1)
            AS INTEGER
        ) AS mes,
        ROUND(SUM(Sales), 2) AS faturamento,
        ROUND(SUM(Profit), 2) AS lucro,
        ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS margem_lucro
    FROM Superstore
    GROUP BY mes
    ORDER BY faturamento DESC
    LIMIT 3
),
MenoresFaturamentos AS (
    SELECT
        CAST(
            SUBSTR("Order Date", 1, INSTR("Order Date", '/') - 1)
            AS INTEGER
        ) AS mes,
        ROUND(SUM(Sales), 2) AS faturamento,
        ROUND(SUM(Profit), 2) AS lucro,
        ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS margem_lucro
    FROM Superstore
    GROUP BY mes
    ORDER BY faturamento ASC
    LIMIT 3
)
SELECT * FROM MaioresFaturamentos
UNION ALL
SELECT * FROM MenoresFaturamentos;