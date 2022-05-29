#priority 10000
#loader gregtech

import mods.gregtech.material.MaterialBuilder;
import mods.gregtech.material.Material;
import mods.gregtech.ore.OrePrefix;
import mods.gregtech.material.IMaterialPredicate;
import mods.gregtech.material.Elements;
import mods.gregtech.material.MaterialRegistry;

val bug as OrePrefix = OrePrefix.registerOrePrefix("bug", 1);
bug.setGenerationPredicate(function(mat as Material) as bool {
    return mat.hasOre();
} as IMaterialPredicate);
bug.createMaterialItem();

val virtualore as OrePrefix = OrePrefix.registerOrePrefix("virtualore", 1);
virtualore.setGenerationPredicate(function(mat as Material) as bool {
    return mat.hasOre();
} as IMaterialPredicate);
virtualore.createMaterialItem();

val bugdata as OrePrefix = OrePrefix.registerOrePrefix("bugData", 1);
bugdata.setGenerationPredicate(function(mat as Material) as bool {
    return mat.hasOre();
} as IMaterialPredicate);
bugdata.createMaterialItem();

val orebox as OrePrefix = OrePrefix.registerOrePrefix("oreBox", 1);
orebox.setGenerationPredicate(function(mat as Material) as bool {
    return mat.hasOre();
} as IMaterialPredicate);
orebox.createMaterialItem();

var exo_elemental = MaterialBuilder(32006, "exo_elemental").element("Exo").build();

var thermite = MaterialBuilder(32000, "thermite")
    .color(0x9C2700)
    .iconSet("dull")
    .dust(1,16000)
    .build();

var bns1 = MaterialBuilder(32001, "bnsone")
    .color(0x083800)
    .iconSet("dull")
    .fluid("fluid",false)
    .build();

var matter = MaterialBuilder(32010, "bugmatter")
    .color(0xEF61FF)
    .iconSet("dull")
    .fluid("fluid",false)
    .build();

var exonium = MaterialBuilder(32100, "exonium")
    .color(0x00F2FF)
    .iconSet("dull")
    .dust()
    .ingot()
    .fluid("fluid",false)
    .flags([
        "no_smelting"
    ])
    .ore(1,1,true)
    .build();
exonium.setFormula("Ex");

var exosteel = MaterialBuilder(32101, "exosteel")
    .color(0x003336)
    .iconSet("shiny")
    .ingot()
    .fluid("fluid",false)
    .flags([
        "generate_plate",
        "generate_rod",
        "generate_frame",
        "generate_gear",
        "generate_foil",
        "generate_dense",
        "no_smelting"
    ])
    .build();
exosteel.setFormula("ExFe");



