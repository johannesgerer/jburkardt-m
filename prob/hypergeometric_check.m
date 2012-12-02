function check = hypergeometric_check ( n, m, l )

%*****************************************************************************80
%
%% HYPERGEOMETRIC_CHECK checks the parameters of the Hypergeometric CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of balls selected.
%    0 <= N <= L.
%
%    Input, integer M, the number of white balls in the population.
%    0 <= M <= L.
%
%    Input, integer L, the number of balls to select from.
%    0 <= L.
%
%    Output, logical CHECK, is true if the parameters are legal.
%
  if ( n < 0 | l < n )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HYPERGEOMETRIC_CHECK - Fatal error!\n' );
    fprintf ( 1, '  Input N is out of range.\n' );
    check = 0;
    return
  end

  if ( m < 0 | l < m )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HYPERGEOMETRIC_CHECK - Fatal error!\n' );
    fprintf ( 1, '  Input M is out of range.\n' );
    check = 0;
    return
  end

  if ( l < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HYPERGEOMETRIC_CHECK - Fatal error!\n' );
    fprintf ( 1, '  Input L is out of range.\n');
    check = 0;
    return
  end

  check = 1;

  return
end
