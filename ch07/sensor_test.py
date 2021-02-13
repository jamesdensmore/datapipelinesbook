from datetime import datetime
from airflow import DAG
from airflow.operators.dummy_operator import DummyOperator
from airflow.sensors.external_task_sensor import ExternalTaskSensor
from datetime import timedelta
from airflow.utils.dates import days_ago

dag = DAG(
        'sensor_test',
        description='DAG with a sensor',
        schedule_interval=timedelta(days=1),
        start_date = days_ago(1))

sensor = ExternalTaskSensor(
            task_id='dag_sensor',
            external_dag_id = 'elt_pipeline_sample',
            external_task_id = None,
            dag=dag,
            mode = 'reschedule')

task1 = DummyOperator(
            task_id='dummy_task',
            retries=1,
            dag=dag)

sensor >> task1
