require 'serverspec'

include Serverspec::Helper::Exec

# Ensure duplicity exists.
# We're not picky on the actual version.
describe command('duplicity --version') do
  it { should return_stdout /duplicity [0-9]+.[0-9]+.[0-9]+/ }
  it { should return_exit_status 0 }
end