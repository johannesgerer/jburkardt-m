function n = r8mat_exp_n ( test )

%*****************************************************************************80
%
%% R8MAT_EXP_N returns the matrix order for a given test.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 October 2012
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
  elseif ( test == 4 )
    n = 2;
  elseif ( test == 5 )
    n = 4;
  elseif ( test == 6 )
    n = 2;
  elseif ( test == 7 )
    n = 2;
  elseif ( test == 8 )
    n = 3;
  elseif ( test == 9 )
    n = 4;
  elseif ( test == 10 )
    n = 3;
  elseif ( test == 11 )
    n = 3;
  elseif ( test == 12 )
    n = 3;
  elseif ( test == 13 )
    n = 10;
  elseif ( test == 14 )
    n = 3;
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8MAT_EXP_N - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of TEST = %d\n', test );
    error ( 'R8MAT_EXP_N - Fatal error!' );
  end

  return
end
