{ mkDerivation
, callPackage
, fetchFromGitHub
, stdenv
, cabal-install
, base
, classy-prelude
, directory
, string-conversions
, warp
, wai
, mtl
, blaze-markup
, wai-extra
, http-types
, blaze-html
, inflections
, text
, postgresql-simple
, wai-middleware-static
, wai-util
, http-client
, aeson
, uuid
, wai-session
, wai-session-clientsession
, clientsession
, pwstore-fast
, template-haskell
, haskell-src-meta
, random-strings
, interpolate
, uri-encode
, websockets
, wai-websockets
, mime-mail
, mime-mail-ses
, tz
, attoparsec
, case-insensitive
, haskell-src-exts
, containers
, http-media
, cookie
, process
, newtype-generics
, unix
, fsnotify
, countable-inflections
, typerep-map
, basic-prelude
}:
mkDerivation {
  pname = "turbohaskell";
  version = "1.0.28";
  src = (import <nixpkgs> {}).nix-gitignore.gitignoreSource [] ./.;
  isLibrary = true;
  isExecutable = true;
  allowInconsistentDependencies = true;
  libraryHaskellDepends = [
    cabal-install
    base
    classy-prelude
    directory
    string-conversions
    warp
    wai
    mtl
    blaze-html
    blaze-markup
    wai-extra
    http-types
    inflections
    text
    postgresql-simple
    wai-middleware-static
    wai-util
    http-client
    aeson
    uuid
    wai-session
    wai-session-clientsession
    clientsession
    pwstore-fast
    template-haskell
    haskell-src-meta
    random-strings
    interpolate
    uri-encode
    websockets
    wai-websockets
    mime-mail
    mime-mail-ses
    tz
    attoparsec
    case-insensitive
    haskell-src-exts
    containers
    http-media
    cookie
    process
    newtype-generics
    unix
    fsnotify
    countable-inflections
    typerep-map
    basic-prelude
  ];
  license = stdenv.lib.licenses.bsd3;
  postInstall = ''
    cp TurboHaskell/CLI/run-task $out/bin/run-task
    cp Makefile.dist $out
  '';
}
