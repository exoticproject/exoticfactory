#priority 8000

import mods.requious.ComponentFace;
import mods.requious.AssemblyRecipe;
import mods.requious.SlotVisual;
import mods.requious.Random;
import mods.requious.RecipeContainer;
import mods.requious.Assembly;

createBugSummoningChamber(<assembly:basic_bug_summoning_chamber>,25600,bug_basic,200);

global createBugSummoningChamber as function(Assembly,int,string[],int)void = function (machine as Assembly,energy as int,bug_list as string[],duration as int) as void{
    machine.setItemSlot(4,2, ComponentFace.side(),512).setAccess(true, false).setGroup("input");
    machine.setItemSlot(3,2, ComponentFace.side(),512).setAccess(true, false).setGroup("input");
    machine.setEnergySlot(2,2,ComponentFace.all(),energy).setAccess(true,false).setGroup("input");
    machine.setDurationSlot(5,2).setVisual(SlotVisual.arrowRight()).setGroup("duration");
    machine.setItemSlot(6,2,ComponentFace.all(),64).setAccess(false, true).setHandAccess(false, true).setGroup("output_bug");

    machine.setJEIItemSlot(5,1,"input");
    machine.setJEIItemSlot(4,1,"input");
    machine.setJEIEnergySlot(3,1,"input");
    machine.setJEIDurationSlot(6,1,"duration",SlotVisual.arrowRight());
    machine.setJEIItemSlot(7,1,"output_bug");

    for orename in bug_list {
        var summoning = mods.requious.AssemblyRecipe.create(function(container) {
            container.addItemOutput("output_bug",oreDict["bug" + orename].firstItem);
        })
        .requireItem("input",oreDict["oreBox" + orename] * 10)
        .requireItem("input",oreDict["block" + orename] * 512)
        .requireDuration("duration",duration)
        .requireEnergy("input",energy);

        var summoningJEI = mods.requious.AssemblyRecipe.create(function(container) {
            container.addItemOutput("output_bug",oreDict["bug" + orename].firstItem);
        })
        .requireItem("input",oreDict["oreBox" + orename] * 10)
        .requireItem("input",oreDict["block" + orename] * 512)
        .requireDuration("duration",duration)
        .requireEnergy("input",energy);

        machine.addRecipe(summoning);
        machine.addJEIRecipe(summoningJEI);
    }
};