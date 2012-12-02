function x = dif1cyclic_null ( n )

%*****************************************************************************80
%
%% DIF1CYCLIC_NULL returns a null vector of the cyclic first difference matrix.
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
%    Input, integer N, the order of A.
%
%    Output, real X(N), the null vector.
%
  if ( mod ( n, 2 ) ~= 0 )
    x(1:n) = 1.0;
  else
    a = 1.0;
    b = 2.0;
    x(1:2:n-1) = a;
    x(2:2:n  ) = b;
  end

  return
end
