export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

autoload -Uz colors && colors
setopt PROMPT_SUBST

function build_prompt() {
  local blue=27
  local purple=135
  local pink=213
  local green=84
  local black=0
  local white=15
  
  local arrow=""
  local venv="" conda="" userhost="" cwd="" git_segment="" final=""
  
  if [[ -n "$VIRTUAL_ENV" ]]; then
    venv="%K{magenta}%F{${black}}  $(basename $VIRTUAL_ENV) %f%k%F{magenta}%K{cyan}${arrow}%f"
  fi
  if [[ -n "$CONDA_DEFAULT_ENV" ]]; then
    conda="%K{${purple}}%F{${black}}  $CONDA_DEFAULT_ENV %f%k%F{${purple}}%K{${blue}}${arrow}%f"
  fi

  userhost="%K{${blue}}%F{${white}}  %n@%m %f%k%F{${blue}}%K{${pink}}${arrow}%f"
  cwd="%K{${pink}}%F{black}   %1~ %f%k"

  if git rev-parse --is-inside-work-tree &>/dev/null; then
    local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    local dirty=$(git status --porcelain 2>/dev/null)

    cwd+="%F{${pink}}%K{${green}}${arrow}%f"

    if [[ -n "$dirty" ]]; then
      git_segment="%K{${green}}%F{black}   ${branch} %f%k%F{${green}}%f"
    else
      git_segment="%K{${green}}%F{black}   ${branch} %f%k%F{${green}}%f"
    fi
  else
    cwd+="%F{${pink}}%f"
  fi

  final=" "
  PROMPT="${venv}${conda}${userhost}${cwd}${git_segment}${final}"

}

precmd_functions+=(build_prompt)
PS2='%F{cyan}▻%f '