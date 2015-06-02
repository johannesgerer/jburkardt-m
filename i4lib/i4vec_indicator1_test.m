function i4vec_indicator1_test ( )

%*****************************************************************************80
%
%% I4VEC_INDICATOR1_TEST tests I4VEC_INDICATOR1;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 May 2015
%
%  Author:
%
%    John Burkardt
%
  n = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'I4VEC_INDICATOR1_TEST\n' );
  fprintf ( 1, '  I4VEC_INDICATOR1 returns an indicator vector.\n' );

  a = i4vec_indicator1 ( n );
 
  i4vec_print ( n, a, '  The "indicator1" vector:' );

  return
end
