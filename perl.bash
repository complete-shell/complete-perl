# shellcheck shell=bash disable=2034

number() {
  hint 'Enter a number'
}

debugger() {
  hint 'Enter a debugger module'
}

program() {
  hint 'Enter a program'
}

pattern() {
  hint 'Enter a pattern'
}

extension() {
  hint 'Enter an extension'
}

module() {
  modules=$COMPLETE_SHELL_CACHE/perl-modules

  [[ -f $modules ]] || {
    hint "Can't find CPAN modules cache file: '$modules'."
    hint "Try 'complete-shell install perl'."
    return 0
  }

  local fzf_options=(
    '--layout=reverse'
    '--multi'
    '--height=0'
    '--color=bw'
    '--bind=space:toggle-down,ctrl-space:up+toggle,del:deselect-all+top'
  )

  (echo; cat "$modules") | complete-shell-pager
}
