require('orgmode').setup({
    org_agenda_files = '~/org/*',
    org_default_notes_file = '~/org/refile.org',
    org_hide_emphasis_markers = "true",
    mappings = {
        org = {
            org_toggle_checkbox = '<prefix>tt',
        },
    },

})
