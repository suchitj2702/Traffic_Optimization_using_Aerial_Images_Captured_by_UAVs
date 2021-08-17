%
% disp(tr_time)

function time = trafficTime(day, time, threshold)
day = char(day);
time = char(time);
trafficWeights = trafficLightWeight(day, time);
category_k = {0 1 2 3 4 5 6 7 8 9 10};
category_v =[1 1 1 1 2 2 3 3 4 4 5];
%category_v = ['VS','VS','VS','VS','S','S','M','M','L','L','VL'];
durationMap = containers.Map(category_k, category_v);

time_category = {['D' 'D' 'D' 'D' 'C'],['D' 'D' 'D' 'C' 'C'],['D' 'D' 'C' 'C' 'I'],['D' 'C' 'C' 'I' 'I'],['C' 'C' 'I' 'I' 'I'];};

time = [];
k = {'D', 'C', 'I'};
v = [threshold*0.8 threshold*1 threshold*1.2];
timeMap = containers.Map(k, v);

for i= 1:3
    index_previous = durationMap(trafficWeights(1,i));
    index_next = durationMap(trafficWeights(1,i+1));
    time = [time timeMap(time_category{index_previous}(1,index_next))];
end

index_previous = durationMap(trafficWeights(1,4));
index_next = durationMap(trafficWeights(1,1));
time = [double(time) double(timeMap(time_category{index_previous}(1,index_next)))];
end

function tlw = trafficLightWeight(day, time)

weights = {{[3 7 6 3]},{[4 7 6 6]},{[5 7 7 9]},{[4 9 5 6]},{[4 7 8 6]},{[6 9 9 4]},{[2 6 6 7]};
    {[5 5 6 7]},{[7 8 6 6]},{[5 5 4 9]},{[6 5 7 8]},{[9 8 7 8]},{[7 7 8 9]},{[7 7 6 7]};
    {[7 4 5 6]},{[6 7 5 6]},{[5 6 5 7]},{[7 5 6 5]},{[7 9 7 6]},{[8 8 8 9]},{[6 6 7 8]};
    {[7 5 7 5]},{[6 6 4 7]},{[8 8 7 6]},{[7 7 7 6]},{[8 7 7 6]},{[7 8 7 8]},{[9 7 8 7]};
    {[4 6 7 5]},{[6 7 5 7]},{[7 6 7 6]},{[8 8 7 7]},{[5 5 7 9]},{[4 7 5 8]},{[6 7 8 8]};
    {[4 5 4 3]},{[2 4 3 4]},{[1 3 4 2]},{[0 2 4 2]},{[4 0 1 3]},{[2 3 4 0]},{[2 2 2 1]};
    {[2 1 1 1]},{[1 3 2 1]},{[1 0 1 2]},{[2 2 1 3]},{[1 1 2 4]},{[4 3 2 1]},{[1 4 2 3]};
          };

%       weights = {{[70 80 50 60]},{[70 50 60 60]},{[60 50 70 90]},{[90 40 50 60]},{[70 50 80 60]},{[60 50 90 80]},{[70 50 60 70]};
%           {[55 50 30 70]},{[70 80 35 60]},{[50 50 30 40]},{[60 55 75 80]},{[60 50 70 80]},{[70 70 40 40]},{[50 60 70 40]};
%           {[70 40 50 60]},{[60 50 50 60]},{[40 30 50 70]},{[70 50 60 50]},{[70 60 70 60]},{[60 50 30 90]},{[60 40 70 80]};
%           {[70 50 40 55]},{[60 40 45 20]},{[40 45 60 70]},{[45 70 70 40]},{[60 70 70 65]},{[70 85 75 85]},{[95 55 45 70]};
%           {[40 60 70 50]},{[60 70 50 70]},{[70 60 70 60]},{[80 60 75 50]},{[50 50 75 90]},{[40 70 50 80]},{[60 70 80 80]};
%           {[40 50 40 30]},{[20 40 30 40]},{[15 30 30 20]},{[0 25 40 20]},{[40 0 15 30]},{[20 35 40 0]},{[20 20 20 15]};
%           {[20 40 30 10]},{[10 30 40 10]},{[10 0 10 20]},{[20 25 15 30]},{[15 15 40 30]},{[40 30 25 15]},{[15 4 25 30]};
%           };

day_k = {'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'};
day_v = [1 2 3 4 5 6 7];
day_Map = containers.Map(day_k,day_v);

k = {'9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23'};
v = [1 1 2 2 3 3 4 4 5 5 6 6 7 7 7];
timeMap = containers.Map(k, v);

tlw = weights{day_Map(day),timeMap(time)}{1};

end

