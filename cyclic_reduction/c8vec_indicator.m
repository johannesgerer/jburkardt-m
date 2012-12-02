function a = c8vec_indicator ( n )

%*****************************************************************************80
%
%% C8VEC_INDICATOR sets a C8VEC to the indicator vector.
%
%  Discussion:
%
%    X(1:N) = ( 1-1i, 2-2i, 3-3i, 4-4i, ... )
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
%    Output, complex A(N), the array to be initialized.
%
  a = zeros ( n, 1 );

  for j = 1 : n
    a(j) = j - j * i;
  end

  return
end
