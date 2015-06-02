function r8lib_test119 ( )

%*****************************************************************************80
%
%% R8LIB_TEST119 tests R8VEC_EVEN3.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2009
%
%  Author:
%
%    John Burkardt
%
  nold = 4;
  nval = 12;

  xold = [ 0.0, 5.1, 7.0, 10.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8LIB_TEST119\n' );
  fprintf ( 1, '  R8VEC_EVEN3 tries to evenly interpolate new data\n' );
  fprintf ( 1, '  between old values.\n' );
 
  r8vec_print ( nold, xold, '  Original vector:' );

  xval = r8vec_even3 ( nold, nval, xold );
 
  r8vec_print ( nval, xval, '  New vector:' );
 
  return
end
