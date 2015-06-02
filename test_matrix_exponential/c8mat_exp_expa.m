function expa = c8mat_exp_expa ( test, n )

%*****************************************************************************80
%
%% C8MAT_EXP_EXPA returns the "exact" exponential matrix for a given test.
%
%  Discussion:
%
%    1) Diagonal, real.
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
%    Output, complex EXPA(N,N), the exponential of the test matrix.
%
  expa = [];

  if ( test == 1 )
    expa = [ ...
      2.718281828459046, ...
      0; ...
      0, ...                 
      7.389056098930650 ];
  elseif ( test == 2 )
    expa = [ ...
      -0.989992496600446 + 0.141120008059 * i, ...
       0.0; ...
       0.0, ...
      -0.653643620863612 + 0.756802495307928 * i ];
  elseif ( test == 3 )
    expa = [ ...
       142.501905518208 - 41.468936789923 * i, ...
         0.0; ...
         0.0, ...
      -159.560161626987 - 1084.963058811836 * i ];
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'C8MAT_EXP_EXPA - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of TEST = %d\n', test );
    error ( 'C8MAT_EXP_EXPA - Fatal error!' );
  end

  return
end
