{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.local.python;
in
{
  options.local.python = {
    extraPackages = lib.mkOption {
      type = lib.types.functionTo (lib.types.listOf lib.types.package);
      default = [ ];
      example = "python-pkgs: with python-pkgs; [ matplotlib numpy pandas ]";
      description = "Extra Python packages";
    };
  };

  config = {
    environment.systemPackages = [
      (pkgs.python313.withPackages (python-pkgs: [ python-pkgs.pip ] ++ cfg.extraPackages python-pkgs))
    ];
  };
}
