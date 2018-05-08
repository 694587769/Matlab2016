# Matlab2016
Matlab Code

%%这是计算λ2远大于λ1时的情况
clear
clc
%考虑lambda2>>lambda1,即Ic>>Is,n=20
N=1440; n=5; m=1;
[Vp,Ip,Is,Ic,Zs,Zc]=rand_Is_Ic(N,n,m);
B1=0;B2=0;B3=0;
fanshu=norm(Ic)/norm(Is);
Is_Ic=0;
for j=1:N
Is_Ic=Is_Ic+Is(j)*Ic(j)';
end
%对Vp，Ip归一化
A11=0;A12=0;A21=0;A22=0;
for j=1:N
    A11=A11+abs(Vp(j))^2;
    A12=A12+Vp(j)*Ip(j)';
    A21=A12+Vp(j)'*Ip(j);
    A22=A22+abs(Ip(j))^2;
    
end


% AA=[A11 A12;
%     A21 A22];
% AA_rank=rank(AA);
% [U,S,V]=svd(AA);

mapminmax(Vp);
mapminmax(Ip);

for j=1:N
    abs_square_Ip(j)=abs(Ip(j))^2;
    B3=B3+abs_square_Ip(j);
    abs_square_Vp(j)=abs(Vp(j))^2;
    B1=B1+abs_square_Vp(j);
    Vp_Ip(j)=Vp(j)*(Ip(j)');
    B2=B2+Vp_Ip(j);
end
lambda2=0;Zu=0;lambda1=0;
Zu=(-B1/B2)';
cha=abs(Zs-Zu)/abs(Zs);
