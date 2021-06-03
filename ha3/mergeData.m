function data = mergeData(data,newData)
%MERGEDATA Summary of this function goes here
%   Detailed explanation goes here
index = ismember(newData,data);
newData = newData(index,:);
data = [data;newData];
end

