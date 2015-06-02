function naca_test03 ( )

%*****************************************************************************80
%
%% NACA_TEST03 displays symmetric and cambered NACA 4 digit airfoils.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 May 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'NACA_TEST03\n' );
  fprintf ( 1, '  Display symmetric and cambered NACA 4 digit airfoils.\n' );
  fprintf ( 1, '\n' );

  codes = [
    0006, 0008, 0009, 0010, 0012, ...
    0015, 0018, 0021, 0024, 1408, ...
    1410, 1412, 2408, 2410, 2411, ...
    2412, 2414, 2415, 2418, 2421, ...
    2424, 4412, 4415, 4418, 4421, ...
    4424, 6409, 6412 ];

  code_num = 28;

  c = 10.0;
  n = 51;
  xc = linspace ( 0.0, c, n );

  for i = 1 : code_num

    code = codes(i);

    fprintf ( 1, '  NACA %04d airfoil.\n', codes(i) );

    [ m, p, t ] = naca4_mpt ( code );

    if ( m == 0.0 )

      y = naca4_symmetric ( t, c, xc );
      plot ( xc, y, 'b-', ...
        xc(n:-1:1), -y(n:-1:1), 'b-', ...
        'Linewidth', 3 );
      s = sprintf ( 'NACA%04d symmetric airfoil', codes(i) );

    else

      [ xu, yu, xl, yl ] = naca4_cambered ( m, p, t, c, xc );
      plot ( xu, yu, 'b-', ...
        xl(n:-1:1), yl(n:-1:1), 'b-', ...
        'Linewidth', 3 );
      s = sprintf ( 'NACA%4d cambered airfoil', codes(i) );

    end

    axis equal
    grid on
    xlabel ( '<---X--->', 'Fontsize', 16 );
    ylabel ( '<---Y--->', 'Fontsize', 16 );
    title ( s, 'Fontsize', 24 );
    pause ( 3 )
    
  end

  return
end
