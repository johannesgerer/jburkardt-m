function sphere_triangle_monte_carlo_test01 ( )

%*****************************************************************************80
%
%% SPHERE_TRIANGLE_MONTE_CARLO_TEST01 estimates some integrals.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 April 2014
%
%  Author:
%
%    John Burkardt
%
  m = 3;
  e_test = [ ...
    0, 0, 0; ...
    2, 0, 0; ...
    0, 2, 0; ...
    0, 0, 2; ...
    4, 0, 0; ...
    2, 2, 0; ...
    0, 0, 4 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST01\n' );
  fprintf ( 1, '  Estimate monomial integrals over a sphere triangle\n' );
  fprintf ( 1, '  using the Monte Carlo method.\n' );

  seed = 123456789;
%
%  Choose three points at random to define a spherical triangle.
%
  [ w1, seed ] = sphere01_sample ( 1, seed );
  [ w2, seed ] = sphere01_sample ( 1, seed );
  [ w3, seed ] = sphere01_sample ( 1, seed );

  wc(1:m,1) = ( w1(1:m) + w2(1:m) + w3(1:m) ) / 3.0;
  wc = r8vec_normalize ( m, wc );
%
%  Shrink triangle by factor F.
%
  shrink = 2.0;

  for k = 1 : 3

    shrink = shrink / 2.0;

    v1(1:m,1) = wc(1:m) + shrink * ( w1(1:m) - wc(1:m) );
    v2(1:m,1) = wc(1:m) + shrink * ( w2(1:m) - wc(1:m) );
    v3(1:m,1) = wc(1:m) + shrink * ( w3(1:m) - wc(1:m) );

    v1 = r8vec_normalize ( m, v1 );
    v2 = r8vec_normalize ( m, v2 );
    v3 = r8vec_normalize ( m, v3 );

    area = sphere01_triangle_vertices_to_area ( v1, v2, v3 );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Vertices of random spherical triangle\n' );
    fprintf ( 1, '  with shrink factor = %g\n', shrink );
    fprintf ( 1, '  and area = %g\n', area );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  V1:  %14.6g  %14.6g  %14.6g\n', v1(1:m) );
    fprintf ( 1, '  V2:  %14.6g  %14.6g  %14.6g\n', v2(1:m) );
    fprintf ( 1, '  V3:  %14.6g  %14.6g  %14.6g\n', v3(1:m) );
%
%  Estimate integrals.
%
    fprintf ( 1, '\n' );
    fprintf ( 1, '         N        1              X^2             Y^2' );
    fprintf ( 1, '             Z^2             X^4           X^2Y^2           Z^4\n' );
    fprintf ( 1, '\n' );

    n = 1;

    while ( n <= 4 * 65536 )

      [ x, seed ] = sphere01_triangle_sample ( n, v1, v2, v3, seed );
      fprintf ( 1, '  %8d', n );

      for j = 1 : 7

        e(1:m) = e_test(1:m,j);

        value = monomial_value ( m, n, e, x );

        result(j) = area * sum ( value(1:n) ) / n;

        fprintf ( 1, '  %14.6g', result );

      end

      fprintf ( 1, '\n' );

      n = 2 * n;

    end

  end

  return
end
