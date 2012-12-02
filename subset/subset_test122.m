function test122 ( )

%*****************************************************************************80
%
%% TEST122 tests RATMAT_DET.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 April 2009
%
%  Author:
%
%    John Burkardt
%
  n = 6;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST122\n' );
  fprintf ( 1, '  RAT_SUM_FORMULA computes the coefficients for the\n' );
  fprintf ( 1, '  formulas for the sums of powers of integers.\n' );
  
  [ a, b ] = rat_sum_formula ( n );

  ratmat_print ( n+1, n+1, a, b, '  Power Sum Coefficients:' );

  return
end
