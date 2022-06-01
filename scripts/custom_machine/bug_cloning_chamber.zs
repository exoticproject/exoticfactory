#priority 8000

import mods.requious.ComponentFace;
import mods.requious.AssemblyRecipe;
import mods.requious.SlotVisual;
import mods.requious.Random;
import mods.requious.RecipeContainer;
import mods.requious.Assembly;

var basic_cloning = <assembly:basic_bug_cloning_chamber>;
basic_cloning.setItemSlot(4,2, ComponentFace.side(),1).setAccess(true, false).setGroup("input");
basic_cloning.setFluidSlot(3,2, ComponentFace.side(),800).setAccess(true, false).setGroup("input");
basic_cloning.setEnergySlot(2,2,ComponentFace.all(),25600).setAccess(true,false).setGroup("input");
basic_cloning.setDurationSlot(5,2).setVisual(SlotVisual.arrowRight()).setGroup("duration");
basic_cloning.setItemSlot(6,2,ComponentFace.all(),64).setAccess(false, true).setHandAccess(false, true).setGroup("output_bug");

basic_cloning.setJEIItemSlot(4,1,"input");
basic_cloning.setJEIFluidSlot(3,1,"input");
basic_cloning.setJEIEnergySlot(2,1,"input");
basic_cloning.setJEIDurationSlot(5,1,"duration",SlotVisual.arrowRight());
basic_cloning.setJEIItemSlot(6,1,"output_bug");

global addBugCloningChamber as function(Assembly,int,string[],int,int)void = function (machine as Assembly,energy as int,bug_list as string[],duration as int,cost as int) as void{

    for orename in bug_list {
        var cloning = mods.requious.AssemblyRecipe.create(function(container) {
            container.addItemOutput("output_bug",oreDict["bug" + orename].firstItem);
        })
        .requireItem("input",oreDict["bugData" + orename] * 1,0,0)
        .requireFluid("input",<liquid:bugmatter> * cost)
        .requireDuration("duration",duration)
        .requireEnergy("input",energy);

        var cloningJEI = mods.requious.AssemblyRecipe.create(function(container) {
            container.addItemOutput("output_bug",oreDict["bug" + orename].firstItem);
        })
        .requireItem("input",oreDict["bugData" + orename].firstItem.withLore(["§e§lNot Consume"]) * 1,0,0)
        .requireFluid("input",<liquid:bugmatter> * cost)
        .requireDuration("duration",duration)
        .requireEnergy("input",energy);

        machine.addRecipe(cloning);
        machine.addJEIRecipe(cloningJEI);
    }
};