{{ config(materialized='incremental', tags=['retry_demo']) }}

select 1 as attempt where {{ env_var('ORCHESTRA_TASK_ATTEMPT_NUMBER', '1') | int }} < 2
