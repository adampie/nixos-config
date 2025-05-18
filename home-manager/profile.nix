args: let
  file =
    if args.profile == "personal"
    then ./personal.nix
    else if args.profile == "work"
    then ./work.nix
    else throw "Unknown profile: ${args.profile}";
in
  import file args
