{...}: {
  home.file.".local/bin/rustrover" = {
    text = ''
      #!/bin/sh
      open -na "RustRover.app" --args "$@"
    '';
    executable = true;
  };
}
