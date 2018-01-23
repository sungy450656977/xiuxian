local record_装备信息_equipment_info = {}

record_装备信息_equipment_info.id = 0 --id
record_装备信息_equipment_info.start_time = 0 --起始时间
record_装备信息_equipment_info.end_time = 0 --终止时间
record_装备信息_equipment_info.vit_reward = 0 --体力奖励
record_装备信息_equipment_info.gold_reward = 0 --元宝奖励
record_装备信息_equipment_info.desc = "" --客户端显示文字


装备信息_equipment_info = {
	_data = {
	[1] = {1,43200,50400,50,50,"12:00-14:00 午宴",},
	[2] = {2,64800,72000,50,50,"18:00-20:00 晚宴",},
	}
}

local __index_id = {
	[1] = 1,
	[2] = 2,
}

local __key_map = {
	id = 1,
	start_time = 2,
	end_time = 3,
	vit_reward = 4,
	gold_reward = 5,
	desc = 6,
}

local m = {
		__index = function(t,k)
			if k == "toObject"then
			return function()
				local o = {}
				for key, v in pairs (__key_map) do
					o[key] = t._raw[v]
				end
				return o
			end
		end

		assert(__key_map[k], "cannot find ".. k .. " in record_装备信息_equipment_info")
		return t._raw[__key_map[k]]
		end
}

function 装备信息_equipment_info.getLength()
		return #装备信息_equipment_info._data
end
function 装备信息_equipment_info.hasKey(k)
	if __key_map[k] == nil then
		return false  else
	return true
	end
end

function 装备信息_equipment_info.indexOf(index)
		if index == nil then
			return nil
		end
return setmetatable({_raw = 装备信息_equipment_info._data[index]}, m)
end

function 装备信息_equipment_info.get(id)
		return 装备信息_equipment_info.indexOf(__index_id[id])
end

function 装备信息_equipment_info.set(id, key, value)
		local record = 装备信息_equipment_info.get(id)
		if record then
			local keyIndex = __key_map[key]
			if keyIndex then
				record._raw[keyIndex] = value
			end
		end
end

function 装备信息_equipment_info.get_index_data()
    return __index_id
end

