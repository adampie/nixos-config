{...}: {
  # Nix settings
  nix.settings = {
    experimental-features = ["flakes" "nix-command"];
  };

  # Enable Touch ID for sudo
  security.pam.enableSudoTouchIdAuth = true;

  # macOS system defaults and activation scripts
  system = {
    defaults = {
      NSGlobalDomain = {
        "com.apple.mouse.tapBehavior" = 1;
        "com.apple.swipescrolldirection" = false;
        AppleShowAllFiles = true;
        NSAutomaticCapitalizationEnabled = false;
        NSAutomaticDashSubstitutionEnabled = false;
        NSAutomaticInlinePredictionEnabled = false;
        NSAutomaticPeriodSubstitutionEnabled = false;
        NSAutomaticQuoteSubstitutionEnabled = false;
        NSAutomaticSpellingCorrectionEnabled = false;
        NSDocumentSaveNewDocumentsToCloud = false;
        NSNavPanelExpandedStateForSaveMode = true;
        NSNavPanelExpandedStateForSaveMode2 = true;
      };
      SoftwareUpdate = {
        AutomaticallyInstallMacOSUpdates = true;
      };
      CustomUserPreferences = {
        "com.apple.AdLib" = {allowApplePersonalizedAdvertising = false;};
        "com.apple.AppleIntelligenceReport" = {reportDuration = 0;};
        "com.apple.desktopservices" = {
          DSDontWriteNetworkStores = true;
          DSDontWriteUSBStores = true;
        };
      };
      dock = {
        autohide = true;
        autohide-time-modifier = 0.4;
        mru-spaces = false;
        show-recents = false;
        tilesize = 30;
        wvous-bl-corner = 1;
        wvous-br-corner = 1;
        wvous-tl-corner = 1;
        wvous-tr-corner = 1;
      };
      finder = {
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
        FXDefaultSearchScope = "SCcf";
        FXEnableExtensionChangeWarning = false;
        FXPreferredViewStyle = "Nlsv";
        FXRemoveOldTrashItems = true;
        NewWindowTarget = "Home";
        QuitMenuItem = true;
        ShowPathbar = true;
      };
      menuExtraClock = {ShowSeconds = true;};
      screensaver = {
        askForPassword = true;
        askForPasswordDelay = 0;
      };
      trackpad = {Clicking = true;};
      WindowManager = {
        EnableStandardClickToShowDesktop = false;
        EnableTiledWindowMargins = false;
      };
    };
    activationScripts.postUserActivation.text = ''
      sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on
      sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setallowsigned on
      sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setallowsignedapp on
      sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setstealthmode on
    '';
    stateVersion = 5;
  };
}
