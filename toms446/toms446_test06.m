function toms446_test06 ( )

%*****************************************************************************80
%
%% TOMS446_TEST06 tests NTGRT, which computes the Chebyshev series of an indefinite integral.
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

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TOMS446_TEST06\n' );
  fprintf ( 1, '  Test NTGRT, which computes the\n' );
  fprintf ( 1, '  Chebyshev series for the indefinite\n' );
  fprintf ( 1, '  integral of several functions.\n' );

  x = cheby ( nf, npl, @functn );

  for j = 1 : nf
    x2(1:npl) = x(1:npl,j);
    x2 = ntgrt ( x2, npl );
    x(1:npl,j) = x2(1:npl);
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Series for indefinite integral of:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '        Sin(x)      Cos(x)    Sin(2x)     Cos(2x)       X^5\n' );
  fprintf ( 1, '\n' );

  for i = 1 : npl
    fprintf ( 1, '  %10.4f  %10.4f  %10.4f  %10.4f  %10.4f\n', x(i,1:nf) );
  end

  return;
end
