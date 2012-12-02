function test_interp_nd_test03 ( m, n )

%*****************************************************************************80
%
%% TEST_INTERP_ND_TEST03 samples each derivative component in M dimensions, at N points.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 August 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the number of evaluation points.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_INTERP_ND_TEST03\n' );
  fprintf ( 1, '  P00_F evaluates derivative components.\n' );
  fprintf ( 1, '  Here, we use spatial dimension M = %d\n', m );
  fprintf ( 1, '  The number of points is N = %d\n', n );

  seed = 123456789;
  [ x, seed ] = r8mat_uniform_01 ( m, n, seed );

  prob_num = p00_prob_num ( );

  for prob = 1 : prob_num

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Problem %d\n', prob );

    [ c, seed ] = p00_c ( prob, m, seed );
    r8vec_print ( m, c, '  C parameters:' );

    [ w, seed ] = p00_w ( prob, m, seed );
    r8vec_print ( m, w, '  W parameters:' );

    fprintf ( 1, '\n' );
    fprintf ( 1, '                        X(1)      X(2) ...\n' );
    fprintf ( 1, '      F(X)           dFdX(1)   dFdX(2) ...\n' );
    fprintf ( 1, '\n' );

    f = p00_f ( prob, m, c, w, n, x );

    d = zeros ( m, n );
    for id = 1 : m
      d(id,1:n) = p00_d ( prob, m, id, c, w, n, x );
    end

    for j = 1 : n
      fprintf ( 1, '                  ' );
      for i = 1 : m
        fprintf ( 1, '  %8.4f', x(i,j) );
      end
      fprintf ( 1, '\n' );

      fprintf ( 1, '  %14g  ', f(j) );
      for i = 1 : m
        fprintf ( 1, '  %8.4f', d(i,j) );
      end
      fprintf ( 1, '\n' );
    end

  end

  return
end
