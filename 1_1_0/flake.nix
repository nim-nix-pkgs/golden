{
  description = ''a benchmark tool'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-golden-1_1_0.flake = false;
  inputs.src-golden-1_1_0.owner = "disruptek";
  inputs.src-golden-1_1_0.ref   = "refs/tags/1.1.0";
  inputs.src-golden-1_1_0.repo  = "golden";
  inputs.src-golden-1_1_0.type  = "github";
  
  inputs."cligen".owner = "nim-nix-pkgs";
  inputs."cligen".ref   = "master";
  inputs."cligen".repo  = "cligen";
  inputs."cligen".type  = "github";
  inputs."cligen".inputs.nixpkgs.follows = "nixpkgs";
  inputs."cligen".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."foreach".owner = "nim-nix-pkgs";
  inputs."foreach".ref   = "master";
  inputs."foreach".repo  = "foreach";
  inputs."foreach".type  = "github";
  inputs."foreach".inputs.nixpkgs.follows = "nixpkgs";
  inputs."foreach".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-golden-1_1_0"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-golden-1_1_0";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}