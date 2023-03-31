rule("typst")
    set_extensions(".typ")

    on_buildcmd_file(function (target, batchcmds, sourcefile, opt)
        import("lib.detect.find_tool")
        local typst = assert(find_tool("typst"), "typst not found")

        local outputdir = "build"
        local pdf_file = path.join(outputdir, path.basename(sourcefile) .. ".pdf")
        target:add("cleanfiles", pdf_file)
        batchcmds:show_progress(opt.progress, "${color.build.object}compiling.typst %s", sourcefile)
        batchcmds:mkdir(outputdir)
        -- typst to pdf
        local args = {path(sourcefile), path(pdf_file)}
        batchcmds:vrunv(typst.program, args)
        -- add deps
        batchcmds:add_depfiles(sourcefile)
        local dependfile = target:dependfile(pdf_file)
        batchcmds:set_depmtime(os.mtime(dependfile))
        batchcmds:set_depcache(dependfile)
    end)
rule_end()

target("resume")
    set_kind("object")
    add_rules("typst")
    add_files("src/*.typ")
