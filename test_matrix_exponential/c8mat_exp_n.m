function n = c8mat_exp_n ( test )

%*****************************************************************************80
%
%% C8MAT_EXP_N returns the matrix order for a given test.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 March 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer TEST, the index of the test case.
%
%    Output, integer N, the order of the matrix.
%
  if ( test == 1 )
    n = 2;
  elseif ( test == 2 )
    n = 2;
  elseif ( test == 3 )
    n = 2;
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'C8MAT_EXP_N - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of TEST = %d\n', test );
    error ( 'C8MAT_EXP_N - Fatal error!' );
  end

  return
end
