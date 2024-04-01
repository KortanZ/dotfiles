require('orgmode').setup({
  org_agenda_files = '~/org/*',
  org_default_notes_file = '~/org/refile.org',
  mappings = {
      org = {
          org_toggle_checkbox = '<prefix>tt',
      },
  },

})
