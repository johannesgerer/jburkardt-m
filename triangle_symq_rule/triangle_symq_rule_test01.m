function triangle_symq_rule_test01 ( )

%*****************************************************************************80
%
%% TRIANGLE_SYMQ_RULE_TEST01 tests TRIANGLE_TO_SIMPLEX, TRIANGLE_TO_REF, REF_TO_TRIANGLE, SIMPLEX_TO_TRIANGLE.
%
%  Licensing:
%
%    This code is distributed under the GNU GPL license.
%
%  Modified:
%
%    27 June 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRIANGLE_SYMQ_RULE_TEST01\n' );
  fprintf ( 1, '  Map points from one triangle to another.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  R = reference triangle\n' );
  fprintf ( 1, '  S = simplex\n' );
  fprintf ( 1, '  T = user-defined triangle.\n' );
  fprintf ( 1, '  REF_TO_TRIANGLE:     R => T\n' );
  fprintf ( 1, '  SIMPLEX_TO_TRIANGLE: S => T\n' );
  fprintf ( 1, '  TRIANGLE_TO_REF:     T => R\n' );
  fprintf ( 1, '  TRIANGLE_TO_SIMPLEX: T => S\n' );
%
%  Reference triangle
%
  rv1(1) = -1.0;
  rv1(2) = -1.0 / sqrt ( 3.0 );
  rv2(1) = +1.0;
  rv2(2) = -1.0 / sqrt ( 3.0 );
  rv3(1) =  0.0;
  rv3(2) =  2.0 / sqrt ( 3.0 );
%
%  Simplex
%
  sv1(1) = 0.0;
  sv1(2) = 0.0;
  sv2(1) = 1.0;
  sv2(2) = 0.0;
  sv3(1) = 0.0;
  sv3(2) = 1.0;
%
%  User triangle.
%
  tv1(1) = 1.0;
  tv1(2) = 0.0;
  tv2(1) = 4.0;
  tv2(2) = 4.0;
  tv3(1) = 0.0;
  tv3(2) = 3.0;

  seed = 123456789;

  for i = 1 : 5

    [ sp1, seed ] = r8vec_uniform_01 ( 2, seed );

    if ( 1.0 < sp1(1) + sp1(2) )
      sp1(1) = 1.0 - sp1(1);
      sp1(2) = 1.0 - sp1(2);
    end

    tp1 = simplex_to_triangle ( tv1, tv2, tv3, sp1 );
    rp1 = triangle_to_ref ( tv1, tv2, tv3, tp1 );
    tp2 = ref_to_triangle ( tv1, tv2, tv3, rp1 );
    sp2 = triangle_to_simplex ( tv1, tv2, tv3, tp2 );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  SP1: %10.4f  %10.4f\n', sp1(1:2) );
    fprintf ( 1, '  TP1: %10.4f  %10.4f\n', tp1(1:2) );
    fprintf ( 1, '  RP1: %10.4f  %10.4f\n', rp1(1:2) );
    fprintf ( 1, '  TP2: %10.4f  %10.4f\n', tp2(1:2) );
    fprintf ( 1, '  SP2: %10.4f  %10.4f\n', sp2(1:2) );

  end

  return
end
