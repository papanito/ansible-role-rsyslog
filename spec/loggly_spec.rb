require 'serverspec'

set :backend, :exec

describe service('rsyslog') do
	it { should be_running }
	it { should be_enabled }
end

describe file('/etc/rsyslog.d/22-loggly.conf') do
	it { should exist }
end

# Validate syntax of rsyslog configuration
describe command('rsyslogd -N1') do
	  its(:exit_status) { should eq 0}
end

