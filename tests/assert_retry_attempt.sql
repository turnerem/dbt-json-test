{% set attempt = env_var('ORCHESTRA_TASK_ATTEMPT_NUMBER', '1') | int %}

-- Singular test: any returned row = failure.
-- Fails on attempt 1, passes from attempt 2 onward.
select
    {{ attempt }} as attempt_number,
    'deliberate first-attempt failure to demo retry recovery' as failure_reason
where {{ attempt }} < 3
