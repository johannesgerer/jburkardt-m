function value = biw_condition ( n )

%*****************************************************************************80
%
%% BIW_CONDITION computes the L1 condition of the BIW matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 April 2015
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
  if ( n == 1 )
    a_norm = 0.6;
  else
    a_norm = 1.6;
  end

  b_norm = 0.0;
  j = n;
  for i = n : -1 : 1
    aii = 0.5 + i / ( 10 * n );
    if ( i == j )
      bij = 1.0 / aii;
    elseif ( i < j )
      bij = bij / aii;
    end
    b_norm = b_norm + abs ( bij );
  end

  value = a_norm * b_norm;

  return
end
