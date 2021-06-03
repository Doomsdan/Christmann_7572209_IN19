function strout = resampleTest(frequenz,struct)
%RESAMPLETEST Summary of this function goes here
%   Detailed explanation goes here
fn = fieldnames(struct);


for i = 1:numel(fn)
    if fn{i} ~= "name"
        speed = getSampleSpeed(fn{i});
        sped = speed{1,1};
        spd = double(string(sped{1,1}));
        data = struct.(fn{i});
        if mod(length(data),10) == 9 
            data = [data;0];
        end
        time = 1000000/spd;
        freq = 1000*frequenz;
        sampledList = resample(data,freq,time);
        strout.(fn{i}) = sampledList;
    end
end
        
end

