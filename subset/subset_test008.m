function subset_test008 ( )

%*****************************************************************************80
%
%% TEST008 tests CFRAC_TO_RFRAC, RFRAC_TO_CFRAC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 April 2009
%
%  Author:
%
%    John Burkardt
%
  maxm = 10;
  m = 3;

  p = [ 1.0, 1.0, 2.0 ];
  q = [ 1.0, 3.0, 1.0, 1.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST008\n' );
  fprintf ( 1, '  CFRAC_TO_RFRAC: continued fraction to ratio;\n' );
  fprintf ( 1, '  RFRAC_TO_CFRAC: ratio to continued fration.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Rational polynomial fraction coefficients:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  P:' );
  for i = 1 : m
    fprintf ( 1, '  %12f', p(i) );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Q:' );
  for i = 1 : m + 1
    fprintf ( 1, '  %12f', q(i) );
  end
  fprintf ( 1, '\n' );
 
  h = rfrac_to_cfrac ( m, p, q );
 
  r8vec_print ( 2*m, h, '  Continued fraction coefficients:' );

  g(1:2*m) = 1.0;

  [ p, q ] = cfrac_to_rfrac ( 2*m, g, h );
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Recovered rational polynomial:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  P:' );
  for i = 1 : m
    fprintf ( 1, '  %12f', p(i) );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Q:' );
  for i = 1 : m + 1
    fprintf ( 1, '  %12f', q(i) );
  end
  fprintf ( 1, '\n' );
 
  return
end
