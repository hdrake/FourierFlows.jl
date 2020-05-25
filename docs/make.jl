using
  Documenter,
  FourierFlows

format = Documenter.HTML(
  collapselevel = 2,
     prettyurls = get(ENV, "CI", nothing) == "true",
      canonical = "https://fourierflows.github.io/FourierFlowsDocumentation/dev/"
)

makedocs(
    modules = [FourierFlows],
    doctest = false,
      clean = true,
   checkdocs = :all,
     format = format,
    authors = "Gregory L. Wagner and Navid C. Constantinou",
   sitename = "FourierFlows.jl",
  
      pages = Any[
              "Home" => "index.md",
              "Code Basics" => "basics.md",
              "Forcing" => "forcing.md",
              "DocStrings" => Any[
                  "man/types.md",
                  "man/functions.md"]
                 ]
)

withenv("GITHUB_REPOSITORY" => "FourierFlows/FourierFlowsDocumentation") do
  deploydocs(        repo = "github.com/FourierFlows/FourierFlowsDocumentation.git",
                 versions = ["stable" => "v^", "v#.#.#"],
             push_preview = true,
  )
end
