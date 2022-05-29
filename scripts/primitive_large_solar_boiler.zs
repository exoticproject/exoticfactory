#loader multiblocked

import mods.multiblocked.MBDRegistry;
import mods.multiblocked.definition.ControllerDefinition;
import mods.multiblocked.definition.ComponentDefinition;
import mods.multiblocked.tile.Controller;
import mods.multiblocked.recipe.RecipeMap;
import mods.multiblocked.functions.ISetupRecipe;
import mods.multiblocked.recipe.RecipeLogic;
import mods.multiblocked.recipe.Recipe;
import crafttweaker.item.IItemStack;
import crafttweaker.block.IBlock;
import crafttweaker.world.IBlockPos;
import crafttweaker.world.IFacing;
import crafttweaker.text.ITextComponent;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.data.IData;

var definition as ComponentDefinition = MBDRegistry.getDefinition("exoticfactory:primitive_large_solar_boiler");
var boiler = definition as ControllerDefinition;

val blockSolar as int[IItemStack] = {
    <minecraft:glowstone> : 10
};

var world = crafttweaker.world.IWorld.getFromID(0);

/*
val getSolerEff = function(controller as Controller) as int{
    var controller_x = controller.pos.getX();
    var controller_y = controller.pos.getY();
    var controller_z = controller.pos.getZ();
    var solareff_result = 0;
    for i in 0 to 2 {
        for j in 0 to 2{
            controller_x += i - 1;
            controller_z += j - 1;
            var block = controller.world.getBlock(controller_x,controller_y + 2,controller_z);
            for key,value in blockSolar{
                var key_block = key.asBlock();
                if ( key_block.displayName == block.displayName){
                    solareff_result += value;
                }
            }
        }
    }
    return solareff_result;
};
*/
boiler.recipeMap.start()
    .duration(1)
    .inputFluids(<liquid:water>)
    .outputFluids(<liquid:steam>)
    .buildAndRegister();



boiler.setupRecipe = function (recipeLogic as RecipeLogic, recipe as Recipe) as bool {
    val controller = recipeLogic.controller;
    if world.isDayTime() return true;
    print(world.isDayTime());
    return false;
} as ISetupRecipe;

/*
boiler.setupRecipe = function (recipeLogic as RecipeLogic, recipe as Recipe) as bool {
    val controller = recipeLogic.controller;
    val controller_x = controller.pos.getX();
    val controller_y = controller.pos.getY();
    val controller_z = controller.pos.getZ();
    val controller_data = controller.world.getBlock(controller_x,controller_y,controller_z).data;
    val solareff = getSolerEff(controller);
    var tank_data = controller_data.trait.fluid._.Tanks as IData;
    var steam_tank_data = tank_data[1];
    var steam_tank_data_new = {
        FluidName : "steam",
        Amount : steam_tank_data.Amount.asInt() + solareff - 1
    } as IData;
    steam_tank_data += steam_tank_data_new
    return true;
} as ISetupRecipe;
*/
/*
{
    id:"exoticfactory:bug_summoning_altar",
    x:-271,
    y:64,
    z:519,
    ForgeCaps:{},
    loc:"exoticfactory:primitive_large_solar_boiler",
    frontFacing:2b,
    ownerMost:-9182460778340595436L,
    ownerLeast:-8560099516515399816L,
    mbd_def:"exoticfactory:primitive_large_solar_boiler",
    trait:{
        fluid:{
            _:{
                TankAmount:2,
                Tanks:[
                    {
                        FluidName:"water",
                        Amount:1000
                    },
                    {
                        Empty:""
                    }
                ]
            }
        }
    }
}
*/