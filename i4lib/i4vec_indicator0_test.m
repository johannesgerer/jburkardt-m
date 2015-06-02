function i4vec_indicator0_test ( )

%*****************************************************************************80
%
%% I4VEC_INDICATOR0_TEST tests I4VEC_INDICATOR0;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 September 2014
%
%  Author:
%
%    John Burkardt
%
  n = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'I4VEC_INDICATOR0_TEST\n' );
  fprintf ( 1, '  I4VEC_INDICATOR0 returns an indicator vector.\n' );

  a = i4vec_indicator0 ( n );
 
  i4vec_print ( n, a, '  The "indicator0" vector:' );

  return
end
