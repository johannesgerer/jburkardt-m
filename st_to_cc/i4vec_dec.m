function x = i4vec_dec ( n, x )

%*****************************************************************************80
%
%% I4VEC_DEC decrements an I4VEC.
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
%    Input/output, integer X(N), the array to be decremented.
%
  x(1:n) = x(1:n) - 1;

  return
end
