{ pkgs, ... }:

{
  # https://devenv.sh/packages/
  packages = with pkgs; [
    git
    checkmake
    mdformat
    nixfmt-classic
    powershell
    rubocop
  ];

  # https://devenv.sh/languages/
  languages.c.enable = true;

  # https://devenv.sh/tasks/
  tasks = {
    "lint:run".exec = ''
      checkmake Makefile
      git ls-files --cached --others --exclude-standard '*.c' '*.h' | xargs clang-format -i
      mdformat README.md
      nixfmt devenv.nix
      pwsh -Command "Install-Module -Name PSScriptAnalyzer -Force"
      pwsh -Command "Invoke-ScriptAnalyzer -Path scripts/ps1 -Recurse"
      rubocop -A .'';
  };

  enterTest = ''
    make help
  '';

  # https://devenv.sh/git-hooks/
  git-hooks.hooks = {
    checkmake.enable = true;
    clang-format.enable = true;
    mdformat.enable = true;
    nixfmt-classic.enable = true;
    trim-trailing-whitespace.enable = true;
  };

  # See full reference at https://devenv.sh/reference/options/
}
