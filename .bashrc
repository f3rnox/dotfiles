# shellcheck disable=SC1090
#
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

export PNPM_HOME="$HOME/.local/share/pnpm"

for _d in \
  "$HOME/bin" \
  "$HOME/.local/bin" \
  "$HOME/.cargo/bin" \
  "$PNPM_HOME" \
  "$HOME/.console-ninja/.bin"
do
  case ":$PATH:" in
    *":${_d}:"*) ;;
    *) PATH="${_d}:$PATH" ;;
  esac
done
unset -v _d
export PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

eval "$(zoxide init bash)"
source ~/.bash-powerline.sh

alias ll='ls -alh'
alias ..='cd ..'
alias ~='cd ~'
alias c='clear'
alias x='exit'

alias pni='pnpm install'
alias pna='pnpm add'
alias pnad='pnpm add -D'
alias pns='pnpm start'
alias pnd='pnpm dev'
alias pnt='pnpm test'
alias pnl='pnpm lint'
alias pnb='pnpm build'
alias pnf='pnpm format'
alias pnp='pnpm publish'

alias pkgi='sudo dnf install -y'
alias pkgu='sudo dnf update -y'

alias gs='git status'
alias gcam='git commit -am'
alias ga='git add'
alias gap='git add -p'
alias gl='git log'

function gp() {
    local current_branch
    current_branch="$(git_current_branch_or_fail)" || return 1
    git push -u origin "$current_branch"
}

function gpf() {
    local current_branch
    current_branch="$(git_current_branch_or_fail)" || return 1
    git push -u origin --force "$current_branch"
}

# Clone git@github.com:org/repo.git into ~/.src/github/org/repo (optionally replace existing)
function gc() {
    local spec org repo dest reply
    spec="${1-}"
    org="${spec%%/*}"
    repo="${spec#*/}"
    if [ -z "$spec" ] || [ "$org" = "$spec" ] || [[ "$repo" == */* ]] || [ -z "$org" ] || [ -z "$repo" ]; then
        echo 'usage: gc org/repo' >&2
        return 1
    fi
    dest="${HOME}/.src/github/${org}/${repo}"
    if [ -e "$dest" ]; then
        read -r -p "gc: $dest already exists. Delete and clone fresh? [y/N] " reply
        case "${reply}" in
            [yY]|[yY][eE][sS]) rm -rf -- "$dest" ;;
            *) echo 'gc: left unchanged' >&2
               return 0
               ;;
        esac
    fi
    mkdir -p "${HOME}/.src/github/${org}"
    git clone --depth=1 "git@github.com:${org}/${repo}.git" "$dest"
    cd "$dest"
}

function git_current_branch_or_fail() {
    local current_branch
    current_branch="$(git branch --show-current 2>/dev/null)"

    if [ -z "$current_branch" ]; then
        echo "Not on a branch (detached HEAD or not a git repository)."
        return 1
    fi

    echo "$current_branch"
}
