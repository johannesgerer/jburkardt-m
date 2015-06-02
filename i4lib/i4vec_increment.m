function x = i4vec_increment ( n, x )

%*****************************************************************************80
%
%% I4VEC_INCREMENT increments an I4VEC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    18 July 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries in the array.
%
%    Input/output, integer X(N), the array to be incremented.
%
  x(1:n) = x(1:n) + 1;

  return
end
