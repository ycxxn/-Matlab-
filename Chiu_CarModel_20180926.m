v=10;
gamma=20;
L=0.4;
theta=0;
omega=tan(gamma*pi/180)/L;

i=1;
Px(i)=0;
Py(i)=0;
Theta=0;

for i=1:1:100 %³æ¦ì¬°²@¬íms
    x=cos(Theta*pi/180)*v*0.1;
    y=sin(Theta*pi/180)*v*0.1;
    theta=omega*v*0.1;
    Px(i+1)=Px(i)+x;
    Py(i+1)=Py(i)+y;
    Theta=Theta+theta;
end
plot(Px,Py,"o")
xlabel('x');  
ylabel('y');
title('Car Motion')
grid on	;

