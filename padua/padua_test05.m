function padua_test05 ( )

%*****************************************************************************80
%
%% PADUA_TEST05 tests PADUA_WEIGHTS and PADUA_WEIGHTS_SET.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 June 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PADUA_TEST05\n' );
  fprintf ( 1, '  PADUA_WEIGHTS computes the weights of a Padua rule.\n' );
  fprintf ( 1, '  PADUA_WEIGHTS_SET looks them up in a table.\n' );
 
  for l = 3 : 4
    n = padua_order ( l );
    w1 = padua_weights ( l );
    w2 = padua_weights_set ( l );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Level %d  Padua weights\n', l );
    fprintf ( 1, '\n' );
    diff = 0.0;
    for j = 1 : n
      diff = max ( diff, abs ( w1(j) - w2(j) ) );
      fprintf ( 1, '  %4d  %14.6g  %14.6g\n', j, w1(j), w2(j) );
    end
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Maximum difference = %g\n', diff );
  end

  return
end
