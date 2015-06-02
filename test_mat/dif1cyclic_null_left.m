function x = dif1cyclic_null_left ( m, n )

%*****************************************************************************80
%
%% DIF1CYCLIC_NULL_LEFT returns a left null vector of the DIF1CYCLIC matrix.
%
%  Discussion:
%
%    (1,1,1,...,1) is always a null vector.
%
%    If M is even,
%
%    (A,B,A,B,A,B,...,A,B) is also a null vector, for any A and B.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 March 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the order of A.
%
%    Output, real X(M,1), the null vector.
%
  x = zeros ( m, 1 );

  if ( mod ( m, 2 ) ~= 0 )
    x(1:m,1) = 1.0;
  else
    a = 1.0;
    b = 2.0;
    x(1:2:m-1,1) = a;
    x(2:2:m,  1) = b;
  end

  return
end
