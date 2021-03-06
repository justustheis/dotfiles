# https://github.com/blinks zsh theme

function _prompt_char() {
  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    echo "%{%F{blue}%}±%{%f%k%b%}"
  else
    echo "%{%F{blue}%}.%{%f%k%b%}"
  fi
}

bkg=dark;

ZSH_THEME_GIT_PROMPT_PREFIX=" [%{%B%F{blue}%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{%f%k%b%K{${bkg}}%B%F{green}%}]"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{%F{red}%}*%{%f%k%b%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
ZSH_THEME_ICON='☁️  '
else
ZSH_THEME_ICON='🏡 '
fi

PROMPT='%{%f%k%b%}
%{%K{${bkg}}%B%F{green}%}%n%{%B%F{blue}%}@%{%B%F{cyan}%}%m%{%B%F{green}%} %{%b%F{yellow}%K{${bkg}}%}%~%{%B%F{green}%}
%{%K{${bkg}}%}$(_prompt_char)%{%K{${bkg}}%} $ZSH_THEME_ICON '

RPROMPT='%{%B%F{green}%}   $(git_prompt_info)%E%{%f%k%b%}'
