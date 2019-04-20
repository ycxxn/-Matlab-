clear;
clc;

L=1;
delta_t=0.01;
d=3;


Kv=0.5;
Kh=0.5;
Ki=1;%Kh為單數時 系統穩定 7.15.17.19

i=1;
X(i)=0;
Y(i)=0;
Theta=0;
Theta_rad(i)=Theta*pi/180;

xg=10;
yg=10;



for i=1:1:10000
    if i<3000
        xg=10;
        yg=10;
    end
    if i>=3000 && i<5000
        xg=10;
        yg=60;
    end
    if i>=5000 && i<8000
        xg=80;
        yg=80;
    end
    if i>=8000
        xg=50;
        yg=10;
    end
    
    delta_x=xg-X(i);
    delta_y=yg-Y(i);
    
    e=sqrt(delta_x^2+delta_y^2)-d;
    v(i)=Kv*e+Ki*e*delta_t;
    
    dtheta_rad=atan2(delta_y,delta_x);
    gamma_rad(i)=Kh*angdiff(Theta_rad(i),dtheta_rad);
    
    omega_rad=v(i)*tan(gamma_rad(i))/L;
    
    X(i+1)=X(i)+v(i)*cos(Theta_rad(i))*delta_t;
    Y(i+1)=Y(i)+v(i)*sin(Theta_rad(i))*delta_t;
    Theta_rad(i+1)=Theta_rad(i)+omega_rad*delta_t;
   
end
    K=[10:1:80]
    Ky=2*K/7+400/7;
    R=[50:1:80]
    Ry=7*R/3-320/3
    plot([10,10],[10,60],'r--')
    hold on
    plot(K,Ky,'r--')
    hold on;
    plot(R,Ry,'r--')
    hold on;
    plot(X,Y,"b");
    axis([-10,80,-10,80]);
    grid on;