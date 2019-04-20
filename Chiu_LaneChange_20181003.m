v=10;
gamma=20;
L=0.4;
theta=0;
omega=tan(gamma*pi/180)/L;

i=1;
Px(i)=0;
Py(i)=0;
Theta(i)=0;
SteeringAngle(i)=0;

for i=1:1:100 %³æ¦ì¬°²@¬íms
    if i<30
        SteeringAngle(i)=0;
    elseif (i>=30)&&(i<40)
        SteeringAngle(i)=10;
    elseif (i>=40)&&(i<50)
        SteeringAngle(i)=0;
    elseif (i>=50)&&(i<60)
        SteeringAngle(i)=-10;
    elseif (i>=60)
        SteeringAngle(i)=0;
    end
        
    omega=tan(SteeringAngle(i)*pi/180)/L;
        
    x=cos(Theta(i)*pi/180)*v*0.1;
    y=sin(Theta(i)*pi/180)*v*0.1;
    theta=omega*v*0.1;
    Px(i+1)=Px(i)+x;
    Py(i+1)=Py(i)+y;
    Theta(i+1)=Theta(i)+theta;
end
subplot(3,1,1)
plot(Px,Py)
title('Car Motion')
grid on	;
subplot(3,1,2)
plot(Theta)
axis([ 0 , 100 , -0.5 , 5 ]);
grid on	;
subplot(3,1,3)
plot(SteeringAngle)
axis([ 0 , 100 , -13 , 13 ]);
grid on	;

