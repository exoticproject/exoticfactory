import mods.gregtech.recipe.RecipeMap;

val lv_piston = <gregtech:meta_item_1:172>;
val lv_motor = <gregtech:meta_item_1:127>;
val lv_robot_arm = <gregtech:meta_item_1:187>;
val lv_hull = <gregtech:machine:986>;
val circuit_lv = <ore:circuitLv>;
val lv_main_cable_1x = <ore:cableGtSingleTin>;

recipes.addShapeless(<ore:dustThermite>.firstItem * 3,[<ore:dustAluminium>,<ore:dustIron>,<ore:dustIron>,<ore:dustCoal>]);

recipes.addShaped(<gregtech:machine:32021>,[
    [<ore:gearSteel>,<ore:gearSteel>,<ore:gearSteel>],
    [<ore:stickLongSteel>,<gregtech:steam_casing:2>,<ore:stickLongSteel>],
    [<ore:pipeHugeFluidSteel>,<ore:gearInvar>,<ore:pipeHugeFluidSteel>]
]);

recipes.addShaped(<gregtech:machine:32001>,[
    [<gregtech:meta_item_1:187>,circuit_lv,<gregtech:meta_item_1:187>],
    [lv_motor,<gregtech:steam_casing:2>,<ore:rotorSteel>],
    [<ore:pipeHugeFluidSteel>,circuit_lv,<ore:pipeHugeFluidSteel>]
]);

recipes.remove(<gregtech:machine:950>);
machine_assembler_recipe.recipeBuilder()
    .inputs([
        lv_hull,
        lv_main_cable_1x * 4,
        circuit_lv*2,
        lv_motor *2,
        <ore:rotorSteel> *2,
        <ore:pipeNormalFluidSteel>*3
    ])
    .outputs(<gregtech:machine:950>)
    .duration(600)
    .EUt(32)
    .buildAndRegister();

// LV Electric Motor * 1
<recipemap:assembler>.findRecipe(30, [<metaitem:cableGtSingleTin> * 2, <metaitem:stickIron> * 2, <metaitem:stickIronMagnetic>, <metaitem:wireGtSingleCopper> * 4], null).remove();
// LV Electric Motor * 1
<recipemap:assembler>.findRecipe(30, [<metaitem:cableGtSingleTin> * 2, <metaitem:stickSteel> * 2, <metaitem:stickSteelMagnetic>, <metaitem:wireGtSingleCopper> * 4], null).remove();
recipes.remove(lv_motor);

#LV Motor Recipe
parts_assembler_recipe.recipeBuilder()
    .inputs([
        lv_main_cable_1x * 2,
        <ore:wireGtSingleCopper>*4,
        <ore:stickSteelMagnetic>,
        <ore:stickSteel>*2,
        <ore:plateSteel>
    ])
    .outputs(lv_motor)
    .duration(60)
    .EUt(32)
    .buildAndRegister();


<recipemap:assembler>.findRecipe(30, [<metaitem:stickSteel> * 2, <metaitem:cableGtSingleTin> * 2, <metaitem:plateSteel> * 3, <metaitem:gearSmallSteel>, <metaitem:electric.motor.lv>], null).remove();
recipes.remove(lv_piston);

#LV Piston Recipe
parts_assembler_recipe.recipeBuilder()
    .inputs([
        lv_main_cable_1x * 2,
        lv_motor,
        <ore:gearSmallSteel>,
        <ore:stickSteel>*3,
        <ore:plateDoubleSteel>*2
    ])
    .outputs(lv_piston)
    .duration(60)
    .EUt(32)
    .buildAndRegister();

// LV Robot Arm * 1
<recipemap:assembler>.findRecipe(30, [<metaitem:cableGtSingleTin> * 3, <metaitem:stickSteel> * 2, <metaitem:electric.motor.lv> * 2, <metaitem:electric.piston.lv>, <metaitem:circuit.electronic>], null).remove();
recipes.remove(lv_robot_arm);

#LV Robot Arm Recipe
parts_assembler_recipe.recipeBuilder()
    .inputs([
        lv_main_cable_1x * 6,
        lv_motor*3,
        lv_piston*2,
        circuit_lv*2,
        <ore:gearSmallSteel>*2,
        <ore:stickLongSteel>*2,
        <ore:plateDoubleSteel>*2
    ])
    .outputs(lv_robot_arm)
    .duration(60)
    .EUt(32)
    .buildAndRegister();
