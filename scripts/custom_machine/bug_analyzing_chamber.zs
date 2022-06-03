#priority 8000

import mods.requious.ComponentFace;
import mods.requious.AssemblyRecipe;
import mods.requious.SlotVisual;
import mods.requious.Random;
import mods.requious.RecipeContainer;
import mods.requious.Assembly;
import crafttweaker.item.IItemStack;

var basic_analyzing = <assembly:basic_bug_analyzing_chamber>;
basic_analyzing.setItemSlot(3,2, ComponentFace.side(),64).setAccess(true, false).setGroup("input");
basic_analyzing.setEnergySlot(2,2,ComponentFace.all(),25600).setAccess(true,false).setGroup("input");
basic_analyzing.setDurationSlot(4,2).setVisual(SlotVisual.arrowRight()).setGroup("duration");
basic_analyzing.setItemSlot(5,2,ComponentFace.all(),64).setAccess(false, true).setHandAccess(false, true).setGroup("output");
basic_analyzing.setFluidSlot(6,2, ComponentFace.side(),1600).setAccess(true, false).setGroup("output");
basic_analyzing.setSelectionSlot(2,1,"modes",0).setGroup("mode").setMaxSelection(1);
basic_analyzing.setSelectionSlot(3,1,"modes",1).setGroup("mode");

basic_analyzing.setJEIItemSlot(3,1,"input");
basic_analyzing.setJEIFluidSlot(6,1,"output");
basic_analyzing.setJEIEnergySlot(2,1,"input");
basic_analyzing.setJEIDurationSlot(4,1,"duration",SlotVisual.arrowRight());
basic_analyzing.setJEIItemSlot(5,1,"output");
basic_analyzing.setJEISelectionSlot(3,0,"mode");

global addBugAnalyzingChamber_matter as function(Assembly,int,int[IItemStack],int,float)void = function (machine as Assembly,energy as int,matter_items as int[IItemStack],duration as int,chance as float) as void{
    for item_name,matter_amount in matter_items {
        var analyzing_matter = mods.requious.AssemblyRecipe.create(function(container) {
            if(container.random.nextDouble() <= chance){
                container.addFluidOutput("output",<liquid:bugmatter> * matter_amount);
            }
            
        })
        .requireSelection("mode",<minecraft:dirt>.withDisplayName("§rMatter Mode"),false)
        .requireItem("input",item_name)
        .requireDuration("duration",duration)
        .requireEnergy("input",energy);

        var analyzing_matterJEI = mods.requious.AssemblyRecipe.create(function(container) {
            container.addFluidOutput("output",<liquid:bugmatter> * matter_amount);
            container.addItemOutput("output",<minecraft:paper>.withLore(["§e§lLiquid Produce Chance: " ~ chance * 100 ~"%"]));
        })
        .requireSelection("mode",<minecraft:dirt>.withDisplayName("§rMatter Mode"),false)
        .requireItem("input",item_name)
        .requireDuration("duration",duration)
        .requireEnergy("input",energy);
        machine.addRecipe(analyzing_matter);
        machine.addJEIRecipe(analyzing_matterJEI);
    }
};


global addBugAnalyzingChamber_data as function(Assembly,int,string[],int)void = function (machine as Assembly,energy as int,bug_list as string[],duration as int) as void{
    for ore_name in bug_list {
        var analyzing_data = mods.requious.AssemblyRecipe.create(function(container) {
            container.addItemOutput("output",oreDict["bugData" + ore_name].firstItem);
        })
        .requireSelection("mode",oreDict["bugDataSalt"].firstItem.withDisplayName("§rData Mode"),false)
        .requireItem("input",oreDict["bug" + ore_name] * 8)
        .requireDuration("duration",duration)
        .requireEnergy("input",energy);

        var analyzing_dataJEI = mods.requious.AssemblyRecipe.create(function(container) {
            container.addItemOutput("output",oreDict["bugData" + ore_name].firstItem);
        })
        .requireSelection("mode",oreDict["bugDataSalt"].firstItem.withDisplayName("§rData Mode"),false)
        .requireItem("input",oreDict["bug" + ore_name] * 8)
        .requireDuration("duration",duration)
        .requireEnergy("input",energy);
        machine.addRecipe(analyzing_data);
        machine.addJEIRecipe(analyzing_dataJEI);
    }
};