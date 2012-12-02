function value = i4vec_ascends ( n, x )

%*****************************************************************************80
%
%% I4VEC_ASCENDS is TRUE if an integer vector is increasing.
%
%  Example:
%
%    X = ( 9, 7, 7, 3, 2, 1, -8 )
%
%    I4VEC_ASCENDS = FALSE
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 June 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the size of the array.
%
%    Input, integer X(N), the array to be examined.
%
%    Output, logical VALUE, is TRUE if the entries of X ascend.
%
  for i = 1 : n-1
    if ( x(i+1) < x(i) )
      value = 0;
      return
    end
  end

  value = 1;

  return
end
