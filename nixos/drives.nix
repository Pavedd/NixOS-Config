{ ... }:
{
  fileSystems."/mnt/windows" = {
    device = "/dev/disk/by-uuid/1840C30240C2E59A";
    options = [ "uid=1000" "gid=1000" "dmask=007" "fmask=117" ];
    fsType = "nfts";
  }
}
