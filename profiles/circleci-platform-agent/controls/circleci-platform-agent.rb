control 'packages' do
  impact 1.0
  title 'confirm package installation'
  desc 'confirm all desired packages are installed'
  describe command('apk info') do
    its('stdout') { should include ('go') }
  end
end

control 'kops version' do
  impact 1.0
  title 'confirm kops version installed'
  desc 'confirm version reported by kops matches the desired version'
  describe command('kops version') do
    its('stdout') { should include ('1.12') }
  end
end

control 'kubectl version' do
  impact 1.0
  title 'confirm kubectl version installed'
  desc 'confirm version reported by kubectl matches the desired version'
  describe command('kubectl version') do
    its('stdout') { should include ('1.14') }
  end
end

control 'consul version' do
  impact 1.0
  title 'confirm consul version installed'
  desc 'confirm version reported by consul matches the desired version'
  describe command('consul version') do
    its('stdout') { should include ('1.5') }
  end
end
