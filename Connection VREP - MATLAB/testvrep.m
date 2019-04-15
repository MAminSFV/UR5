vrep = remApi('remoteApi');
vrep.simxFinish(-1);
clientID=vrep.simxStart('127.0.0.1',19999,true,true,5000,5);

if clientID > -1
    for i = 1:6
    %Get Joint Handles
    [returnCode,handle(i)]=vrep.simxGetObjectHandle(clientID,['UR5_joint',num2str(i)],vrep.simx_opmode_blocking);
    vrep.simxSetJointPosition(clientID,handle(i),pi/6,vrep.simx_opmode_oneshot); 
    end
end