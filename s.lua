local Players = game:GetService("Players")
local l__Remotes__15 = game:GetService("ReplicatedStorage"):WaitForChild("Remotes");
local UI = require(Players.LocalPlayer.PlayerScripts.Controller.UI);
local Items = nil

function GetInfoOfItems(ItemID)
    local ItemInfo = l__Remotes__15.RequestItemInfo:InvokeServer({
        itemId = ItemID
    });
    return ItemInfo;
end

function BuyItem(itemid,price)
    local xd = game:GetService("ReplicatedStorage").Remotes.PurchaseItem:InvokeServer({
        ["expectedPrice"] = price,
        ["itemId"] = itemid
    })
    print(xd.error)
end

function BuyNewItem(xd)
  task.wait(0.1)
   BuyItem(xd.id,GetInfoOfItems(xd.id).price)
end

l__Remotes__15.NewItemNotification.OnClientEvent:Connect(BuyNewItem);
