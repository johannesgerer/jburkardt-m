function ax = atx_121 ( x )

%% ATX_121 computes A*x where A is the -1,2-1 matrix.
%
%  Modified:
%
%    17 June 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X(N,1), the column vector to be multiplied.
%
%    Output, real AX(N,1), the product A*X.
%
  n = length ( x );

  ax(1:n,1)   =               2.0 * x(1:n,1);
  ax(1:n-1,1) = ax(1:n-1,1) -       x(2:n,1);
  ax(2:n,1)   = ax(2:n,1)   -       x(1:n-1,1);
