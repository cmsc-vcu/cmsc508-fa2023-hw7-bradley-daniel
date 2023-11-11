{
  description = "Python enviroment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
  }: let
    system = "aarch64-darwin";
    pkgs = nixpkgs.legacyPackages.${system};
    pythonEnv = pkgs.python311.withPackages (ps:
      with ps; [
        python-dotenv
        jupyter
        matplotlib
        plotly
        tabulate
        markdown
        mysql-connector
        numpy
        pandas
        sqlalchemy
        pymysql

        # Python Enviroment
        flake8
        black
      ]);
  in {
    devShells.${system}.default = pkgs.mkShell {
      buildInputs = [
        pythonEnv
        pkgs.mysql
        pkgs.sqls

        # python lsp
        pkgs.nodePackages.pyright
      ];
      shellHook = ''
        # Exports the sql server url to enviroments variable to be used by vim dbui
        export $(cat .env | xargs)
      '';
    };
  };
}
