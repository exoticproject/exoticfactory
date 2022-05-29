#priority 9800
import mods.gregtech.recipe.Utils;
import mods.gregtech.ore.IOreRecipeHandler;
import mods.gregtech.ore.OrePrefix;
import mods.gregtech.material.Material;
import crafttweaker.oredict.IOreDict;

val bug = OrePrefix.getPrefix("bug");
bug.generateRecipes(function(orePrefix as OrePrefix, material as Material) {
    oreDict["anyBug"].add(Utils.item(orePrefix,material));
} as IOreRecipeHandler);

val bugdata = OrePrefix.getPrefix("bugData");
bugdata.generateRecipes(function(orePrefix as OrePrefix, material as Material) {
    oreDict["anyBugData"].add(Utils.item(orePrefix,material));
} as IOreRecipeHandler);

val orebox = OrePrefix.getPrefix("oreBox");
orebox.generateRecipes(function(orePrefix as OrePrefix, material as Material) {
    oreDict["anyOreBox"].add(Utils.item(orePrefix,material));
} as IOreRecipeHandler);


val virtualore = OrePrefix.getPrefix("virtualore");
virtualore.generateRecipes(function(orePrefix as OrePrefix, material as Material) {
    <recipemap:macerator>.recipeBuilder()
        .inputs(Utils.item(orePrefix, material))
        .outputs(Utils.item("crushed", material)*4)
        .chancedOutput(Utils.item("crushed", material)*2, 4000, 200)
        .chancedOutput(Utils.item("crushed", material)*4, 2500, 200)
        .chancedOutput(Utils.item("crushed", material)*6, 1500, 200)
        .EUt(2)
        .duration(400)
        .buildAndRegister();
    oreDict["anyVirtualOre"].add(Utils.item(orePrefix,material));
} as IOreRecipeHandler);