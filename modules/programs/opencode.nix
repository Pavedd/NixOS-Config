{
  flake.homeModules.opencode = {pkgs, config, ... }: {
    programs.opencode = {
      enable = true;
      settings = 
{
  model = "ollamaRemote/gpt-oss:20b";    # remote Ollama model on your LAN
  provider = {
    astolfo = {
      npm = "@ai-sdk/openai-compatible";
      name = "astolfo desktop provider";
      options = {
        baseURL = "http://192.168.178.38:11434/v1";
      };
      models = {
        "gpt-oss:20b" = {
          name = "gpt oss 20b";
          options = {
          };
        };
        "deepseek-coder-v2:16b" = {
          name = "deepseek coder 16b";
          options = {
          };
        };
 
      };
    };
  };

  # Web capabilities
  tools = {
    webfetch = true;   # allow fetching content from URLs
    websearch = true;  # allow performing web searches
  };

  # AI behavior options
  autoshare = false;        # keep prompts private
  autoupdate = true;        # update OpenCode automatically

      };

    };
  };
}
