{
  allowUnfree = true;
  chromium = {
    enablePepperFlash = true;
    enablePepperPDF = true;
  };

  packageOverrides = pkgs_ : with pkgs_; {
    desktop = with pkgs; buildEnv {
      name = "desktop";
      paths = [
        herbstluftwm
	dzen2
	dmenu
	bash
      ];
    };
  };
}
