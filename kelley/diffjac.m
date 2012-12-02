function [ l, u ] = diffjac ( x, f, f0 )

%% DIFFJAC computes and factors the jacobian of a function.
%
%  Discussion:
%
%    A forward difference estimate is used.
%
%    The routine DIRDER is needed to compute the directional derivative
%    that defines each column of the jacobian estimate.
%
%  Disclaimer:
%
%    This code comes with no guarantee or warranty of any kind.
%
%  Author:
%
%    Tim Kelley
%
%  Reference:
%
%    Tim Kelley,
%    Iterative Methods for Linear and Nonlinear Equations,
%    SIAM, 2004,
%    ISBN: 0898713528,
%    LC: QA297.8.K45.
%
%  Parameters:
%
%    Input, real X(N), the point at which the jacobian is estimated.
%
%    Input, function F ( X ), the function whose jacobian is to be estimated.
%
%    Input, real F0(N), the value of F(X).
%
%    Output, real L(N,N), U(N,N), the LU factorization of the 
%    (approximate) jacobian.
%
  n = length ( x );

  for j = 1 : n
    zz = zeros ( n, 1 );
    zz(j) = 1;
    jac(:,j) = dirder ( x, zz, f, f0 );
  end

  [ l, u ] = lu ( jac );
