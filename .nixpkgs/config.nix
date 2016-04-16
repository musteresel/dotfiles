{
  packageOverrides = pkgs_ : with _pkgs; {
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
