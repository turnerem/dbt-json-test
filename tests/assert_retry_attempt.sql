{% set required_attempts = var('required_attempts', 2) %}
with attempts as (
    select count(*) as attempt_count
    from {{ ref('retry_attempt_log') }}
    where pipeline_run_id = '{{ env_var("ORCHESTRA_PIPELINE_RUN_ID", "local") }}'
)
select attempt_count from attempts where attempt_count < {{ required_attempts }}
