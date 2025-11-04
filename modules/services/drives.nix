{
flake.nixosModules.drives = { ... }: {
  fileSystems."/mnt/windows" = {
    device = "/dev/disk/by-uuid/1840C30240C2E59A";
    options = [ "rw" "uid=1000" "gid=100" "dmask=007" "fmask=117" ];
    fsType = "ntfs-3g";
  };

};
}
