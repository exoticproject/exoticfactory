import mods.gregtech.recipe.RecipeMap;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.recipes.ICraftingRecipe;


val lv_piston = <gregtech:meta_item_1:172>;
val lv_motor = <gregtech:meta_item_1:127>;
val lv_robot_arm = <gregtech:meta_item_1:187>;
val lv_pump = <gregtech:meta_item_1:142>;
val lv_hull = <gregtech:machine:986>;
val lv_conveyor = <gregtech:meta_item_1:157>;
val circuit_lv = <ore:circuitLv>;
val lv_main_cable_1x = <ore:cableGtSingleTin>;



recipes.remove(<gregtech:machine:1001>);
recipes.remove(<gregtech:meta_item_1:402>);
recipes.remove(<gregtech:metal_casing:2>);
// Good Circuit Board * 1
<recipemap:chemical_reactor>.findRecipe(30, [<metaitem:foilSilver> * 4, <metaitem:board.phenolic>], [<liquid:sodium_persulfate> * 200]).remove();


#LV Pump Recipe
recipes.remove(lv_pump);
parts_assembler_recipe.recipeBuilder()
    .inputs([
        lv_main_cable_1x * 2,
        <ore:ringRubber>*2,
        lv_motor*2,
        <ore:plateSteel>*2,
        <ore:rotorSteel> *1,
        <ore:screwTin>*2,
        <ore:pipeNormalFluidBronze>
    ])
    .outputs(lv_pump)
    .duration(60)
    .EUt(32)
    .buildAndRegister();

#LV Conveyor Recipe
recipes.remove(lv_conveyor);
parts_assembler_recipe.recipeBuilder()
    .inputs([
        lv_main_cable_1x * 2,
        <ore:plateRubber>*6,
        lv_motor*2,
    ])
    .outputs(lv_conveyor)
    .duration(60)
    .EUt(32)
    .buildAndRegister();

#LV M_Assembler Recipe
machine_assembler_recipe.recipeBuilder()
    .inputs([
        lv_hull,
        lv_main_cable_1x * 8,
        circuit_lv*6,
        lv_motor *2,
        lv_piston *2,
        lv_robot_arm*2,
    ])
    .circuit(0)
    .outputs(<gregtech:machine:32003>)
    .duration(600)
    .EUt(32)
    .buildAndRegister();

#LV P_Assembler Recipe
machine_assembler_recipe.recipeBuilder()
    .inputs([
        lv_hull,
        lv_main_cable_1x * 5,
        circuit_lv*2,
        lv_motor *2,
        lv_piston *2,
        <ore:stickLongSteel>*6
    ])
    .circuit(1)
    .outputs(<gregtech:machine:32023>)
    .duration(600)
    .EUt(32)
    .buildAndRegister();

#LV Hull Recipe
// LV Machine Hull * 1
<recipemap:assembler>.findRecipe(16, [<gregtech:machine_casing:1>, <metaitem:cableGtSingleTin> * 2], [<liquid:plastic> * 288]).remove();
recipes.remove(lv_hull);
machine_assembler_recipe.recipeBuilder()
    .inputs([
        <ore:plateDoubleSteel>*8,
        <ore:stickLongSteel>*4,
        lv_main_cable_1x * 2,
        circuit_lv*1
    ])
    .outputs(lv_hull)
    .duration(600)
    .EUt(32)
    .buildAndRegister();

#EBF Recipe
machine_assembler_recipe.recipeBuilder()
    .inputs([
        <gregtech:machine:50>*4,
        <gregtech:metal_casing:2>,
        <ore:cableGtHexTin>*2,
        <ore:circuitMv>*5,
        <ore:gearInvar>*4,
        <ore:plateDoubleInvar>*4,
        <morefurnaces:furnaceblock:2>*8
    ])
    .outputs(<gregtech:machine:1001>)
    .duration(1200)
    .EUt(32)
    .buildAndRegister();

#PreMV : MV Hull
// MV Machine Hull * 1
<recipemap:assembler>.findRecipe(16, [<gregtech:machine_casing:2>, <metaitem:cableGtSingleCopper> * 2], [<liquid:plastic> * 288]).remove();
// MV Machine Hull * 1
<recipemap:assembler>.findRecipe(16, [<gregtech:machine_casing:2>, <metaitem:cableGtSingleAnnealedCopper> * 2], [<liquid:plastic> * 288]).remove();
recipes.removeByRecipeName("gregtech:gregtech.machine.hull.mv");

machine_assembler_recipe.recipeBuilder()
    .inputs([
        <ore:plateDoubleAluminium>*16,
        <ore:plateDoubleSteel>*32,
        <ore:stickLongAluminium>*8,
        <ore:circuitMv>*8,
        <ore:cableGtHexCopper>*2,
        <ore:gearAluminium>*4
    ])
    .outputs(<gregtech:machine:987>)
    .duration(2400)
    .EUt(32)
    .buildAndRegister();


for orename in bug_basic{
    <recipemap:compressor>.recipeBuilder()
        .inputs(oreDict["ore" + orename]*64)
        .outputs(oreDict["oreBox" + orename].firstItem)
        .EUt(32)
        .duration(400)
        .buildAndRegister();
}

