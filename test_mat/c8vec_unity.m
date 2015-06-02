function a = c8vec_unity ( n )

%*****************************************************************************80
%
%% C8VEC_UNITY returns the N roots of unity.
%
%  Discussion:
%
%    A(1:N) = exp ( 2 * PI * (0:N-1) / N )
%
%    A(1:N)^N = ( (1,0), (1,0), ..., (1,0) ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 September 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of elements of A.
%
%    Output, complex A(N,1), the N roots of unity.
%
  x = 0 : 2 : 2 * n - 2;
  theta = pi * ( x' ) / n;
  a(1:n,1) = cos ( theta ) + i * sin ( theta );

  return
end
