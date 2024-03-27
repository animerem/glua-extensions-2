local class = {}
local meta = {__index = class}

function class:Push(item)
	local index = self.Last + 1

	self.Last = index
	self.Items[index] = item
end

function class:Pop()
	local index = self.First

	if index > self.Last then
		return -- Empty
	end

	local item = self.Items[index]

	self.Items[index] = nil
	self.First = index + 1

	return item
end

function class:Count()
	return self.Last - self.First + 1
end

function class:Empty()
	self.First = 0
	self.Last = -1
	table.Empty(self.Items)
end

function util.Queue()
	return setmetatable({
		First = 0,
		Last = -1,
		Items = {}
	}, meta)
end
