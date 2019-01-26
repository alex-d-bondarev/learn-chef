# # encoding: utf-8

# Inspec test for recipe mydatabase::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe package('postgresql') do
  it { should be_installed }
end

describe port(5432) do
  its('processes') { should include 'postgres' }
end

describe command("psql roux_artists -c '\\conninfo'") do
  its('stdout') { should match 'connected' }
end

# postgres_session

sql = postgres_session('database_user', 'user_password', 'localhost')

describe sql.query('\conninfo', ['roux_artists']) do
  its('output') { should match 'connected' }
end