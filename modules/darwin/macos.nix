{...}: {
  # Security
  security.pam.enableSudoTouchIdAuth = true;
  system.defaults.SoftwareUpdate.AutomaticallyInstallMacOSUpdates = true;

  # Dock
  system.defaults.dock.autohide = true;
  system.defaults.dock.autohide-time-modifier = 0.4;
  system.defaults.dock.show-recents = false;
  system.defaults.dock.tilesize = 30;

  # Finder
  system.defaults.NSGlobalDomain.AppleShowAllExtensions = true;
  system.defaults.NSGlobalDomain.AppleShowAllFiles = true;
  system.defaults.finder.FXDefaultSearchScope = "SCcf";
  system.defaults.finder.FXRemoveOldTrashItems = true;
  system.defaults.NSGlobalDomain.NSDocumentSaveNewDocumentsToCloud = false;

  # Mission Control
  system.defaults.WindowManager.EnableStandardClickToShowDesktop = false;
  system.defaults.dock.mru-spaces = false;

  # Trackpad
  system.defaults.trackpad.Clicking = true;
  system.defaults.NSGlobalDomain."com.apple.swipescrolldirection" = false;
  system.defaults.NSGlobalDomain."com.apple.mouse.tapBehavior" = 1;

  # Windows
  system.defaults.WindowManager.EnableTiledWindowMargins = false;

  # System
  system.stateVersion = 5;
  fonts.packages = [];
}
