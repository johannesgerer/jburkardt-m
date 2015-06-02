function c8mat_exp_story ( test )

%*****************************************************************************80
%
%% C8MAT_EXP_STORY prints explanatory text for each problem.
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
  if ( test == 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  This matrix is diagonal.\n' );
    fprintf ( 1, '  The diagonal entries are real.\n' );
  elseif ( test == 2 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  This matrix is diagonal.\n' );
    fprintf ( 1, '  The diagonal entries are pure imaginary.\n' );
  elseif ( test == 3 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  This matrix is diagonal.\n' );
    fprintf ( 1, '  The diagonal entries are complex.\n' );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'C8MAT_EXP_STORY - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of TEST = %d\n', test );
    error ( 'C8MAT_EXP_STORY - Fatal error!' );
  end

  return
end
