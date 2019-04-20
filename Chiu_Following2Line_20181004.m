clear;
clc;

v=1;
L=0.4;

i=1;
Px(i)=5;
Py(i)=2;
Theta(i)=20;
Theta_rad(i)=Theta(i)*pi/180;

Kv=0.5;
Kh=1;
Kd=1;

xg=5;
yg=5;

a=1;
b=-2;
c=4;

for j=1:1:4
    i=1;
    if j==1
        Px(i)=5;
        Py(i)=7;
        Theta(i)=240;
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
    
    for i=1:1:200   %³æ¦ì¬°²@¬íms
    
    s1=[a,b,c];
    s2=[Px(i),Py(i),1];
    
    d=dot(s1,s2)/sqrt(a^2+b^2);
    
    alpha_d=-Kd*d;
    dTheta_rad=atan2(-a,b);
    alpha_h=Kh*angdiff(Theta_rad(i),dTheta_rad);
    
    gamma_rad=alpha_d+alpha_h;
    
    omega_rad=tan(gamma_rad)/L;
    
    x=cos(Theta_rad(i))*v*0.1;
    y=sin(Theta_rad(i))*v*0.1;
    theta_rad=omega_rad*v*0.1;
    Px(i+1)=Px(i)+x;
    Py(i+1)=Py(i)+y;
    Theta_rad(i+1)=Theta_rad(i)+theta_rad;
    end
    
    x1=linspace(0,10,10);
    plot(x1,0.5*x1+2,"--");
    hold on;
    plot(Px,Py);
    xlabel('x');  
    ylabel('y');
    title('Moving a Point')
    grid on	;
    axis([0 , 10 , 0 , 10])
end