clear,clc;

L=0.4;

i=1;
Px(i)=5;
Py(i)=8;
Theta(i)=200;
Theta_rad(i)=Theta(i)*pi/180;

Kv=0.5;
Kh=1;
xg=5;
yg=5;

delta_x=xg-Px(i);
delta_y=yg-Py(i);
for j=1:1:4
    i=1;
    if j==1
        Px(i)=5;
        Py(i)=8;
        Theta(i)=200;
        Theta_rad(i)=Theta(i)*pi/180;
    end
    if j==2
        Px(i)=5;
        Py(i)=2;
        Theta(i)=20;
        Theta_rad(i)=Theta(i)*pi/180;
    end
    if j==3
        Px(i)=8;
        Py(i)=5;
        Theta(i)=110;
        Theta_rad(i)=Theta(i)*pi/180;
    end
    if j==4
        Px(i)=2;
        Py(i)=5;
        Theta(i)=290;
        Theta_rad(i)=Theta(i)*pi/180;
    end
    
    for i=1:1:200
    %³æ¦ì¬°²@¬íms
    v=Kv*sqrt(delta_x^2+delta_y^2);
    dTheta_rad=atan2(delta_y,delta_x);
    gamma_rad=Kh*angdiff(Theta_rad(i),dTheta_rad);
    
    omega_rad=tan(gamma_rad)/L;
    
    
    
    x=cos(Theta_rad(i))*v*0.1;
    y=sin(Theta_rad(i))*v*0.1;
    theta_rad=omega_rad*v*0.1;
    Px(i+1)=Px(i)+x;
    Py(i+1)=Py(i)+y;
    Theta_rad(i+1)=Theta_rad(i)+theta_rad;
    
    delta_x=xg-Px(i+1);
    delta_y=yg-Py(i+1);
    end
    
    plot(Px,Py)
    xlabel('x');  
    ylabel('y');
    title('Moving a Point')
    grid on	;
    axis([0 , 10 , 0 , 10])
    hold on;
end
