function table_size(tbl)
	local size = 0

	for k, v in pairs(tbl) do
		size = size + 1
	end

	return size
end

function table_is_empty(tbl)
	return table_size(tbl) == 0
end
