require 'redmine'
require_dependency 'redmine_issue_note_journal/my_hook'

Redmine::Plugin.register :redmine_issue_note_journal do
  name 'Redmine Issue note journal diff'
  author 'Sergey Lapetov'
  description 'Save diff issue note in journal.'
  version '0.0.1'
  url 'http://srv-dnp.argos.loc/gitlab/argosprogrammer/redmine_issue_note_journal'
end
