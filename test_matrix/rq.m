function z = rq(A,x)
%RQ      Rayleigh quotient.
%        RQ(A,x) is the Rayleigh quotient of A and x, x'*A*x/(x'*x).

%        Called by FV.

z = x'*A*x/(x'*x);
