using Accessors, Documenter, Literate

inputdir = joinpath(@__DIR__, "..", "examples")
outputdir = joinpath(@__DIR__, "src", "examples")
mkpath(outputdir)
for filename in readdir(inputdir)
    inpath = joinpath(inputdir, filename)
    Literate.markdown(inpath, outputdir; documenter=true)
end

makedocs(
         modules = [Accessors],
         sitename = "Accessors.jl",
         pages = [
            "Introduction" => "intro.md",
            "Lenses" => "lenses.md",
            "Docstrings" => "index.md",
            "Custom Macros" => "examples/custom_macros.md",
             hide("internals.md"),
            ],
        strict = true,  # to exit with non-zero code on error
        )

deploydocs(
    repo = "github.com/jw3126/Accessors.jl.git",
)
