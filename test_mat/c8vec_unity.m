function a = c8vec_unity ( n )

%*****************************************************************************80
%
%% C8VEC_UNITY returns the N roots of unity.
%
%  Discussion:
%
%    X(1:N) = exp ( 2 * PI * (0:N-1) / N )
%
%    X(1:N)**N = ( (1,0), (1,0), ..., (1,0) ).
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
%    Output, complex A(N), the N roots of unity.
%
  theta = pi * ( 0 : 2 : 2 * n - 2 ) / n;
  a(1:n) = cos ( theta ) + i * sin ( theta );

  return
end
