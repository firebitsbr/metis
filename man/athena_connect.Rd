% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/metis.r
\name{athena_connect}
\alias{athena_connect}
\title{Make a JDBC connection to Athena}
\usage{
athena_connect(default_schema = "default", region = c("us-east-1",
  "us-east-2", "us-west-2"),
  s3_staging_dir = Sys.getenv("AWS_S3_STAGING_DIR"), max_error_retries = 10,
  connection_timeout = 10000, socket_timeout = 10000, log_path = "",
  log_level = c("OFF", "FATAL", "ERROR", "WARNING", "INFO", "DEBUG", "TRACE"))
}
\arguments{
\item{default_schema}{default schema (you'll still need to fully qualify non-default schema table names)}

\item{region}{AWS region (Ref: \url{http://docs.aws.amazon.com/general/latest/gr/rande.html#athena})}

\item{s3_staging_dir}{the Amazon S3 location to which your query output is written. The JDBC driver then asks Athena to read the results and provide rows of data back to the user.}

\item{max_error_retries}{the maximum number of retries that the JDBC client attempts to make a request to Athena.}

\item{connection_timeout}{the maximum amount of time, in milliseconds, to make a successful connection to Athena before an attempt is terminated.}

\item{socket_timeout}{the maximum amount of time, in milliseconds, to wait for a socket in order to send data to Athena.}

\item{log_path}{local path of the Athena JDBC driver logs. If no log path is provided, then no log files are created.}

\item{log_level}{log level of the Athena JDBC driver logs. Use  names
"OFF", "FATAL", "ERROR", "WARNING", "INFO", "DEBUG", "TRACE".}
}
\description{
Handles the up-front JDBC config
}
\examples{
\dontrun{
use_credentials("personal")

ath <- athena_connect(default_schema = "sampledb",
                      s3_staging_dir = "s3://accessible-bucket",
                      log_path = "/tmp/athena.log",
                      log_level = "DEBUG")

dbListTables(ath)

dbGetQuery(ath, "SELECT * FROM sampledb.elb_logs LIMIT 1")

}
}
