%% 
% *����Ώ�*

A=[0 1 0;0 0 1;-2 -3 -1],B=[0;0;1],C=[2 1 1]
%% 
% ���䐫�s��Uc�Ƃ��̃����N

Uc=[B,A*B,A^2*B], rank(Uc)
%% 
% �ϑ����s��Uo�Ƃ��̃����N

Uo=[C;C*A;C*A^2], rank(Uo)
%% 
% �V�X�e���̌ŗL�l�i�Ɂj

eig(A)
%% 
% �C���p���X����

sys0 = ss(A,B,C,0);
impulse(sys0,10)
%% 
% *�ɔz�u*

p1 =-8.88
p2 = -10.6
p3 = -35.6
p = [p1,p2,p3];
K1 = place(A,B,p)
sys1 = ss(A-B*K1,B,C,0);
impulse(sys1,10)
%% 
% *�œK���M�����[�^*

Q = 10*eye(3);
R = 9.2;
K2 = lqr(sys0,Q,R)
sys2 = ss(A-B*K2,B,C,0);
impulse(sys2,10)