function value = i4vec_maxloc_last ( n, x )

%*****************************************************************************80
%
%% I4VEC_MAXLOC_LAST returns the index of the last maximal integer vector entry.
%
%  Example:
%
%    X = ( 5, 1, 2, 5, 0, 5, 3 )
%
%    I4VEC_MAXLOC_LAST = 6
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 July 2004
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
%    Output, integer VALUE, the index of the last element of
%    X of maximal value.
%
  value = -1;

  for i = 1 : n
    if ( i == 1 )
      value = 1;
      maxval_last = x(1);
    elseif ( maxval_last <= x(i) )
      value = i;
      maxval_last = x(i);
    end
  end

  return
end
