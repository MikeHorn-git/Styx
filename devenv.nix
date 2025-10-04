{ pkgs, ... }:

{
  # https://devenv.sh/packages/
  packages = with pkgs; [
    git
    mdformat
    nixfmt-classic
    powershell
    rubyPackages_3_4.rubocop
    vagrant
  ];

  # https://devenv.sh/languages/
  languages.c.enable = true;
  languages.ruby.enable = true;

  # https://devenv.sh/scripts/
  scripts = {
    lint.exec = ''
      git ls-files --cached --others --exclude-standard '*.c' '*.h' | xargs clang-format -i
      mdformat README.md
      nixfmt devenv.nix
      pwsh -Command "Install-Module -Name PSScriptAnalyzer -Force"
      pwsh -Command "Invoke-ScriptAnalyzer -Path scripts/ps1 -Recurse"
      rubocop -A Vagrantfile'';
    reqs.exec = "vagrant install vagrant-reload";
  };

  # https://devenv.sh/basics/
  enterShell = ''
    echo "Available commands:"
    echo " - lint         : Lint the all the repository"
    echo " - reqs         : Install vagrant plugins"
  '';

  enterTest = ''
    vagrant --help
  '';

  # https://devenv.sh/git-hooks/
  git-hooks.hooks = {
    clang-format.enable = true;
    mdformat.enable = true;
    nixfmt-classic.enable = true;
    trim-trailing-whitespace.enable = true;
  };

  # See full reference at https://devenv.sh/reference/options/
}
