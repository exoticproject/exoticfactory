#priority 8000

import mods.requious.ComponentFace;
import mods.requious.AssemblyRecipe;
import mods.requious.SlotVisual;
import mods.requious.Random;
import mods.requious.RecipeContainer;
import mods.requious.Assembly;

var basic_sum = <assembly:basic_bug_summoning_chamber>;
basic_sum.setItemSlot(4,2, ComponentFace.side(),512).setAccess(true, false).setGroup("input");
basic_sum.setItemSlot(3,2, ComponentFace.side(),512).setAccess(true, false).setGroup("input");
basic_sum.setEnergySlot(2,2,ComponentFace.all(),25600).setAccess(true,false).setGroup("input");
basic_sum.setDurationSlot(5,2).setVisual(SlotVisual.arrowRight()).setGroup("duration");
basic_sum.setItemSlot(6,2,ComponentFace.all(),64).setAccess(false, true).setHandAccess(false, true).setGroup("output_bug");

basic_sum.setJEIItemSlot(4,1,"input");
basic_sum.setJEIItemSlot(3,1,"input");
basic_sum.setJEIEnergySlot(2,1,"input");
basic_sum.setJEIDurationSlot(5,1,"duration",SlotVisual.arrowRight());
basic_sum.setJEIItemSlot(6,1,"output_bug");

global addBugSummoningChamber as function(Assembly,int,string[],int)void = function (machine as Assembly,energy as int,bug_list as string[],duration as int) as void{


    for orename in bug_list {
        var summoning = mods.requious.AssemblyRecipe.create(function(container) {
            container.addItemOutput("output_bug",oreDict["bug" + orename].firstItem);
        })
        .requireItem("input",oreDict["oreBox" + orename] * 10)
        .requireItem("input",oreDict["block" + orename] * 256)
        .requireDuration("duration",duration)
        .requireEnergy("input",energy);

        var summoningJEI = mods.requious.AssemblyRecipe.create(function(container) {
            container.addItemOutput("output_bug",oreDict["bug" + orename].firstItem);
        })
        .requireItem("input",oreDict["oreBox" + orename] * 10)
        .requireItem("input",oreDict["block" + orename] * 256)
        .requireDuration("duration",duration)
        .requireEnergy("input",energy);

        machine.addRecipe(summoning);
        machine.addJEIRecipe(summoningJEI);
    }
};