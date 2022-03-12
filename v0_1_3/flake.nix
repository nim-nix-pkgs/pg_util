{
  description = ''Postgres utility functions'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-pg_util-v0_1_3.flake = false;
  inputs.src-pg_util-v0_1_3.owner = "hiteshjasani";
  inputs.src-pg_util-v0_1_3.ref   = "refs/tags/v0.1.3";
  inputs.src-pg_util-v0_1_3.repo  = "nim-pg-util";
  inputs.src-pg_util-v0_1_3.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-pg_util-v0_1_3"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-pg_util-v0_1_3";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}