{{ config(materialized='incremental', tags=['retry_demo']) }}

select
    '{{ env_var("ORCHESTRA_PIPELINE_RUN_ID", "local") }}' as pipeline_run_id,
    '{{ invocation_id }}' as dbt_invocation_id,
    {{ dbt.current_timestamp() }} as logged_at
