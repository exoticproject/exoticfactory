#priority 8000


import mods.requious.ComponentFace;
import mods.requious.AssemblyRecipe;
import mods.requious.SlotVisual;
import mods.requious.Random;
import mods.requious.RecipeContainer;
import mods.requious.Assembly;
import crafttweaker.liquid.ILiquidStack;

var basic_work = <assembly:basic_bug_working_chamber>;

basic_work.setItemSlot(3,2, ComponentFace.side(),64).setAccess(true, false).setGroup("input");
basic_work.setFluidSlot(2,2, ComponentFace.side(),8000).setAccess(true, false).setGroup("input");
basic_work.setEnergySlot(1,2,ComponentFace.all(),25600).setAccess(true,false).setGroup("input");
basic_work.setDurationSlot(4,2).setVisual(SlotVisual.arrowRight()).setGroup("duration");
basic_work.setItemSlot(5,2,ComponentFace.all(),256).setAccess(false, true).setHandAccess(false, true).setGroup("output");
basic_work.setItemSlot(6,2,ComponentFace.all(),256).setAccess(false, true).setHandAccess(false, true).setGroup("output");
basic_work.setItemSlot(7,2,ComponentFace.all(),64).setAccess(false, true).setHandAccess(false, true).setGroup("output_bug");

basic_work.setJEIItemSlot(3,1,"input");
basic_work.setJEIFluidSlot(2,1,"input");
basic_work.setJEIEnergySlot(1,1,"input");
basic_work.setJEIDurationSlot(4,1,"duration",SlotVisual.arrowRight());
basic_work.setJEIItemSlot(5,1,"output");
basic_work.setJEIItemSlot(6,1,"output_bug");



global addBugWorkingChamber as function(Assembly,float,int,string[],float[ILiquidStack],int,int,int)void = function (machine as Assembly,bonus_chance as float,energy as int,bug_list as string[],bns_list as float[ILiquidStack],out_min as int,out_max as int,duration as int) as void{
    for orename in bug_list {
        for bns_liquid,chance in bns_list{
        var final_chance = chance + bonus_chance;
        var mining = mods.requious.AssemblyRecipe.create(function(container) {
            var amount = container.random.nextInt(out_max) + out_min;
            container.addItemOutput("output",oreDict["virtualore" + orename].firstItem * amount);
            if(container.random.nextDouble() <= final_chance){
                container.addItemOutput("output_bug",oreDict["bug" + orename].firstItem);
            }
        })
        .requireItem("input",oreDict["bug" + orename])
        .requireFluid("input",bns_liquid)
        .requireDuration("duration",duration)
        .requireEnergy("input",energy);

        var miningJEI = mods.requious.AssemblyRecipe.create(function(container) {
            container.addItemOutput("output",oreDict["virtualore" + orename].firstItem.withLore(["§b§lRandom Output: " ~ out_min ~ "~" ~ out_max]) * out_min);
            container.addItemOutput("output_bug",oreDict["bug" + orename].firstItem.withLore(["§b§lReturn Chance: " ~ final_chance * 100 ~"%"]));
        })
        .requireItem("input",oreDict["bug" + orename])
        .requireFluid("input",bns_liquid)
        .requireDuration("duration",duration)
        .requireEnergy("input",energy);

        machine.addRecipe(mining);
        machine.addJEIRecipe(miningJEI);
        }
    }
};