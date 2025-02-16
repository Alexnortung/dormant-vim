{ lib, ... }:
{
  imports = [
    ./extra
  ];

  ${lib.name}.coding.extra.enable = lib.mkDefault true;
}
