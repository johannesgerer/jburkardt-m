function stroud_test26 ( )

%*****************************************************************************80
%
%% TEST26 tests QMULT_1D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    06 April 2009
%
%  Author:
%
%    John Burkardt
%
  num = function_1d_num ( );

  a = -1.0;
  b = 1.0;
 
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST26\n' );
  fprintf ( 1, '  QMULT_1D approximates an integral on a\n' );
  fprintf ( 1, '    one-dimensional interval.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  We use the interval:\n' );
  fprintf ( 1, '  A = %f\n', a );
  fprintf ( 1, '  B = %f\n', b );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    F(X)     QMULT_1D\n' );
  fprintf ( 1, '\n' );
 
  for i = 1 : num

    function_1d_set ( 'SET', i );

    result = qmult_1d ( 'function_1d', a, b );

    fname = function_1d_name ( i );

    fprintf ( 1, '  %s  %12f\n', fname, result );
 
  end

  return
end
