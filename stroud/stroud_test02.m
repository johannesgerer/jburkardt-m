function stroud_test02 ( )

%*****************************************************************************80
%
%% TEST02 tests BALL_MONOMIAL_ND.
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
  n = 3;

  r = 2.0;
  xc(1:n) = [ 0.0, 0.0, 0.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST02\n' );
  fprintf ( 1, '  For the integral of a monomial in a ball in ND:\n' );
  fprintf ( 1, '  BALL_MONOMIAL_ND approximates the integral.\n' );
  fprintf ( 1, '  BALL_F1_ND, which can handle general integrands,\n' );
  fprintf ( 1, '    will be used for comparison.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension N = %d\n', n );
  fprintf ( 1, '  Ball radius = %f\n', r )
  fprintf ( 1, '  Ball volume = %f\n', ball_volume_nd ( n, r ) );
  fprintf ( 1, '\n' );
  fprintf ( 1, '        Rule:	   MONOMIAL	      BALL_F1_ND\n' );
  fprintf ( 1, '        F(X)\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 4

    if ( i == 1 )
      string = '1';
      p = [ 0, 0, 0 ];
      result2 = ball_f1_nd ( 'mono_000_3d', n, xc, r );
    elseif ( i == 2 )
      string = 'xyz';
      p = [ 1, 1, 1 ];
      result2 = ball_f1_nd ( 'mono_111_3d', n, xc, r );
    elseif ( i == 3 )
      string = 'x^2z^2';
      p = [ 2, 0, 2 ];
      result2 = ball_f1_nd ( 'mono_202_3d', n, xc, r );
    elseif ( i == 4 )
      string = 'x^4y^2z^2';
      p = [ 4, 2, 2 ];
      result2 = ball_f1_nd ( 'mono_422_3d', n, xc, r );
    end

    result1 = ball_monomial_nd ( n, p, r );

    fprintf ( 1, '  %10s  %14f  %14f\n', string, result1, result2 );

  end

  return
end
