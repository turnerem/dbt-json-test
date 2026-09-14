import os
import time

from dbt.adapters.events.logging import AdapterLogger

logger = AdapterLogger("duckdb")

DEFAULT_SECONDS = 20


def model(dbt, session):
    dbt.config(materialized="table")

    # Set PERF_SLEEP_SECONDS on the Orchestra task to make a run an outlier.
    # Stateless on purpose: the DuckDB file is rebuilt on every run, so a
    # counter stored in the warehouse always resets to 1.
    seconds = float(os.environ.get("PERF_SLEEP_SECONDS", DEFAULT_SECONDS))

    logger.info(f"PERF sleeping={seconds}s (PERF_SLEEP_SECONDS={os.environ.get('PERF_SLEEP_SECONDS')})")
    started = time.time()
    time.sleep(seconds)
    elapsed = time.time() - started
    logger.info(f"PERF slept_actual={elapsed:.1f}s")

    return session.sql(f"""
        select
            {seconds} as intended_seconds,
            {elapsed} as actual_seconds
    """)
