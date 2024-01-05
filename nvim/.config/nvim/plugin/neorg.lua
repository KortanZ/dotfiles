require('neorg').setup {
    load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {},
        ["core.dirman"] = {
            config = {
                workspaces = {
                    notes = "~/doc/neorg/notes",
                    work = "~/doc/neorg/work",
                },
                index = "index.norg",
                default_workspace = "notes",
            }
        },
        ["core.journal"] = {
            config = {
                strategy = "flat",
                workspace = "notes"
            }
        },
        ["core.completion"] = {
             config = {
                engine = "nvim-cmp"
            }
        }
    }
}
