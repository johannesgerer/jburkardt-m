function value = r8vec_in_ab ( n, x, a, b )

%*****************************************************************************80
%
%% R8VEC_IN_AB is TRUE if the entries of an R8VEC are in the range [A,B].
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 March 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries in the vector.
%
%    Input, real X(N), the vector.
%
%    Input, real A, B, the limits, with A <= B.
%
%    Output, logical VALUE, is TRUE if every entry is
%    between A and B.
%
  if ( any ( x(1:n) < a | b < x(1:n) ) )
    value = 0;
  else
    value = 1;
  end

  return
end
