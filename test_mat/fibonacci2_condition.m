function value = fibonacci2_determinant ( n )

%*****************************************************************************80
%
%% FIBONACCI2_CONDITION returns the L1 condition of the FIBONACCI2 matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 April 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Output, real VALUE, the L1 condition.
%
  if ( n == 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FIBONACCI2_CONDITION - Fatal error!\n' );
    fprintf ( 1, '  The condition number is infinite for N=1\n' );
    error ( 'FIBONACCI2_CONDITION - Fatal error!' )
  end

  if ( n == 1 )
    a_norm = 0.0;
  elseif ( n == 2 )
    a_norm = 2.0;
  else
    a_norm = 3.0;
  end
  b_norm = n;
  value = a_norm * b_norm;

  return
end
