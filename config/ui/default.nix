{ lib, ... }:
{
  imports = [
    ./bufferlines
    ./dashboards
  ];

  ${lib.name} = {
    dashboards.enable = lib.mkDefault true;
    bufferlines.enable = lib.mkDefault true;
  };
}
