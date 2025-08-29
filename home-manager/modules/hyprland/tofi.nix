{ ... }:
{
  programs.tofi = {
    enable = true;
    settings = {
      font = "VT323";
      corner-radius = 0;
      outline-color = "rgb(203, 166, 247)";
      outline-width = 0;
      border-color = "#cba6f7";
      border-width = 1;
      background-color = "#313244E6";
      text-color = "#cdd6f4";
      selection-color = "#cba6f7";
      
      prompt-text = "C:\\> ";
      num-results = 9;
      hide-cursor = true;
      width = 460;
      height = 380;
    };
  };
}

