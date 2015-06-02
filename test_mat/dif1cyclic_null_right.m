function x = dif1cyclic_null_right ( m, n )

%*****************************************************************************80
%
%% DIF1CYCLIC_NULL_RIGHT returns a right null vector of the DIF1CYCLIC matrix.
%
%  Discussion:
%
%    (1,1,1,...,1) is always a null vector.
%
%    If N is even,
%
%    (A,B,A,B,A,B,...,A,B) is also a null vector, for any A and B.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the order of A.
%
%    Output, real X(N,1), the null vector.
%
  if ( mod ( n, 2 ) ~= 0 )
    x = ones ( n, 1 );
  else
    x = zeros ( n, 1 );
    a = 1.0;
    b = 2.0;
    x(1:2:n-1,1) = a;
    x(2:2:n,  1) = b;
  end

  return
end
