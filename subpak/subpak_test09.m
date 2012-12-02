function subpak_test09 ( )

%*****************************************************************************80
%
%% TEST09 tests GAUSS_SUM
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 April 2009
%
%  Author:
%
%    John Burkardt
%
  ndim = 2;
  n = 3;

  amplitude = [ 10.0, 5.0, -3.0 ];
  center = [ 2.0, 3.0; 5.0, 8.0; 7.0, 5.0 ]';
  width = [ 1.0, 2.0, 4.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST09\n' );
  fprintf ( 1, '  GAUSS_SUM evaluates a function which is the sum of\n' );
  fprintf ( 1, '  Gaussian functions.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of component Gaussians = %d\n', n );
  fprintf ( 1, '\n' );
  fprintf ( 1, '          Center    Amplitude  Width\n' );
  fprintf ( 1, '        X       Y\n' );
  fprintf ( 1, '\n' );
  for j = 1 : n
    fprintf ( 1, '  %2d  %6f  %6f  %6f  %6f\n', ...
      j, center(1,j), center(2,j), amplitude(j), width(j) );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '      X       Y        Gauss_Sum(X,Y)\n' );
  fprintf ( 1, '\n' );

  for i = 0 : 10
    x(1) = i;
    for j = 0 : 10
      x(2) = j;
      gxy = gauss_sum ( ndim, n, amplitude, center, width, x );
      fprintf ( 1, '  %6f  %6f  %14f\n', x(1), x(2), gxy );
    end
  end

  return
end
