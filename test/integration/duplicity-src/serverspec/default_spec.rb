require 'serverspec'

include Serverspec::Helper::Exec

# Ensure duplicity exists
describe command('duplicity --version') do
  it { should return_stdout 'duplicity 0.6.23' }
  it { should return_exit_status 0 }
end