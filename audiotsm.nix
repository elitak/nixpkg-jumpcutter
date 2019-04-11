{ lib, buildPythonPackage, fetchPypi
, numpy, sounddevice, pytest, coverage }:

buildPythonPackage rec {
  pname = "audiotsm";
  version = "0.1.2";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1082dk7dw831n4z2j5jlmp8xasmcgrgbbcib3nn6r9yhz8layw48";
  };

  propagatedBuildInputs = [ numpy sounddevice pytest coverage ];

  doCheck = false; # tests need pytest-coverage!
}
