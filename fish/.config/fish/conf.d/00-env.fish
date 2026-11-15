set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_CACHE_HOME $HOME/.cache
set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_STATE_HOME $HOME/.local/state

set -gx VSCODE_PORTABLE $XDG_DATA_HOME/vscode
set -gx DOCKER_CONFIG $XDG_CONFIG_HOME/docker
set -gx RUSTUP_HOME $XDG_DATA_HOME/rustup
set -gx CARGO_HOME $XDG_DATA_HOME/cargo
set -gx NPM_CONFIG_USERCONFIG $XDG_CONFIG_HOME/npm/npmrc
set -gx NODE_REPL_HISTORY $XDG_STATE_HOME/node/repl_history
set -gx PYTHON_HISTORY $XDG_STATE_HOME/python/python_history
set -gx PYTHONPYCACHEPREFIX $XDG_CACHE_HOME/python
set -gx PYTHONUSERBASE $XDG_DATA_HOME/python
if test -n "$XDG_RUNTIME_DIR"; and test -d "$XDG_RUNTIME_DIR"
    set -gx XAUTHORITY "$XDG_RUNTIME_DIR/Xauthority"
end
set -gx PSQLRC $XDG_CONFIG_HOME/pg/psqlrc
set -gx PSQL_HISTORY $XDG_STATE_HOME/psql/psql_history
set -gx PGPASSFILE $XDG_CONFIG_HOME/pg/pgpass
set -gx PGSERVICEFILE $XDG_CONFIG_HOME/pg/pg_service.conf
set -gx CUDA_CACHE_PATH $XDG_CACHE_HOME/nv
set -gx CC_SWITCH_CONFIG_DIR $XDG_CONFIG_HOME/cc-switch
set -gx CLAUDE_CONFIG_DIR $XDG_CONFIG_HOME/claude
set -gx CODEX_HOME $XDG_CONFIG_HOME/codex

set -gx EDITOR nvim

set -gx no_proxy "localhost,127.0.0.1,.noman.work"
set -gx NO_PROXY "localhost,127.0.0.1,.noman.work"
