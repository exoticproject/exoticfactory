#priority 9900

import crafttweaker.item.IItemDefinition;
import crafttweaker.oredict.IOreDict;
import crafttweaker.item.IItemStack;

var removedict_array as IItemStack[] = [
    <thermalfoundation:material:24>,
    <thermalfoundation:material:261>,
    <thermalfoundation:material:257>,
    <thermalfoundation:material:27>,
    <thermalfoundation:material:258>,
    <thermalfoundation:material:25>,
    <thermalfoundation:material:256>,
    <thermalfoundation:material:289>,
    <thermalfoundation:material:259>,
    <thermalfoundation:material:291>,
    <thermalfoundation:material:288>,
    <thermalfoundation:material:263>,
    <thermalfoundation:material:290>,
    <thermalfoundation:material:26>,
    <thermalfoundation:material:262>,
    <thermalfoundation:material:320>,
    <thermalfoundation:material:323>,
    <thermalfoundation:material:32>,
    <thermalfoundation:material:352>,
    <thermalfoundation:material:355>,
    <thermalfoundation:material:322>,
    <thermalfoundation:material:326>,
    <thermalfoundation:material:321>,
    <thermalfoundation:material:327>,
    <thermalfoundation:material:325>,
    <thermalfoundation:material:353>,
    <thermalfoundation:material:33>,
    <thermalfoundation:material:71>,
    <thermalfoundation:material:69>,
    <thermalfoundation:material:70>,
    <thermalfoundation:material:768>,
    <thermalfoundation:material:769>,
    <thermalfoundation:material:770>,
    <thermalfoundation:material:65>,
    <thermalfoundation:material>,
    <thermalfoundation:material:96>,
    <thermalfoundation:material:1>,
    <thermalfoundation:material:67>,
    <thermalfoundation:material:99>,
    <thermalfoundation:material:64>,
    <thermalfoundation:material:97>,
    <thermalfoundation:material:98>,
    <thermalfoundation:material:66>,
    <thermalfoundation:material:160>,
    <thermalfoundation:material:163>,
    <thermalfoundation:material:130>,
    <thermalfoundation:material:162>,
    <thermalfoundation:material:131>,
    <thermalfoundation:material:135>,
    <thermalfoundation:material:128>,
    <thermalfoundation:material:129>,
    <thermalfoundation:material:134>,
    <thermalfoundation:material:133>,
    <thermalfoundation:material:161>,
    <thermalfoundation:storage:3>,
    <thermalfoundation:storage:5>,
    <thermalfoundation:storage:7>,
    <thermalfoundation:storage:2>,
    <thermalfoundation:storage:1>,
    <thermalfoundation:storage:6>,
    <thermalfoundation:storage_alloy:3>,
    <thermalfoundation:storage_alloy:2>,
    <thermalfoundation:storage_alloy:1>,
    <thermalfoundation:storage_alloy>,
    <thermalfoundation:storage_resource>,
    <thermalfoundation:material:192>,
    <thermalfoundation:material:16>,
    <thermalfoundation:material:225>,
    <thermalfoundation:material:17>,
    <thermalfoundation:material:226>,
    <thermalfoundation:material:195>,
    <thermalfoundation:material:194>,
    <thermalfoundation:material:193>,
    <thermalfoundation:material:197>,
    <thermalfoundation:material:199>,
    <thermalfoundation:material:224>,
    <thermalfoundation:material:198>,
    <thermalfoundation:material:227>,
    <thermalfoundation:material:354>,
    <thermalfoundation:ore:2>,
    <thermalfoundation:ore:6>,
    <thermalfoundation:ore:7>,
    <thermalfoundation:ore:5>,
    <thermalfoundation:ore>,
    <thermalfoundation:ore:3>,
    <thermalfoundation:ore:1>


];

var categoly_array as string[] = [
    "thermalexpansion.furnace",
    "thermalexpansion.furnace_food",
    "thermalexpansion.furnace_ore",
    "thermalexpansion.furnace_pyrolysis",
    "thermalexpansion.pulverizer",
    "thermalexpansion.pulverizer_petrotheum",
    "thermalexpansion.sawmill",
    "thermalexpansion.sawmill_tapper",
    "thermalexpansion.smelter",
    "thermalexpansion.smelter_pyrotheum",
    "thermalexpansion.compactor",
    "thermalexpansion.compactor_mint",
    "thermalexpansion.compactor_gear",
    "thermalexpansion.crucible",
    "thermalexpansion.crucible_lava",
    "thermalexpansion.refinery",
    "thermalexpansion.refinery_fossil",
    "thermalexpansion.refinery_potion",
    "thermalexpansion.transposer_fill",
    "thermalexpansion.transposer_extract",
    "thermalexpansion.centrifuge",
    "thermalexpansion.centrifuge_mobs",
    "thermalexpansion.brewer",
    "thermalexpansion.precipitator",
    "thermalexpansion.extruder",
    "thermalexpansion.extruder_sedimentary",
    "thermalexpansion.reactant",
    "thermalexpansion.reactant_elemental",
    "thermalexpansion.enervation",
    "thermalexpansion.factorizer_combine",
    "thermalexpansion.factorizer_split"
];

for a in categoly_array{
    mods.jei.JEI.hideCategory(a);
}


for a in removedict_array{
    var oredictlist = a.definition.ores;
    for b in oredictlist{
        b.remove(a);
    }
    mods.jei.JEI.removeAndHide(a);
}

