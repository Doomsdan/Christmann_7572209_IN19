function data = createTimeline(data,frequenz)
%CREATETIMELINE Summary of this function goes here
%   Detailed explanation goes here
timeline = 0:1/frequenz:(height(data)-1)/frequenz;
data.timeline = timeline.';

end

