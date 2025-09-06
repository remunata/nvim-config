{
  description = "A Lua-natic's neovim flake, with extra cats! nixCats!";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixCats.url = "github:BirdeeHub/nixCats-nvim";
  };

  outputs =
    {
      nixpkgs,
      nixCats,
      ...
    }@inputs:
    let
      inherit (nixCats) utils;
      luaPath = "${./.}";
      forEachSystem = utils.eachSystem nixpkgs.lib.platforms.all;
      extra_pkg_config = { };
      dependencyOverlays = [ (utils.standardPluginOverlay inputs) ];

      categoryDefinitions =
        {
          pkgs,
          ...
        }:
        {
          # lspsAndRuntimeDeps:
          # this section is for dependencies that should be available
          # at RUN TIME for plugins. Will be available to PATH within neovim terminal
          # this includes LSPs
          lspsAndRuntimeDeps = {
            general = with pkgs; [
              universal-ctags
              ripgrep
              fd
            ];

            server = with pkgs; [
              lua-language-server
              nixd
              nix-doc
              rust-analyzer
              pyright
              clang
              typescript-language-server
              gopls
              jdt-language-server
            ];

            format = with pkgs; [
              stylua
              nixfmt-rfc-style
              isort
              black
              clang-tools
              prettierd
              gofumpt
              google-java-format
            ];
          };

          # This is for plugins that will load at startup without using packadd
          startupPlugins = {
            general = with pkgs.vimPlugins; [
              lze
              lzextras
              plenary-nvim
              nvim-notify
              nvim-web-devicons
              catppuccin-nvim
              vim-sleuth
              vim-fugitive
            ];
          };

          # not loaded automatically at startup
          # use for plugin with lazy loading
          optionalPlugins = {
            general = with pkgs.vimPlugins; [
              neo-tree-nvim
              telescope-nvim
              telescope-fzf-native-nvim
              telescope-ui-select-nvim
              which-key-nvim
              fidget-nvim
              conform-nvim
              gitsigns-nvim
              toggleterm-nvim
              precognition-nvim
              markdown-preview-nvim

              nvim-lspconfig
              lazydev-nvim

              nvim-autopairs
              indent-blankline-nvim
              alpha-nvim
              lualine-nvim
              comment-nvim
              neocord
              trouble-nvim
            ];

            cmp = with pkgs.vimPlugins; [
              nvim-cmp
              luasnip
              friendly-snippets
              cmp_luasnip
              cmp-path
              cmp-nvim-lua
              cmp-nvim-lsp
              cmp-cmdline
              cmp-nvim-lsp-signature-help
              cmp-cmdline-history
              cmp-buffer
              lspkind-nvim
            ];

            treesitter = with pkgs.vimPlugins; [
              (nvim-treesitter.withPlugins (
                plugins: with plugins; [
                  nix
                  lua
                  rust
                  c
                  cpp
                  python
                  javascript
                  typescript
                  markdown
                  yaml
                ]
              ))
            ];
          };
        };

      packageDefinitions = {
        nvim =
          { ... }:
          {
            settings = {
              wrapRc = true;
              aliases = [
                "vi"
                "vim"
              ];
            };

            categories = {
              general = true;
              server = true;
              format = true;
              cmp = true;
              treesitter = true;
            };
          };
      };

      defaultPackageName = "nvim";
    in

    forEachSystem (
      system:
      let
        nixCatsBuilder = utils.baseBuilder luaPath {
          inherit
            nixpkgs
            system
            dependencyOverlays
            extra_pkg_config
            ;
        } categoryDefinitions packageDefinitions;
        defaultPackage = nixCatsBuilder defaultPackageName;
        pkgs = import nixpkgs { inherit system; };
      in
      {
        # these outputs will be wrapped with ${system} by utils.eachSystem

        # this will make a package out of each of the packageDefinitions defined above
        # and set the default package to the one passed in here.
        packages = utils.mkAllWithDefault defaultPackage;

        devShells = {
          default = pkgs.mkShell {
            name = defaultPackageName;
            packages = [ defaultPackage ];
          };
        };

      }
    )
    // (
      let
        nixosModule = utils.mkNixosModules {
          moduleNamespace = [ defaultPackageName ];
          inherit
            defaultPackageName
            dependencyOverlays
            luaPath
            categoryDefinitions
            packageDefinitions
            extra_pkg_config
            nixpkgs
            ;
        };

        homeModule = utils.mkHomeModules {
          moduleNamespace = [ defaultPackageName ];
          inherit
            defaultPackageName
            dependencyOverlays
            luaPath
            categoryDefinitions
            packageDefinitions
            extra_pkg_config
            nixpkgs
            ;
        };
      in
      {

        # these outputs will be NOT wrapped with ${system}

        # this will make an overlay out of each of the packageDefinitions defined above
        # and set the default overlay to the one named here.
        overlays = utils.makeOverlays luaPath {
          inherit nixpkgs dependencyOverlays extra_pkg_config;
        } categoryDefinitions packageDefinitions defaultPackageName;

        nixosModules.default = nixosModule;
        homeModules.default = homeModule;

        inherit utils nixosModule homeModule;
        inherit (utils) templates;
      }
    );

}
