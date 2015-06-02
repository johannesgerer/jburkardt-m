function r8vec_dif_test ( )

%*****************************************************************************80
%
%% R8VEC_DIF_TEST tests R8VEC_DIF.
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
  n = 4;
  h = 0.01;
  x = 1.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8VEC_DIF_TEST\n' );
  fprintf ( 1, '  R8VEC_DIF estimates derivatives.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Estimate the derivative of order N = %d\n', n );
  fprintf ( 1, '  Using H = %f\n', h );
  fprintf ( 1, '  at argument X = %f\n', x );
%
%  Get the coefficients.
%
  cof = r8vec_dif ( n, h );

  r8vec_print ( n+1, cof, '  The difference coefficients:' );

  fdif = 0.0;
  for i = 0 : n
    xi = x + ( 2 * i - n ) * h;
    fdif = fdif + cof(i+1) * r8vec_dif_f ( xi );
  end
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Estimate is FDIF = %f\n', fdif );
 
  return
end
