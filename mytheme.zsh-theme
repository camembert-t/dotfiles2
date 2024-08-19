
PROMPT='
$fg[yellow][ $fg[red]%n@%m: %~ $fg[yellow]] $(git_prompt_info)
$fg[green]⟩⟩⟩ $reset_color'

# git theming
ZSH_THEME_GIT_PROMPT_PREFIX="$fg[yellow]· [ $fg[red]"
ZSH_THEME_GIT_PROMPT_SUFFIX="$fg[yellow] ]"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="±"
