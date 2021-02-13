USE SCHEMA my_db.my_schema;

CREATE STAGE my_s3_stage
  storage_integration = s3_int
  url = 's3://pipeline-bucket/'
  file_format = pipe_csv_format;
