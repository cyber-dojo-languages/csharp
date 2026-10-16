#!/bin/sh -eu

# Records the C# this image holds, in the shape every image shares. The
# version is the language's, not the SDK's: the SDK's own C# compiler lists
# the language versions it accepts and marks the one it compiles to by
# default, as in "14.0 (default)". So the version is one the image compiles
# to rather than one written down when someone last edited this file.
readonly CSC=$(ls /usr/share/dotnet/sdk/*/Roslyn/bincore/csc.dll)
readonly LANGUAGE_VERSION=$(dotnet "${CSC}" -langversion:? | grep '(default)' | cut -d' ' -f1)

if [ -z "${LANGUAGE_VERSION}" ]; then
  echo 'Could not read a default version from csc -langversion:?' >&2
  exit 1
fi

cat > /versions.json <<EOF
{
  "language": {
    "name": "C#",
    "version": "${LANGUAGE_VERSION}"
  },
  "test_frameworks": []
}
EOF
