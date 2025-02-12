{ ... }:
{
  programs.tofi = {
    enable = true;
    settings = {
      font = "VT323";
      corner-radius = 60;
      outline-color = "rgb(20, 20, 14)";
      outline-width = 3;
      border-color = "#E3E1C9";
      border-width = 60;
      background-color = "#000000";
      text-color = "#0A3";
      selection-color = "#0F6";
      prompt-text = "C:\\> ";
      num-results = 9;
      hide-cursor = true;
      width = 640;
      height = 480;
    };
  };
}

