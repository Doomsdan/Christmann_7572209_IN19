function filteredData = filterOutBadData(data,startValue)
%FILTEROUTBADDATA Summary of this function goes here
%   Detailed explanation goes here
a = data.engine_timestamp_4_Timestamp1000_;
index = a > startValue - 1 ;
filteredData = data(index,:);

end

