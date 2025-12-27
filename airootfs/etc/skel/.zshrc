# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# --- Alap beállítások ---
export EDITOR=nano

# --- History ---
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# --- Színek és kiegészítések ---
autoload -U colors && colors
autoload -Uz compinit && compinit
setopt PROMPT_SUBST
setopt COMPLETE_ALIASES
setopt HIST_IGNORE_DUPS     # Ne mentse az azonos parancsokat
setopt HIST_IGNORE_SPACE    # Ne mentse a szóközökkel kezdődő parancsokat
setopt SHARE_HISTORY        # Megosztja a history-t a shell sessionök között
setopt AUTO_CD              # Automatikus könyvtárváltás
setopt CORRECT              # Parancsok automatikus javítása
setopt EXTENDED_GLOB        # Bővített globbing engedélyezése


# --- Téma betöltése ---
if [ -f /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme ]; then
	source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
fi

# --- Powerlevel10k konfiguráció ---
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# --- Kényelmi opciók ---
setopt AUTO_CD
setopt CORRECT

# --- Pluginok ---
if [ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
	# --- Zsh-autosuggestions testreszabása ---
	ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#999999,underline"  # Javaslatok színe és stílusa
	ZSH_AUTOSUGGEST_STRATEGY=(history completion)           # Javaslatok forrása: history és completion

fi

if [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
	# --- Zsh-syntax-highlighting testreszabása ---
	ZSH_HIGHLIGHT_STYLES[command]='fg=green'
	ZSH_HIGHLIGHT_STYLES[alias]='fg=blue,bold'
fi

if [ -f /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh ]; then
    source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
fi

# --- Hasznos aliasok ---
alias ls='ls --color=auto'  # Színes ls kimenet
alias ll='ls -lah'          # Részletes lista
alias pacman='sudo pacman'  # Pacman gyorsabb használata
alias update='sudo pacman -Syu'  # Rendszerfrissítés
alias vi='nano'             # Nano használata vi helyett (ha nvim nincs telepítve)
alias grep='grep --color=auto'  # Színes grep kimenet

# --- Színek ---
export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
export LESS=-R

# --- Gyorsbillentyűk Zsh funkciókhoz ---
typeset -g -A key

# --- Billentyűkódok definiálása terminfo alapján ---
key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"          # Szabványos balra nyíl
key[Right]="${terminfo[kcuf1]}"         # Szabványos jobbra nyíl
key[Ctrl-Left]="${terminfo[kLFT5]}"     # Gyakori xterm Alt+Balra
key[Ctrl-Right]="${terminfo[kRIT5]}"    # Gyakori xterm Alt+Jobbra
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Ctrl-U]="^U"                        # Valódi Ctrl-U vezérlő karakter
key[Ctrl-K]="^K"                        # Valódi Ctrl-K vezérlő karakter
key[Insert]="${terminfo[kich1]}"
key[Ctrl-Backspace]="^H"                # Gyakori Ctrl+Backspace
key[Ctrl-Delete]="^[[3;5~"              # Gyakori Ctrl+Delete
key[Ctrl-R]="^R"                        # Valódi Ctrl-R vezérlő karakter
key[Ctrl-S]="^S"                        # Valódi Ctrl-S vezérlő karakter
key[Shift-Tab]="${terminfo[kcbt]}"
key[Ctrl-W]="^W"

# --- Billentyűk társítása Zsh funkciókhoz --- 
[[ -n "${key[Home]}" ]]           && bindkey -- "${key[Home]}" beginning-of-line                # Home - A sor elejére ugrás
[[ -n "${key[End]}" ]]            && bindkey -- "${key[End]}" end-of-line                       # End - A sor végére ugrás
[[ -n "${key[Up]}" ]]             && bindkey -- "${key[Up]}" up-line-or-history                 # Fel nyíl - Előzmények között felfelé
[[ -n "${key[Down]}" ]]           && bindkey -- "${key[Down]}" down-line-or-history             # Le nyíl - Előzmények között lefelé
[[ -n "${key[Ctrl-R]}" ]]         && bindkey -- "${key[Ctrl-R]}" history-substring-search-up    # Ctrl-R - Előzmények keresése felfelé
[[ -n "${key[Ctrl-S]}" ]]         && bindkey -- "${key[Ctrl-S]}" history-substring-search-down  # Ctrl-S - Előzmények keresése lefelé
[[ -n "${key[Ctrl-U]}" ]]         && bindkey -- "${key[Ctrl-U]}" beginning-of-buffer-or-history # Ctrl-U - Puffer/előzmények elejére ugrás
[[ -n "${key[Ctrl-K]}" ]]         && bindkey -- "${key[Ctrl-K]}" end-of-buffer-or-history       # Ctrl-K - Puffer/előzmények végére ugrás
[[ -n "${key[Insert]}" ]]         && bindkey -- "${key[Insert]}" overwrite-mode                 # Insert - Felülírás mód váltása
[[ -n "${key[Backspace]}" ]]      && bindkey -- "${key[Backspace]}" backward-delete-char        # Backspace - Előző karakter törlése
[[ -n "${key[Right]}" ]]          && bindkey -- "${key[Right]}" forward-char                    # Jobbra nyíl - Kurzor előre
[[ -n "${key[Left]}" ]]           && bindkey -- "${key[Left]}" backward-char                    # Balra nyíl - Kurzor hátra
[[ -n "${key[Delete]}" ]]         && bindkey -- "${key[Delete]}" delete-char                    # Delete - Kurzor alatti karakter törlése
[[ -n "${key[Shift-Tab]}" ]]      && bindkey -- "${key[Shift-Tab]}" reverse-menu-complete       # Shift-Tab - Fordított tab-kiegészítés
[[ -n "${key[Ctrl-Left]}"  ]]     && bindkey -- "${key[Ctrl-Left]}"  backward-word              # Ctrl-Balra - Szavak közötti visszalépés
[[ -n "${key[Ctrl-Right]}" ]]     && bindkey -- "${key[Ctrl-Right]}" forward-word               # Ctrl-Jobbra - Szavak közötti előrelépés
[[ -n "${key[Ctrl-Backspace]}" ]] && bindkey -- "${key[Ctrl-Backspace]}" backward-kill-word     # Ctrl-Backspace - Előző szó törlése
[[ -n "${key[Ctrl-Delete]}" ]]    && bindkey -- "${key[Ctrl-Delete]}" kill-word                 # Ctrl-Delete - Következő szó törlése
[[ -n "${key[Ctrl-W]}" ]]         && bindkey -- "${key[Ctrl-W]}" kill-whole-line                # Ctrl-W - Teljes sor törlése


# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi
