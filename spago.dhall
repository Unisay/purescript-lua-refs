{ name = "purescript-lua-refs"
, dependencies = [ "effect", "prelude" ] 
, packages = ./packages.dhall
, sources = [ "src/**/*.purs" ]
, backend =
    ''
    pslua \
    --foreign-path . \
    --ps-output output \
    --lua-output-file dist/Effect_Ref.lua \
    --entry Effect.Ref
    ''
}
