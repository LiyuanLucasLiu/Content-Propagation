function [cy, cent] = CPIP_SI( c, f, l, lambda )
%this is an application of CPIP_SI
%	Input	:	c 		: 	the number of communities;
% 				f 		: 	the feature of notes, a n * m metrix;
% 				l 		: 	the topogical structure of the network, a n * n metrix;
% 				lambda 	: 	the parameter of CPIP_PI;
%	Output	:	cy 		:	the idx of detected communities
%				cent	:	the expectation of received centent propagation	

if nargin< 4, lambda= 0.1;end

lambda= 1/ lambda;
n= size(l, 1);
l= l+ l'+ eye(n);
l= l> 0;
p= l./ repmat(sum(l, 1), n, 1);
if(size(f, 1)== n)
    f= f';
end
q= lambda* eye(n);
q= diag(q);
I= eye(n);

r= inv(diag(q)* (I- p)+ p);
s= r;
nf= f* s;

q= sqrt(s);
A= f* q;
A= A'* A;
[U, E]= eigs(A, c);
K1= U.* conj(U);

cf= nf* K1;

[cy, cent]= get_community(nf, cf', c);

end
