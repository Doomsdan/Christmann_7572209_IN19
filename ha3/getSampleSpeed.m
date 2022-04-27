function speed = getSampleSpeed(name)
%GETSAMPLESPEED Summary of this function goes here
%   Detailed explanation goes here
ts = regexp(name,'Timestamp[0-9]*','match');
speed = regexp(ts,'[0-9]*','match');
end

