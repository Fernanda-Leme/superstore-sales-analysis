[English version](README_EN.md)

# Análise de Vendas — Superstore

Projeto de análise de vendas e rentabilidade desenvolvido com SQL e Power BI a partir do conjunto de dados Superstore.

## Visão Geral do Projeto

O projeto analisa o desempenho comercial da empresa considerando faturamento, lucro, margem, descontos, categorias de produtos, evolução temporal e resultados geográficos.

O objetivo é transformar dados transacionais em informações que apoiem a identificação de oportunidades, produtos com baixa rentabilidade e fatores que afetam o lucro.

## Dashboard

### Visão Geral de Vendas

![Dashboard de Visão Geral](Dashboard/Screenshots_dashboards/dashboard_visao_geral.png)

### Análise de Rentabilidade

![Dashboard de Rentabilidade](Dashboard/Screenshots_dashboards/dashboard_rentabilidade.png)

## Principais Indicadores

- Faturamento total: US$ 2,30 milhões
- Lucro total: US$ 286,40 mil
- Margem de lucro: 12,47%
- Total de pedidos: 5.009
- Quantidade vendida: 37.873 unidades
- Desconto médio: 15,62%

## Principais Insights

- A categoria Tecnologia (Technology) apresentou o maior faturamento e o maior lucro.
- A categoria Móveis (Furniture) apresentou margem de lucro significativamente menor que as demais categorias.
- Descontos mais elevados estão associados à redução do lucro e à ocorrência de prejuízos.
- As subcategorias Mesas (Tables), Estantes (Bookcases) e Suprimentos (Supplies) apresentaram rentabilidade negativa.
- Califórnia (California) e Nova York (New York) estão entre os estados mais lucrativos, enquanto o Texas apresentou prejuízo significativo.
- O faturamento e o lucro cresceram ao longo do período analisado.

## Análises Realizadas

- Faturamento, lucro e margem por categoria
- Lucro e margem por subcategoria
- Relação entre desconto e lucro
- Evolução anual do faturamento e do lucro
- Rentabilidade por estado
- Comparação de desempenho entre regiões e segmentos

## Ferramentas Utilizadas

- SQL
- SQLite
- Power BI
- DAX
- Git e GitHub

## Estrutura do Repositório

- `database/` — banco de dados SQLite
- `sql/` — consultas utilizadas na análise exploratória
- `insights/` — documentação dos insights de negócio
- `Dashboard/` — arquivo do relatório desenvolvido no Power BI
- `Dashboard/Screenshots_dashboards/` — imagens das páginas do dashboard

## Arquivo do Power BI

[Baixar o dashboard em Power BI](Dashboard/superstore_dashboard.pbix)
