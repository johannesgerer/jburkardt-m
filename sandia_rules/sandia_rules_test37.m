function test37 ( )

%*****************************************************************************80
%
%% TEST37 checks that the HGK weights are correctly scaled.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 October 2011
%
%  Author:
%
%    John Burkardt
%
  order = [ 1, 3, 9, 19, 35, 37, 41, 43 ];
  sqrtpi = sqrt ( pi );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST37\n' );
  fprintf ( 1, '  HERMITE_GENZ_KEISTER_LOOKUP_WEIGHTS looks up weights\n' );
  fprintf ( 1, '  for Genz-Keister quadrature rules for the Hermite weight function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  This test simply checks that, for each rule, the quadrature\n' );
  fprintf ( 1, '  weights correctly sum to sqrt(pi).\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, ' Index     Order         Sum of Weights\n' );
  fprintf ( 1, '\n' );

  for rule = 1 : 8

    o = order(rule);

    w = hermite_genz_keister_lookup_weights ( o );

    s = sum ( w(1:o) );

    fprintf ( 1, '  %4d  %8d  %14.6g\n', rule, o, s );

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, ' Correct sum:     %14.6g\n', sqrtpi );

  return
end
