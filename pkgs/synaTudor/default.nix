# Thanks to MrQubo for a great reference:
# https://gist.github.com/MrQubo/b27c4f52afd6d727d523aa95c0b71580
{
  stdenv,
  lib,
  fetchurl,
  fetchFromGitHub,
  pkg-config,
  meson,
  ninja,
  openssl,
  libusb1,
  libcap,
  libseccomp,
  glib,
  dbus,
  libfprint-tod,
  gusb,
  innoextract,
  gccForLibs,
}:

let
  installer = fetchurl {
    url = "https://download.lenovo.com/pccbbs/mobiles/r19fp02w.exe";
    hash = "sha256-CfBurJRksBhsGxyN7Xlppik3Lh14nPxsi9d3xydbaY8=";
  };
in
stdenv.mkDerivation {
  name = "libfprint-2-tod1-synatudor";

  src = fetchFromGitHub {
    owner = "Popax21";
    repo = "synaTudor";
    rev = "31dfdb06107fd1c35c9f9ceae72617e98eccc43a";
    hash = "sha256-/Uh9O2NahVcFg+lk5DkodECOTIyZZwcPs7OKOepagoQ=";
  };

  preConfigure = ''
    # INSTALL_DIR has a hardcoded reference to /sbin
    substituteInPlace meson.build \
      --replace-fail '/sbin' '${placeholder "out"}/bin'

    # Hardcoded runtime path in sandbox C source
    substituteInPlace tudor-host/src/sandbox.c \
      --replace-fail '/sbin/tudor' '${placeholder "out"}/bin/tudor'

    substituteInPlace libtudor/download_driver.sh \
      --replace-fail 'wget https://download.lenovo.com/pccbbs/mobiles/r19fp02w.exe -O "$INSTALLER"'$'\n' 'cp ${installer} "$INSTALLER"'$'\n'
    # We already checked the hash. No need to add perl as dependency.
    sed -i '/shasum "$INSTALLER"/d' libtudor/download_driver.sh

    rm -r cli/
    sed -i '/cli/d' meson.build
  '';

  doCheck = true;
  enableParallelBuilding = false;

  nativeBuildInputs = [
    pkg-config
    meson
    ninja
    innoextract
  ];

  buildInputs = [
    openssl
    libusb1
    libcap
    libseccomp
    glib
    dbus
    libfprint-tod
    gusb
    gccForLibs.libgcc
  ];

  dontUseCmakeConfigure = true;

  env.NIX_CFLAGS_COMPILE = "-I${glib.dev}/include/gio-unix-2.0 -I${libfprint-tod}/include/libfprint-2";

  installPhase = ''
    runHook preInstall

    install -D tudor-host-launcher/tudor_host_launcher                         -t $out/bin/tudor
    install -D tudor-host/tudor_host                                           -t $out/bin/tudor
    install -D libtudor/libtudor.so                                            -t $out/lib
    install -D libfprint-tod/libtudor_tod.so                                   -t $out/lib/libfprint-2/tod-1

    mkdir -p $out/lib/systemd/system
    substitute $src/tudor-host-launcher/tudor-host-launcher.service \
      $out/lib/systemd/system/tudor-host-launcher.service \
      --replace-fail '/sbin/tudor' '${placeholder "out"}/bin/tudor'
    install -D $src/libfprint-tod/60-tudor-libfprint-tod.rules                 -t $out/lib/udev/rules.d
    install -D tudor-host-launcher/net.reactivated.TudorHostLauncher.service   -t $out/share/dbus-1/system-services
    install -D $src/tudor-host-launcher/net.reactivated.TudorHostLauncher.conf -t $out/share/dbus-1/system.d

    runHook postInstall
  '';

  passthru.driverPath = "/lib/libfprint-2/tod-1";

  meta = with lib; {
    description = "Synaptics Tudor fingerprint sensor driver relinking for Linux";
    homepage = "https://github.com/Popax21/synaTudor";
    license = licenses.lgpl21Only;
    platforms = platforms.linux;
  };
}
