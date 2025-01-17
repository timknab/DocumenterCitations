module DocumenterCitations
global indexer = 1
global tracker = Dict()
using Documenter
using Documenter.Anchors
using Documenter.Builder
using Documenter.Documents
using Documenter.Selectors
using Documenter.Utilities
using Documenter.Expanders

using Markdown
using Bibliography
using Bibliography: xnames, xyear, xlink, xtitle, xin
using Unicode

export CitationBibliography
struct CitationBibliography <: Documenter.Plugin
    bib::Dict
end



function CitationBibliography(filename::AbstractString="")
    # global indexer = 1
    filename == "" && return CitationBibliography(Dict())
    bf = import_bibtex(filename)
    return CitationBibliography(bf)
end

struct Example end

include("citations.jl")
include("bibliography.jl")

end
