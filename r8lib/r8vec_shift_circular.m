function x = r8vec_shift_circular ( shift, x )

%*****************************************************************************80
%
%% R8VEC_SHIFT_CIRCULAR performs a circular shift on an R8VEC.
%
%  Discussion:
%
%    An R8VEC is a vector of R8 values.
%
%    If X is a matrix, then the shift is applied to each column.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 March 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer SHIFT, the amount by which each entry is to
%    be shifted.  SHIFT should be nonnegative.
%
%    Input/output, real X(N), the vector to be shifted.
%
  [ nrow, ncol ] = size ( x );

  if ( nrow == 1 )
    x = [ x(ncol+1-shift:ncol), x(1:ncol-shift) ];
  elseif ( ncol == 1 )
    x = [ x(nrow+1-shift:nrow); x(1:nrow-shift) ];
  else
    x = [ x(nrow+1-shift:nrow,:); x(1:nrow-shift,:) ];
  end

  return
end
