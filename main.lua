-- Force re-enable jump button
local StarterGui = game:GetService("StarterGui")
StarterGui:SetCore("TouchControlsEnabled", true)

-- Restore jump input manually
local ContextActionService = game:GetService("ContextActionService")

-- Rebind jump action
ContextActionService:UnbindAction("jumpAction") -- just in case it's removed
ContextActionService:BindAction("jumpAction", function(actionName, inputState)
	if inputState == Enum.UserInputState.Begin then
		local player = game.Players.LocalPlayer
		local character = player.Character or player.CharacterAdded:Wait()
		local humanoid = character:FindFirstChildOfClass("Humanoid")
		if humanoid then
			humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
		end
	end
end, true, Enum.KeyCode.Space, Enum.KeyCode.ButtonA, Enum.KeyCode.DPadUp, Enum.UserInputType.Touch)
