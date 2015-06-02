function value = minij_condition ( n )

%*****************************************************************************80
%
%% MINIJ_CONDITION returns the L1 condition of the MINIJ matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 February 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Output, real VALUE, the L1 condition.
%
  a_norm = ( n * ( n + 1 ) ) / 2.0;
  if ( n == 1 )
    b_norm = 1.0;
  elseif ( n == 2 )
    b_norm = 3.0;
  else
    b_norm = 4.0;
  end

  value = a_norm * b_norm;

  return
end
