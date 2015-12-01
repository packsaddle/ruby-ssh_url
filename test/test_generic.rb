require_relative 'helper'

module URI
  module SshGit
    class TestGeneric < Test::Unit::TestCase
      sub_test_case 'Generic' do
        test '#to_s' do
          params = {
            userinfo: 'git',
            host: 'github.com',
            path: 'packsaddle/ruby-uri-ssh_git.git'
          }
          uri = 'git@github.com:packsaddle/ruby-uri-ssh_git.git'
          assert do
            Generic.build(params).to_s == uri
          end
        end
      end

      sub_test_case 'leading slash' do
        # Leading slashes must be preserved as they denote aboslute paths
        # while an absence denotes relative paths.
        test '#to_s' do
          params = {
            userinfo: 'git',
            host: 'github.com',
            path: '/packsaddle/ruby-uri-ssh_git.git'
          }
          uri = 'git@github.com:/packsaddle/ruby-uri-ssh_git.git'
          assert do
            Generic.build(params).to_s == uri
          end
        end
      end

      sub_test_case 'no user' do
        test '#to_s' do
          params = {
            userinfo: '',
            host: 'github.com',
            path: '/packsaddle/ruby-uri-ssh_git.git'
          }
          uri = 'github.com:/packsaddle/ruby-uri-ssh_git.git'
          assert do
            Generic.build(params).to_s == uri
          end
        end
      end
    end
  end
end
