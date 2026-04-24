with orders as (
    select * from {{ ref('stg_orders') }}
),

returns as (
    select * from {{ ref('stg_returns') }}
),

people as (
    select * from {{ ref('stg_people') }}
),

final as (
    select
        p.regional_manager,
        p.region,
        count(distinct o.order_id) as total_orders,
        count(distinct r.order_id) as total_returns,
        -- Calculate return rate as a percentage
        round((count(distinct r.order_id) / count(distinct o.order_id)) * 100, 2) as return_rate_pct,
        sum(o.sales_amount) as total_sales,
        sum(o.profit_amount) as total_profit
    from orders o
    left join people p on o.region = p.region
    left join returns r on o.order_id = r.order_id
    group by 1, 2
)

select * from final
