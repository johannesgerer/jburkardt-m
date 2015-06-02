function a = c8mat_exp_a ( test, n )

%*****************************************************************************80
%
%% C8MAT_EXP_A returns the matrix for a given test.
%
%  Discussion:
%
%    1) Diagonal, real;
%    2) Diagonal, pure imaginary.
%    3) Diagonal, complex.
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
%    Input, integer N, the order of the matrix.
%
%    Output, real A(N,N), the matrix.
%
  if ( test == 1 )
    a = [ 1,  0;
          0,  2 ];
  elseif ( test == 2 )
    a = [  3 * i,  0;
           0,   - 4 * i ];
  elseif ( test == 3 )
    a = [  5 + 6 * i,    0;
          0,  7 - 8 * i ];
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'C8MAT_EXP_A - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of TEST = %d\n', test );
    error ( 'C8MAT_EXP_A - Fatal error!' );
  end

  return
end
