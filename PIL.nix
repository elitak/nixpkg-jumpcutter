{ buildPythonPackage, fetchurl }:
buildPythonPackage rec {
  pname = "PIL";
  version = "1.1.7";

  src = fetchurl {
    url = "http://effbot.org/downloads/Imaging-${version}.tar.gz";
    sha256 = "04aj80jhfbmxqzvmq40zfi4z3cw6vi01m3wkk6diz3lc971cfnw9";
  };
}
