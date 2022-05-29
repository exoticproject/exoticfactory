#priority 9900
import mods.gregtech.machine.MachineBuilder;
import mods.gregtech.recipe.RecipeMapBuilder;
import mods.gregtech.recipe.RecipeMaps;
import mods.gregtech.recipe.RecipeMap;
import mods.gregtech.machine.Renderer;

global machine_assembler_recipe as RecipeMap = RecipeMapBuilder.create("machine_assembler_recipe")
    .setInputs(9)
    .setOutputs(1)
    .setFluidInputs(1)
    .build();

global parts_assembler_recipe as RecipeMap = RecipeMapBuilder.create("parts_assembler_recipe")
    .setInputs(9)
    .setOutputs(1)
    .setFluidInputs(1)
    .build();

global infinity_solar_generator_recipe as RecipeMap = RecipeMapBuilder.create("infinity_solar_generator_recipe")
    .setInputs(1)
    .setFluidOutputs(1)
    .build();



MachineBuilder.create(32000, "machine_assembler")
    .setRecipeMap(machine_assembler_recipe)
    .setRenderer("machines/assembler")
    .addTier(1,2,3,4,5,6,7,8,9)
    .addSteamTier(true)
    .buildAndRegister();

MachineBuilder.create(32020, "parts_assembler")
    .setRecipeMap(parts_assembler_recipe)
    .setRenderer("machines/assembler")
    .addTier(1,2,3,4,5,6,7,8,9)
    .addSteamTier(true)
    .buildAndRegister();