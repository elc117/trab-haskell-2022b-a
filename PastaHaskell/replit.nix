{ pkgs }: {
    deps = [
        pkgs.ihaskell
        (pkgs.haskellPackages.ghcWithPackages (pkgs: with pkgs; [
           random-source random
        ]))
        pkgs.haskell-language-server
    ];
}