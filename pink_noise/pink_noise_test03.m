function pink_noise_test03 ( )

%*****************************************************************************80
%
%% TEST03 tests RANH.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 May 2010
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST03\n' );
  fprintf ( 1, '  RANH is a random hold function.\n' );
  fprintf ( 1, '  Given a value U and a delay D, it returns the value\n' );
  fprintf ( 1, '  U for D calls, then resets U.\n' );

  for d = 5 : -1 : 1
    fprintf ( 1, '\n' );
    fprintf ( 1, '   I   D   Q      U           Y\n' );
    fprintf ( 1, '\n' );
    u = 0.5;
    q = 3;
    for i = 1 : 20
      [ y, u, q ] = ranh ( d, u, q );
      fprintf ( 1, '  %2d  %2d  %2d  %10f  %10f\n', i, d, q, u, y );
    end
  end

  return
end