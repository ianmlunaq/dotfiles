if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_prompt
    string join '' -- (set_color cyan) '󰈺  ' (set_color green --bold) (path basename -- (prompt_pwd)) (set_color normal) ' '
end

function fish_greeting
    [ $outer_color  ]; or set outer_color  'red'
    [ $medium_color ]; or set medium_color 'f70'
    [ $inner_color  ]; or set inner_color  'yellow'
    [ $mouth ]; or set mouth '['
    [ $eye   ]; or set eye   'O'

    set o (set_color $outer_color)
    set m (set_color $medium_color)
    set i (set_color $inner_color)

    echo '                 '$o'___
  ___======____='$m'-'$i'-'$m'-='$o')
/T            \_'$i'--='$m'=='$o')
'$mouth' \ '$m'('$i$eye$m')   '$o'\~    \_'$i'-='$m'='$o')
 \      / )J'$m'~~    '$o'\\'$i'-='$o')
  \\\\___/  )JJ'$m'~'$i'~~   '$o'\)
   \_____/JJJ'$m'~~'$i'~~    '$o'\\
   '$m'/ '$o'\  '$i', \\'$o'J'$m'~~~'$i'~~     '$m'\\
  (-'$i'\)'$o'\='$m'|'$i'\\\\\\'$m'~~'$i'~~       '$m'L_'$i'_
  '$m'('$o'\\'$m'\\)  ('$i'\\'$m'\\\)'$o'_           '$i'\=='$m'__
   '$o'\V    '$m'\\\\'$o'\) =='$m'=_____   '$i'\\\\\\\\'$m'\\\\
          '$o'\V)     \_) '$m'\\\\'$i'\\\\JJ\\'$m'J\)
                      '$o'/'$m'J'$i'\\'$m'J'$o'T\\'$m'JJJ'$o'J)
                      (J'$m'JJ'$o'| \UUU)
                       (UU)'(set_color normal)

    echo \nWelcome to fish, the friendly interactive shell\nType (set_color green)help(set_color normal) for instructions on how to use fish
    echo \nThe time is (set_color yellow; date +%T; set_color normal) and this machine is called $hostname
end

function fish_title
    # emacs' "term" is basically the only term that can't handle it.
  if not set -q INSIDE_EMACS; or string match -vq '*,term:*' -- $INSIDE_EMACS
        # If we're connected via ssh, we print the hostname.
    set -l ssh
        set -q SSH_TTY
        and set ssh "["(prompt_hostname | string sub -l 10 | string collect)"]"
        # An override for the current command is passed as the first parameter.
    # This is used by `fg` to show the true process name, among others.
    if set -q argv[1]
            echo -- $ssh (string sub -l 20 -- $argv[1]) (prompt_pwd -d 1 -D 20)
        else
            # Don't print "fish" because it's redundant
      set -l command (status current-command)
            if test "$command" = fish
                set command
            end
            echo -- $ssh (string sub -l 20 -- $command) (prompt_pwd -d 1 -D 20)
        end
    end
end

#Aliases
alias ls='eza --hyperlink --group-directories-first --icons'
alias ll='eza -lh --hyperlink --group-directories-first --icons'
alias la='eza -lhaa --hyperlink --group-directories-first --icons'
alias nano='nano -lqm'
alias kssh='kitten ssh'
alias a2c='aria2c --conf-path=$HOME/.config/aria2c/aria2.conf'
alias vcs='vcs -C ~/.config/vcs/vcs.conf'
