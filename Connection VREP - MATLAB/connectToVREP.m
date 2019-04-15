%% Create a connection To V-REP using remote API
vrep = remApi('remoteApi');
vrep.simxFinish(-1); %close all connections from the past
clientID=vrep.simxStart('127.0.0.1',19999,true,true,5000,5); %New connection

if clientID > -1    %In case of an error because ID is always positive
    t = timer('ExecutionMode', 'FixedRate','Period', 0.01,'TimerFcn', {@Command}, 'StartDelay', 3);
    Q = {q1 q2 q3 q4 q5 q6 clientID vrep t};
    t.UserData = Q;
    start(t)
end