{{ config(materialized='incremental') }}
select '{{ invocation_id }}' as invocation_id,
       cast('{{ run_started_at }}' as timestamp) as run_started_at
