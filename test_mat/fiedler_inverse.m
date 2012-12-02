function a = fiedler_inverse ( n, x )

%*****************************************************************************80
%
%% FIEDLER_INVERSE returns the inverse of the Fiedler matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Input, real X(N), the values that define A.
%
%    Output, real A(N,N), the matrix.
%
  a(1:n,1:n) = 0.0;

  d1 = 0.5 / ( x(n) - x(1) );
  d2 = 0.5 / ( x(1) - x(2) );

  a(1,n) = + d1;
  a(1,1) = + d1 + d2;
  a(1,2) =      - d2;

  for i = 2 : n - 1
    d1 = 0.5 / ( x(i-1) - x(i) );
    d2 = 0.5 / ( x(i) - x(i+1) );
    a(i,i-1) = - d1;
    a(i,i)   = + d1 + d2;
    a(i,i+1) =      - d2;
  end

  d1 = 0.5 / ( x(n-1) - x(n) );
  d2 = 0.5 / ( x(n)   - x(1) );

  a(n,n-1) = - d1;
  a(n,n)   =   d1 + d2;
  a(n,1)   =      + d2;

  return
end
