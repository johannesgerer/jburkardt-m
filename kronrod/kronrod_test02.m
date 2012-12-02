function kronrod_test02 ( )

%*****************************************************************************80
%
%% KRONROD_TEST02 tests the code for the even case N = 4.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 August 2010
%
%  Author:
%
%    John Burkardt
%
  n = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1,  'KRONROD_TEST02\n' );
  fprintf ( 1,  '  Request KRONROD to compute the Gauss rule\n' );
  fprintf ( 1,  '  of order 4, and the Kronrod extension of\n' );
  fprintf ( 1,  '  order 4+5=9.\n' );

  tol = 0.000001;

  [ x, w1, w2 ] = kronrod ( n, tol );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  KRONROD returns 3 vectors of length %d\n', n + 1 );
  fprintf ( 1, '\n' );
  fprintf ( 1,  '     I      X               WK              WG\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n + 1
    fprintf ( 1, '  %4d  %14f  %14f  %14f\n', i, x(i), w1(i), w2(i) );
  end

  return
end
