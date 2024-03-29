{
  description = ''a benchmark tool'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-golden-3_0_0.flake = false;
  inputs.src-golden-3_0_0.ref   = "refs/tags/3.0.0";
  inputs.src-golden-3_0_0.owner = "disruptek";
  inputs.src-golden-3_0_0.repo  = "golden";
  inputs.src-golden-3_0_0.type  = "github";
  
  inputs."foreach".owner = "nim-nix-pkgs";
  inputs."foreach".ref   = "master";
  inputs."foreach".repo  = "foreach";
  inputs."foreach".dir   = "1_0_2";
  inputs."foreach".type  = "github";
  inputs."foreach".inputs.nixpkgs.follows = "nixpkgs";
  inputs."foreach".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."nimetry".owner = "nim-nix-pkgs";
  inputs."nimetry".ref   = "master";
  inputs."nimetry".repo  = "nimetry";
  inputs."nimetry".dir   = "";
  inputs."nimetry".type  = "github";
  inputs."nimetry".inputs.nixpkgs.follows = "nixpkgs";
  inputs."nimetry".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."msgpack4nim".owner = "nim-nix-pkgs";
  inputs."msgpack4nim".ref   = "master";
  inputs."msgpack4nim".repo  = "msgpack4nim";
  inputs."msgpack4nim".dir   = "v0_2_9";
  inputs."msgpack4nim".type  = "github";
  inputs."msgpack4nim".inputs.nixpkgs.follows = "nixpkgs";
  inputs."msgpack4nim".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."terminaltables".owner = "nim-nix-pkgs";
  inputs."terminaltables".ref   = "master";
  inputs."terminaltables".repo  = "terminaltables";
  inputs."terminaltables".dir   = "master";
  inputs."terminaltables".type  = "github";
  inputs."terminaltables".inputs.nixpkgs.follows = "nixpkgs";
  inputs."terminaltables".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."nimgit2".owner = "nim-nix-pkgs";
  inputs."nimgit2".ref   = "master";
  inputs."nimgit2".repo  = "nimgit2";
  inputs."nimgit2".dir   = "v0_1_0";
  inputs."nimgit2".type  = "github";
  inputs."nimgit2".inputs.nixpkgs.follows = "nixpkgs";
  inputs."nimgit2".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."lmdb".owner = "nim-nix-pkgs";
  inputs."lmdb".ref   = "master";
  inputs."lmdb".repo  = "lmdb";
  inputs."lmdb".dir   = "0_1_2";
  inputs."lmdb".type  = "github";
  inputs."lmdb".inputs.nixpkgs.follows = "nixpkgs";
  inputs."lmdb".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."cligen".owner = "nim-nix-pkgs";
  inputs."cligen".ref   = "master";
  inputs."cligen".repo  = "cligen";
  inputs."cligen".dir   = "v1_5_32";
  inputs."cligen".type  = "github";
  inputs."cligen".inputs.nixpkgs.follows = "nixpkgs";
  inputs."cligen".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-golden-3_0_0"];
    over = if builtins.pathExists ./override.nix 
           then { override = import ./override.nix; }
           else { };
  in lib.mkRefOutput (over // {
    inherit self nixpkgs ;
    src  = deps."src-golden-3_0_0";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  } );
}