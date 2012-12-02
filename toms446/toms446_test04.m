function toms446_test04 ( )

%*****************************************************************************80
%
%% TOMS446_TEST04 tests EDCHEB, which evaluates the derivative of a Chebyshev series.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 September 2011
%
%  Author:
%
%    John Burkardt
%
  nf = 5;
  npl = 10;

  nx = 6;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TOMS446_TEST04\n' );
  fprintf ( 1, '  Test EDCHEB, which evaluates the \n' );
  fprintf ( 1, '  derivative of a Chebyshev series.\n' );

  x = cheby ( nf, npl, @functn );

  for j = 1 : nf

    x2(1:npl) = x(1:npl,j);

    fprintf ( 1, '\n' );
    if ( j == 1 )
      fprintf ( 1, '  d/dx Sin(x)\n' );
    elseif ( j == 2 )
      fprintf ( 1, '  d/dx Cos(x)\n' );
    elseif ( j == 3 )
      fprintf ( 1, '  d/dx Sin(2x)\n' );
    elseif ( j == 4 )
      fprintf ( 1, '  d/dx Cos(2x)\n' );
    elseif ( j == 5 )
      fprintf ( 1, '  d/dx x^5\n' );
    end

    fprintf ( 1, '\n' );

    for k = 1 : nx

      xval = 2.0 * ( k - 1 ) / ( nx - 1 ) - 1.0;

      fxj = functn_d ( xval );

      fval = edcheb ( xval, x2, npl );

      fprintf ( 1, '  %10.4f  %10.4f  %10.4f\n', xval, fxj(j), fval );

    end

  end

  return
end
