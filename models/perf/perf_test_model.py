import time

BASE_SECONDS = 20

# 20-slot cycle, 4 slow runs = exactly 1 in 5, irregularly spaced
SCHEDULE = [
    1.0, 1.0, 2.5, 1.0, 1.0,
    1.0, 1.0, 1.0, 1.0, 2.5,
    2.5, 1.0, 1.0, 1.0, 1.0,
    1.0, 1.0, 2.5, 1.0, 1.0,
]


def model(dbt, session):
    dbt.config(materialized="table")

    # run_log is ref'd, so dbt builds it before this model —
    # the current run is already counted
    ordinal = dbt.ref("run_log").count("*").fetchone()[0]

    slot = (ordinal - 1) % len(SCHEDULE)
    multiplier = SCHEDULE[slot]
    seconds = BASE_SECONDS * multiplier

    time.sleep(seconds)

    return session.sql(f"""
        select
            {ordinal} as run_ordinal,
            {multiplier} as multiplier,
            {seconds} as intended_seconds
    """)
