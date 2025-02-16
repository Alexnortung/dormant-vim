{ lib, ... }:
{
  imports = [
    ./bufferlines
  ];

  ${lib.name}.bufferlines.enable = lib.mkDefault true;
}
