module Redmine_issue_note_journal
  module Hooks
    class ControllerIssuesEditBeforeSaveHook < Redmine::Hook::ViewListener

      def controller_issues_new_before_save(context={})
        return ''
      end

      def controller_issues_edit_after_save(context={})
        if context[:journal].notes?
          journal = Journal.find(context[:journal].id)
          journal.details << JournalDetail.new(:property => 'attr', :prop_key => 'note', :old_value => '', :value => context[:journal].notes)
        end
        return ''
      end

      def controller_journals_edit_post(context={})
        if context[:journal].notes?
          journal = Journal.find(context[:journal].id)
          if journal?
            journal.details << JournalDetail.new(:property => 'attr', :prop_key => 'note', :old_value => journal.details.last[:value], :value => context[:journal].notes)
          end  
        end
        return ''
      end

      alias_method :controller_issues_bulk_edit_before_save, :controller_issues_new_before_save

    end

    class Hooks < Redmine::Hook::ViewListener
      render_on :view_issues_show_description_bottom, :partial => 'hooks/issue_note_journal/view_issues_show_description_bottom'
    end

  end




end
