function [ res, jac ] = opt09_rj ( x, flag )

%% OPT09_RJ evaluates RES and JAC for test case #9.
%
%  Discussion:
%
%    This example is known as the trigonometric function.
%
%    This example is discussed on page 362 of Dennis and Schnabel.
%
%  Modified:
%
%    09 January 2008
%
%  Author:
%
%    Jeff Borggaard,
%    Gene Cliff,
%    Virginia Tech.
%
%  Reference:
%
%    John Dennis, Robert Schnabel,
%    Numerical Methods for Unconstrained Optimization 
%    and Nonlinear Equations,
%    SIAM, 1996,
%    ISBN13: 978-0-898713-64-0,
%    LC: QA402.5.D44.
%
%  Parameters:
%
%    Input, real X(N), the evaluation point.
%
%    Input, string FLAG, indicates what must be computed.
%    'f' means only the value of RES is needed,
%    'g' means only the value of JAC is needed,
%    'all' means RES and JAC are needed.
%    It is acceptable to behave as though FLAG was 'all'
%    on every call.
%
%    Output, real RES(N,1), the function column vector.
%
%    Output, real JAC(N,N), the Jacobian matrix.
%
  n = length ( x );

  res = zeros(n,1);

  cos_sum = sum ( cos ( x(1:n) ) );

  for i = 1 : n
    res(i,1) = n + i - cos_sum - i * cos ( x(i) ) - sin ( x(i) );
  end

  jac = zeros(n,n);
  for i = 1 : n
    jac(i,i) = i * sin ( x(i) ) - cos ( x(i) );
    for j = 1 : n
      jac(i,j) = jac(i,j) + sin ( x(j) );
    end
  end
