{ buildPythonPackage , fetchPypi
, cffi , numpy , portaudio
}:

buildPythonPackage rec {
  pname = "sounddevice";
  version = "0.3.13";

  src = fetchPypi {
    inherit pname version;
    sha256 = "01x2hm3xxzhxrjcj21si4ggmvkwmy5hag7f6yabqlhwskws721cd";
  };

  propagatedBuildInputs = [ cffi numpy portaudio ];

  # No tests included nor upstream available.
  doCheck = false;
}
